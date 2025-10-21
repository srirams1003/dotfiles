#!/bin/sh

echo "deb http://archive.ubuntu.com/ubuntu/ focal main universe" | sudo tee /etc/apt/sources.list.d/focal-main.list

sudo apt-get update

sudo apt-get install libncurses5 libtinfo5

sudo rm /etc/apt/sources.list.d/focal-main.list

sudo apt-get update
