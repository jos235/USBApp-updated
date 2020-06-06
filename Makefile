# vim: noexpandtab tabstop=8


.PHONY: build

all:

build: clean
	xcodebuild -configuration Debug SYMROOT="$(CURDIR)/build"
	./codesign.sh

clean:
	rm -rf build

xcode:
	open USBApp.xcodeproj

open: 
	open build/Debug/USBApp.app

install:
	rsync -a --delete build/Debug/USBApp.app /Applications

run: install
	open /Applications/USBApp.app

systemextensionsctl-list:
	systemextensionsctl list

log-show-extension-manager:
	log show --predicate 'sender == "sysextd" or sender CONTAINS "sc.knight"' --info --debug --last 1h
