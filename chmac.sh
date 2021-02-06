#!/bin/sh

# linux临时修改MAC地址

ifconfig wlp2s0 down
ifconfig wlp2s0 hw ether CB:67:18:1D:55:40
ifconfig wlp2s0 up
