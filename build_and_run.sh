#!/bin/bash

# OLD - original load/unload...
#sudo kextunload -b com.apple.driver.AppleUSBCDCACMData
#sudo kextload -b com.apple.driver.AppleUSBCDCACMData

# OLD - additional load/unloads to come in order after AppleUSBCDC
#sudo kextunload -b com.apple.driver.AppleUSBCDCACMData
#sudo kextunload -b com.apple.driver.AppleUSBCDCECMData
#sudo kextunload -b com.apple.driver.AppleUSBCDCECMControl
#sudo kextload -b com.apple.driver.AppleUSBCDCACMData
#sudo kextload -b com.apple.driver.AppleUSBCDCECMData
#sudo kextload -b com.apple.driver.AppleUSBCDCECMControl

echo Unloading kernel modules...
sudo kextunload -b com.apple.driver.AppleUSBCDC

set -e
echo Reenumerating usb ethernet device...
g++ -x c reenumerate.c -o reenumerate -framework CoreFoundation -framework IOKit && ./reenumerate
echo

echo Loading kernel modules...
sudo kextload -b com.apple.driver.AppleUSBCDC

echo Done!
sleep 2
echo

