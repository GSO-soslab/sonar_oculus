#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <sensor_msgs/Image.h>

class Transport
{
public:
    Transport():it(nh)
    {
        sub = it.subscribe("/rov/sensors/sonar/image", 1, &Transport::callback, this);
        pub = it.advertise("/rov/sensors/sonar/image_transport", 1);
    }

    ~Transport()
    {
    }

    void callback(const sensor_msgs::ImageConstPtr& msg);

private:
    ros::NodeHandle nh;

    image_transport::ImageTransport it;
    image_transport::Subscriber sub;
    image_transport::Publisher pub;

};

void Transport::callback(const sensor_msgs::ImageConstPtr& msg)
{
    pub.publish(msg);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "sonar_transport_node");

    Transport  transport;

    ros::spin();

    return 0;
}