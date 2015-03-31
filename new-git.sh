#!/usr/bin/env bash

apt-get -y install software-properties-common
add-apt-repository ppa:git-core/ppa
echo Updating package list
apt-get -qq update
apt-get -y install git