# USBApp - updated 

This is a version of the USBApp demo that has code signing removed from the project and implemented in a separate script.

This project should work without entitlements on a Mac that has System Integrity Protection disabled.

See the Makefile and codesign.sh for details.

## Setup

See the codesign.sh script. You need to set your certificate ID.

## Build and Open

The most recent Xcode must be installed, but this project can be built from the command line.

```
make build
make open
```
That will build, codesign and then open the project

## Expected Behaviour

The USBApp application should open. It is a simple dialog box containing an Activate and Deactivate button.

Clicking on the Activate button will cause USBApp to attempt to load the Driver Extension. This will be blocked until you have approved it.

You should see a system dialog "System Extension Blocked", you need to open System Preferences / Security & Privacy. Click on the bottom to unlock. 

You should see then "System software from application "USBApp" was blocked from Loading. Click on allow.

At that point you can verify that the driver extension is loaded with systemextensionctl list.

```
systemextensionsctl list
1 extension(s)
--- com.apple.system_extension.driver_extension
enabled	active	teamID	bundleID (version)	name	[state]
*	*	F7XQY5N68B	sc.knight.MyUserUSBInterfaceDriver (1.0/1)	sc.knight.MyUserUSBInterfaceDriver	[activated enabled]

```





