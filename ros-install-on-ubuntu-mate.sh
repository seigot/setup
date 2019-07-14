#!/bin/sh 

## general
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get autoremove -y

## Step 3: Setup your sources.list
sudo sh -c ‘echo “deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main” > /etc/apt/sources.list.d/ros-latest.list’

## Step 4: Setup your keys
wget http://packages.ros.org/ros.key -O – | sudo apt-key add –

## Step 5: To be sure that your Ubuntu Mate package index is up to date, type the following command
sudo apt-get update -y

## Step 6: Install ros-kinetic-desktop-full
sudo apt-get install ros-kinetic-desktop-full -y

## Step 7: Initialize rosdep
sudo rosdep init
rosdep update

## Step 8: Setting up the ROS environment variables
echo “source /opt/ros/kinetic/setup.bash” >> ~/.bashrc
source ~/.bashrc

## Step 9: Create and initialize the catkin workspace
mkdir -p ~/catkin_workspace/src
cd catkin_workspace/src
catkin_init_workspace
cd ~/catkin_workspace/
catkin_make

## Step 10: Add the catkin_workspace to your ROS environment
source ~/catkin_workspace/devel/setup.bash
echo “source ~/catkin_workspace/devel/setup.bash” >> ~/.bashrc

## Step 11: Check the ROS environment variables
export | grep ROS
