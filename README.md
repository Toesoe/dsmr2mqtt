# dsmr2mqtt

## Original README
This utility reads the telegrams from your DSMR-compatible smart meter and sends it to a MQTT broker. I made use of [dsmr-p1-parser](https://github.com/lvzon/dsmr-p1-parser) and [libmosquitto](https://mosquitto.org/man/libmosquitto-3.html).

I wrote this so I would be able to plug my smart meter into my OpenWRT router with a prefabricated cable (I used this one: https://www.sossolutions.nl/slimme-meter-kabel).

I used the MQTT topic definitions of [dsmr-reader](https://github.com/dennissiemensma/dsmr-reader).
If you want to use other definitions, you can change the the #defines at the beginning of the *dsmr2mqtt.c* file.

## Additions
This version of dsmr2mqtt has been extended with MQTT username/password support. Work is ongoing to modernize and cleanup existing code, but the current release is fully functional.

This repo targets OpenWRT, the non-OpenWRT makefile has been removed.

Gas meter reading has been placed behind a flag.

There's a Mediatek Filogic build available in Releases, built for the Zyxel T-56 (Odido provider modem).

## Compiling

Get the correct OpenWRT SDK for your target arch. Create a directory somewhere, and create a subdirectory utilities inside, clone this repo in the utilities subdirectory.

Navigate to the SDK directory, edit feeds.conf.default, add the directory you created as a `src-local` (e.g. `src-link local /home/toesoe/owrtpackages`). 
Install `sway` and `ragel` on your host system, then from the main SDK directory run:

```
./scripts/feeds update -a && ./scripts/feeds install libmosquitto dsmr2mqtt
make defconfig
make menuconfig -> uncheck the first 3 options under Global build settings + Image configuration
make -j$(nproc) package/dsmr2mqtt/compile V=s
```

Your IPK file will be generated in `bin/packages/<arch>/<local src name>.`, e.g. `bin/packages/aarch64_cortex-a53/local`.

## Using the tool

```
Usage:  dsmr2mqtt [-d <serial_device>] [-m <mqtt_broker_host>] [-p <mqtt_broker_port>] [-u <mqtt_broker_username> [-P <mqtt_broker_password>] [-g]
    -d <serial_device>      Serial device for DSMR device (default is /dev/ttyUSB0)
    -m <mqtt_broker_host>   Host name for MQTT broker (default is localhost)
    -p <mqtt_broker_port>   Host name for MQTT broker port (default is 1883)
    -u <mqtt_broker_username> MQTT user
    -P <mqtt_broker_password> Password for MQTT user
    -g                        Enable gas meter readout
```
