/* laptop_node: se suscribe al topico "location" e imprime
* el mensaje mandado por el hidrofono*/

#include "ros/ros.h"
#include <pack_hidrofono/Msg.h>

void msgCallback(const pack_hidrofono::Msg::ConstPtr &received){
printf("Recibo= %d, %d. %f\n\n", received->stamp.sec, received->data, received->w);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "laptop_node");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("location", 1, msgCallback);
    ros::spin();
    return 0;
}