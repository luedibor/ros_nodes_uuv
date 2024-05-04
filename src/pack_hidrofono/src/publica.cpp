/* hidrofono_node: publica mensajes personalizados en el topico llamado 
* "location", para que el nodo "laptop_node" se suscriba a dicho topico*/

#include <ros/ros.h>
#include <pack_hidrofono/Msg.h>
int main(int argc, char* argv[])
{
    ros::init(argc, argv, "hidrofono_node");
    ros::NodeHandle nh;
    ros::Publisher pub;
    pub= nh.advertise<pack_hidrofono::Msg>("location", 1);

    ros::Rate r(10);
    pack_hidrofono::Msg dato;
    int count = 0;

    while (ros::ok())
    {
        dato.stamp = ros::Time::now();
        dato.data = count;
        dato.w = 12.4568; //aqui va el dato que nos da el hidrofono
        printf("Envio dato = %d, %d, %f\n\n", dato.stamp.sec, dato.data, dato.w);
        pub.publish(dato);
        r.sleep();
        count++;
    }
    return 0;
}