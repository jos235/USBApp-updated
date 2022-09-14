#!/bin/bash


# Use this to find your certificate identity:
#	security find-identity
#
readonly CODE_SIGN_IDENTITY=3238E5EA20202051214E572E0E0E616F6F082DDD

set -e

set -x
security  unlock-keychain -p '{}' /Users/${USER}/Library/Keychains/login.keychain 


codesign --sign $CODE_SIGN_IDENTITY \
    --entitlements MyUserUSBInterfaceDriver/MyUserUSBInterfaceDriver.entitlements \
    --options runtime --verbose --force \
    build/Debug/USBApp.app/Contents/Library/SystemExtensions/sc.knight.MyUserUSBInterfaceDriver.dext

codesign --verify --verbose \
    build/Debug/USBApp.app/Contents/Library/SystemExtensions/sc.knight.MyUserUSBInterfaceDriver.dext

codesign --sign $CODE_SIGN_IDENTITY \
    --entitlements USBApp/USBApp.entitlements \
    --options runtime --verbose --force \
    build/Debug/USBApp.app

codesign \
    --verify --verbose \
    build/Debug/USBApp.app
