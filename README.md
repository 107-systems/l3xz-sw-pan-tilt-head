# l3xz_sw_pan_tilt_head
Software bundle to be deployed on the Raspberry Pi Zero 2 of the l3xz sensor head.

## Setup

After cloning this repository, two parameters have to be configured:

* Network configuration in the application file (```head```)
* Path to the serial devices of the OpenMV cameras (```head_launch.py```)

After configuration the software bundle can be installed by simply running ```sudo ./install.sh```.
The Docker enviroment for the ROS infrastructure will be built and the application files will be bootstrapped over the system. Finally, the software will come up as a ```systemd``` service with the name ```hawk.service```.
