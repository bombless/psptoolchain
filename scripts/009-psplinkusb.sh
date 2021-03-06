#!/bin/bash
# psplinkusb.sh by Dan Peori (danpeori@oopo.net)

 ## Exit on errors
 set -e
 
 ## Download the source code if it does not already exist
 clone_git_repo github.com pspdev psplinkusb

 ## Enter the source directory and patch the source code
 cd psplinkusb
 [[ "$(uname)" == 'Darwin' ]] && patch -p1 < ../../patches/psplinkusb-Darwin.patch

 ## MacPorts fix
 export C_INCLUDE_PATH="/opt/local/include"
 export CPLUS_INCLUDE_PATH="/opt/local/include"
 export LIBRARY_PATH="/opt/local/lib"

 ## Build and install.
 make -f Makefile.clients clean
 make -f Makefile.clients
 make -f Makefile.clients install
 make -f Makefile.clients clean

