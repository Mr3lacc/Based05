#!/bin/bash
# SmartShell Installation Script

# Update package list and install SmartShell
sudo apt update
sudo apt install -y smartshell

# Clean up
sudo apt autoremove -y
