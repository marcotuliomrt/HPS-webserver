### Repository content:
- main.c: source code -> driver to interface with the Target hardware (LED, button, ...)
- Makefile: script that run shell commands -> compiles .c file and deploys it to the Target
- hps_gpio: executable created from the main.c
- main.o: object file created from the main.c
- templates: folder with the html file
- app.py: script to run the web application on Flask


### What it does:
It will display on the browser a web page with the option to turn ON/OFF the user LED and get the reading of the user button.

### Material used:
- FPGA D10-Standard:Terasic with GNU-linux OS (with python, Flask, SSh) -> Target
- Laptop with GNU-linux OS  -> Host

### How to use it:
1- Connect the target to a host machine with an Ethernet cable
2- Start the SSH communication
3- On the Host, send the files to the Target using the makefile
4- On the Host open the browser on the Target IP address

