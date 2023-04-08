<a href="https://107-systems.org/"><img align="right" src="https://raw.githubusercontent.com/107-systems/.github/main/logo/107-systems.png" width="15%"></a>
:floppy_disk: `l3xz-sw-pan-tilt-head`
=====================================
[![Spell Check status](https://github.com/107-systems/l3xz-sw-pan-tilt-head/actions/workflows/spell-check.yml/badge.svg)](https://github.com/107-systems/l3xz-sw-pan-tilt-head/actions/workflows/spell-check.yml)
[![Sync Labels](https://github.com/107-systems/l3xz-sw-pan-tilt-head/workflows/Sync%20Labels/badge.svg)](https://github.com/107-systems/l3xz-sw-pan-tilt-head/actions?workflow=Sync+Labels)

Software bundle for deployment on the Raspberry Pi Zero 2 of the [L3X-Z pan/tilt head](https://github.com/107-systems/l3xz-hw-pan-tilt-head).

<p align="center">
  <a href="https://github.com/107-systems/l3xz"><img src="https://raw.githubusercontent.com/107-systems/.github/main/logo/l3xz-logo-memento-mori-github.png" width="40%"></a>
</p>

## Setup

After cloning this repository, two parameters have to be configured:

* Network configuration in the application file (```head```)
* Path to the serial devices of the OpenMV cameras (```head_launch.py```)

After configuration the software bundle can be installed by simply running the installation script:
~~~bash
git clone https://github.com/107-systems/l3xz-sw-pan-tilt-head
cd l3xz-sw-pan-tilt-head
sudo ./install.sh
~~~

The Docker environment for the ROS infrastructure will be built and the application files will be bootstrapped over the system. Finally, the software will come up as a ```systemd``` service with the name ```head.service```.
The status of the software can be checked with the following command:
~~~bash
systemctl status head.service
~~~
