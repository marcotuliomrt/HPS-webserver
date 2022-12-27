

#
FILE = hps_gpio
FOLDER = templates
PY_FILE = app.py
TARGET_IP = 169.254.0.13
TARGET_USER = root

ALT_DEVICE_FAMILY ?= soc_cv_av
SOCEDS_ROOT ?= $(SOCEDS_DEST_ROOT)
HWLIBS_ROOT = $(SOCEDS_ROOT)/ip/altera/hps/altera_hps/hwlib
CROSS_COMPILE = arm-linux-gnueabihf-
CFLAGS = -g -Wall -O0 -D$(ALT_DEVICE_FAMILY) -I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY)   -I$(HWLIBS_ROOT)/include/
LDFLAGS =  -g -Wall -O0
CC = $(CROSS_COMPILE)gcc
ARCH= arm

build: $(FILE)

$(FILE): main.o
	$(CC) $(LDFLAGS)   $^ -o $@ 

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

#deploy: $(FILE) $(TARGET_USER) $(TARGET_IP)
#	scp $(FILE) $(TARGET_USER)@$(TARGET_IP):/home/root
deploy: $(FILE)
	scp $(FILE) root@169.254.0.13:/root
	scp $(PY_FILE) root@169.254.0.13:/root
	scp -r $(FOLDER) root@169.254.0.13:/root

run: $(FILE)
	ssh root@169.254.0.13 ./$(FILE)



.PHONY: clean
clean:
	rm -f $(FILE) *.a *.o *~


