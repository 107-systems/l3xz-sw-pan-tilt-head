<a href="https://107-systems.org/"><img align="right" src="https://raw.githubusercontent.com/107-systems/.github/main/logo/107-systems.png" width="15%"></a>
:floppy_disk: `l3xz_sw_pan_tilt_head`
=====================================
[![Spell Check status](https://github.com/107-systems/l3xz_sw_pan_tilt_head/actions/workflows/spell-check.yml/badge.svg)](https://github.com/107-systems/l3xz_sw_pan_tilt_head/actions/workflows/spell-check.yml)

Software bundle to be deployed on the Raspberry Pi Zero 2 of the [L3X-Z pan/tilt head](https://github.com/107-systems/l3xz-hw-pan-tilt-head).

<p align="center">
  <a href="https://github.com/107-systems/l3xz"><img src="https://raw.githubusercontent.com/107-systems/.github/main/logo/l3xz-logo-memento-mori-github.png" width="40%"></a>
</p>

## Setup

After cloning this repository, two parameters have to be configured:

* Network configuration in the application file (```head```)
* Path to the serial devices of the OpenMV cameras (```head_launch.py```)

After configuration the software bundle can be installed by simply running ```sudo ./install.sh```.
The Docker enviroment for the ROS infrastructure will be built and the application files will be bootstrapped over the system. Finally, the software will come up as a ```systemd``` service with the name ```head.service```.
