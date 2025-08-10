# dsmr2mqtt

This utility reads the telegrams from your DSMR-compatible smart meter and sends it 
to a MQTT broker. I made use of [dsmr-p1-parser](https://github.com/lvzon/dsmr-p1-parser) and [libmosquitto](https://mosquitto.org/man/libmosquitto-3.html).

I wrote this so I would be able to plug my smart meter into my OpenWRT router with a
prefabricated cable (I used this one: https://www.sossolutions.nl/slimme-meter-kabel).

I used the MQTT topic definitions of [dsmr-reader](https://github.com/dennissiemensma/dsmr-reader).
If you want to use other definitions, you can change the the #defines at the beginning of the *dsmr2mqtt.c* file.

## Compiling

Get the correct SDK for your target, and clone this repo into the `package` subdirectory.
Install `sway` and `ragel` on your host system, then from the main SDK directory run:

```
./scripts/feeds update -a && ./scripts/feeds install libmosquitto
make defconfig
make menuconfig -> uncheck the first 3 options under Global build settings
make -j$(nproc) package/dsmr2mqtt/{download,prepare,compile} V=s
```

## Using the tool

```
Usage:  dsmr2mqtt [-d <serial_device>] [-m <mqtt_broker_host>] [-p <mqtt_broker_port>]
    -d <serial_device>      Serial device for DSMR device (default is /dev/ttyUSB0)
    -m <mqtt_broker_host>   Host name for MQTT broker (default is localhost)
    -p <mqtt_broker_port>   Host name for MQTT broker port (default is 1883)
```
