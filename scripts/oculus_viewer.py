#!/usr/bin/python3
import numpy as np
import cv2
from scipy.interpolate import interp1d

import rospy
import cv_bridge
from sonar_oculus.msg import OculusPing
from sensor_msgs.msg import Image
from dynamic_reconfigure.server import Server

REVERSE_Z = 1
global res, height, rows, width, cols, map_x, map_y, map_x_, map_y_, f_bearings
res, height, rows, width, cols = None, None, None, None, None
map_x, map_y = None, None
f_bearings = None

bridge = cv_bridge.CvBridge()

to_rad = lambda bearing: bearing * np.pi / 18000


def generate_map_xy(ping):
    _res = ping.range_resolution
    _height = ping.num_ranges * _res
    _rows = ping.num_ranges
    _width = np.sin(
        to_rad(ping.bearings[-1] - ping.bearings[0]) / 2) * _height * 2
    _cols = int(np.ceil(_width / _res))

    global res, height, rows, width, cols, map_x, map_y, map_x_, map_y_, f_bearings
    if res == _res and height == _height and rows == _rows and width == _width and cols == _cols:
        return
    res, height, rows, width, cols = _res, _height, _rows, _width, _cols
    # print("res=%s, height=%s, width=%s, rows=%s, cols=%s" %(res, height,width, rows,cols))
    #   res=0.014991194990459488, height=9.999127058636478, width=18.124573433622228, rows=667, cols=1210

    bearings = to_rad(np.asarray(ping.bearings, dtype=np.float32))
    # print("bearings=%s" % bearings) # from -1.13 ~ 1.13 (-65 deg ~ 65 deg)

    f_bearings = interp1d(
        bearings,
        range(len(bearings)),
        kind='linear',
        bounds_error=False,
        fill_value=-1,
        assume_sorted=True)
    # print(f_bearings)

    XX, YY = np.meshgrid(range(cols), range(rows))
    # XX (667, 1210)
    # array([[   0,    1,    2, ..., 1207, 1208, 1209],
    #        [   0,    1,    2, ..., 1207, 1208, 1209],
    #        [   0,    1,    2, ..., 1207, 1208, 1209],
    #        ...,
    #        [   0,    1,    2, ..., 1207, 1208, 1209],
    #        [   0,    1,    2, ..., 1207, 1208, 1209],
    #        [   0,    1,    2, ..., 1207, 1208, 1209]])   
    # YY (667, 1210)
    # array([[  0,   0,   0, ...,   0,   0,   0],
    #        [  1,   1,   1, ...,   1,   1,   1],
    #        [  2,   2,   2, ...,   2,   2,   2],
    #        ...,
    #        [664, 664, 664, ..., 664, 664, 664],
    #        [665, 665, 665, ..., 665, 665, 665],
    #        [666, 666, 666, ..., 666, 666, 666]])

    x = res * (rows - YY)
    y = res * (-cols / 2.0 + XX + 0.5)
    b = np.arctan2(y, x) * REVERSE_Z
    r = np.sqrt(np.square(x) + np.square(y))
    map_y = np.asarray(r / res, dtype=np.float32)
    map_x = np.asarray(f_bearings(b), dtype=np.float32)

    map_y_ = np.asarray((rows - YY), dtype=np.float32)
    map_x_ = np.asarray((-cols / 2.0 + XX + 0.5), dtype=np.float32)
    # map_x_ = np.asarray(XX, dtype=np.float32)
    # test = (-cols / 2.0 + XX + 0.5)
    # print(test)

    # print("x={},y={},b={},r={}".format(x,y,b,r))
    # print('')
    # print(map_y)
    # print('')
    # print(map_x)
    # print('')

def ping_callback(msg):
    raw = rospy.get_param('/oculus_sonar/Raw', False)
    cm = rospy.get_param('/oculus_sonar/Colormap', 1)
    if raw:
        img = bridge.imgmsg_to_cv2(msg.ping, desired_encoding='passthrough')
        img = cv2.normalize(
            img, None, alpha=0, beta=255, norm_type=cv2.NORM_MINMAX)
        img = cv2.applyColorMap(img, cm)
        img_msg = bridge.cv2_to_imgmsg(img, encoding="bgr8")
        img_msg.header.stamp = rospy.Time.now()
        img_pub.publish(img_msg)
    else:
        generate_map_xy(msg)

        ## cartesian coordinate
        img = bridge.imgmsg_to_cv2(msg.ping, desired_encoding='passthrough')
        img = np.array(img, dtype=img.dtype, order='F')

        if cols > img.shape[1]:
            img.resize(rows, cols)
        img = cv2.remap(img, map_x, map_y, cv2.INTER_LINEAR)

        # img = cv2.normalize( img, None, alpha=0, beta=255, norm_type=cv2.NORM_MINMAX)
        img = cv2.applyColorMap(img, cm)
        img_msg = bridge.cv2_to_imgmsg(img, encoding="bgr8")
        # img_msg = bridge.cv2_to_imgmsg(img, encoding="mono8")
        img_msg.header.stamp = rospy.Time.now()
        img_pub.publish(img_msg)

        # ## bin x beam coordinate
        # img_bb = bridge.imgmsg_to_cv2(msg.ping, desired_encoding='passthrough')
        # # img_bb = np.array(img_bb, dtype=img.dtype, order='F')
        # # if cols > img_bb.shape[1]:
        # #     img_bb.resize(rows, cols)
        # img_bb = cv2.applyColorMap(img_bb, cm)
        # img_binbeam = cv2.remap(img_bb, map_x_, map_y_, cv2.INTER_LINEAR)
        # img_msg_binbeam = bridge.cv2_to_imgmsg(img_binbeam, encoding="bgr8")
        # img_msg_binbeam.header.stamp = rospy.Time.now()
        # img_binbeam_pub.publish(img_msg_binbeam)

        ### raw bin-beam image
        img_bb = bridge.imgmsg_to_cv2(msg.ping, desired_encoding='passthrough')
        # img_bb = cv2.applyColorMap(img_bb, cm)
        img_bb_msg = bridge.cv2_to_imgmsg(img_bb, encoding="mono8")
        img_bb_msg.header.stamp = rospy.Time.now()
        img_binbeam_pub.publish(img_bb_msg)

if __name__ == '__main__':
    rospy.init_node('oculus_viewer')
    # not looking right
    img_binbeam_pub = rospy.Publisher('/oculus_sonar/image_binbeam', Image, queue_size=10)
    img_pub = rospy.Publisher('/oculus_sonar/image', Image, queue_size=10)
    ping_sub = rospy.Subscriber('/oculus_sonar/ping', OculusPing,
                                ping_callback, None, 10)

    rospy.spin()
