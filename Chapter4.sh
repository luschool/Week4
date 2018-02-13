#!/bin/bash
#Week 4 Lab - Lucas Merriott
echo First we will create an empty file 

dd if=/dev/zero of=./24MB.img bs=1M count=24

echo 
echo next we will turn that empty file into a ext4 filesystem

mkfs -t ext4 ./24MB.img

echo now we will mount it to /mnt/tmp and verify with lsblk

sudo mkdir /mnt/tmp
sudo mount ./24MB.img /mnt/tmp
echo

lsblk

sudo umount /mnt/tmp

hexdump ./24MB.img > Hexdump.txt

echo Hexdump of filesystem created in home directory
echo Now to check if we properly unmounted
echo


#Clean up time
cd /mnt

sudo rmdir tmp

cd

rm 24MB.img

#Verify that we unmounted
lsblk
echo all directories and mounts made by the script have been removed.
