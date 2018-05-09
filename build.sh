#!/bin/sh
D=`date +%Y_%m_%d`
sudo singularity build google-chrome.simg-$D Singularity && \
singularity exec google-chrome.simg-$D  rpm -qa --last >  google-chrome.simg-rpm-qa--last.$D
singularity exec google-chrome.simg-$D  rpm -qa | sort >  google-chrome.simg-rpm-qa--sort.$D

