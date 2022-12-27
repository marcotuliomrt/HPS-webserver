# Webserver on FPGA D10-Standard

### Repository content:
- main.c: source code -> driver to interface with the Target hardware (LED, button, ...)
- Makefile: script that run shell commands to compile the .c file and deploys it to the Target
- hps_gpio: executable created from the main.c
- main.o: object file created from the main.c
- templates: folder with the html file
- app.py: script to run the web application on Flask

### What it does:
It will display on the browser a web page with the option to turn ON/OFF the user LED and get the reading of the user button.

### Material used:
- Host machine with GNU-linux OS and  Linaro toolchain
- FPGA D10-Standard:Terasic (Target) with GNU-linux OS (with python, Flask, SSh)

### How to use it (considering the target setup done correctly):
1- Connect the target to a host machine with an Ethernet cable
2- Start the SSH communication
3- On the Host, send the files to the Target using the makefile
4- On the Host open the browser on the Target IP address




### Host setup
To run this project you need on the host machine a Linux OS, Linaro toolchain to compile the .c, environmnet paths for the compiler, libraries, ..., 

1. Install the Linaro cross compiler toolchain on the Host machine

2. Configure its environments variablrs (gcc paths, ...) in a .sh file
    
[complete tutorial](https://insper.github.io/Embarcados-Avancados/Tutorial-HPS/)


### Target setup
To run this project you need on the host machine a linux OS, ssh communication enabled, python installed, flask installed, ...

1. Burn the iso image of the Linux Kernel (configured for soc) in the SDcard

2. Generate a filesystem that contains all requirements for this project (buildroot)

[complete tutorial](https://insper.github.io/Embarcados-Avancados/Tutorial-HPS/)
