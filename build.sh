#!/bin/sh

OPTIONS="-Os -Wall -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fno-exceptions"
SRC_C=../Arduino/hardware/arduino/avr/cores/arduino/*.c
SRC_CPP=../Arduino/hardware/arduino/avr/cores/arduino/*.cpp
INC_COMMON=-I../Arduino/hardware/arduino/avr/cores/arduino/
INC_MEGA=-I../Arduino/hardware/arduino/avr/variants/mega/
INC_STD=-I../Arduino/hardware/arduino/avr/variants/standard/

avr-gcc -c $OPTIONS $INC_COMMON $INC_STD -DF_CPU=8000000 -mmcu=atmega328p $SRC_C
avr-g++ -c $OPTIONS $INC_COMMON $INC_STD -DF_CPU=8000000 -mmcu=atmega328p $SRC_CPP
avr-ar r core-std-8m.a *.o

avr-gcc -c $OPTIONS $INC_COMMON $INC_STD -DF_CPU=16000000 -mmcu=atmega328p $SRC_C
avr-g++ -c $OPTIONS $INC_COMMON $INC_STD -DF_CPU=16000000 -mmcu=atmega328p $SRC_CPP
avr-ar r core-std-16m.a *.o

avr-gcc -c $OPTIONS $INC_COMMON $INC_MEGA -DF_CPU=16000000 -mmcu=atmega2560 $SRC_C
avr-g++ -c $OPTIONS $INC_COMMON $INC_MEGA -DF_CPU=16000000 -mmcu=atmega2560 $SRC_CPP
avr-ar r core-mega-16m.a *.o

rm *.o

SWSER=../Arduino/hardware/arduino/avr/libraries/SoftwareSerial/src

avr-g++ -c $OPTIONS $INC_COMMON $INC_STD -I$SWSER -DF_CPU=8000000 -mmcu=atmega328p $SWSER/SoftwareSerial.cpp
avr-ar r softwareserial-std-8m.a SoftwareSerial.o

avr-g++ -c $OPTIONS $INC_COMMON $INC_STD -I$SWSER -DF_CPU=16000000 -mmcu=atmega328p $SWSER/SoftwareSerial.cpp
avr-ar r softwareserial-std-16m.a SoftwareSerial.o

avr-g++ -c $OPTIONS $INC_COMMON $INC_MEGA -I$SWSER -DF_CPU=16000000 -mmcu=atmega2560 $SWSER/SoftwareSerial.cpp
avr-ar r softwareserial-mega-16m.a SoftwareSerial.o

rm *.o

WIRE=../Arduino/hardware/arduino/avr/libraries/Wire/src

avr-g++ -c $OPTIONS $INC_COMMON $INC_STD -I$WIRE -DF_CPU=8000000 -mmcu=atmega328p $WIRE/Wire.cpp
avr-ar r wire-std-8m.a Wire.o

avr-g++ -c $OPTIONS $INC_COMMON $INC_STD -I$WIRE -DF_CPU=16000000 -mmcu=atmega328p $WIRE/Wire.cpp
avr-ar r wire-std-16m.a Wire.o

avr-g++ -c $OPTIONS $INC_COMMON $INC_MEGA -I$WIRE -DF_CPU=16000000 -mmcu=atmega2560 $WIRE/Wire.cpp
avr-ar r wire-mega-16m.a Wire.o

rm *.o

SPI=../Arduino/hardware/arduino/avr/libraries/SPI/src

avr-g++ -c $OPTIONS $INC_COMMON $INC_STD -I$SPI -DF_CPU=8000000 -mmcu=atmega328p $SPI/SPI.cpp
avr-ar r spi-std-8m.a SPI.o

avr-g++ -c $OPTIONS $INC_COMMON $INC_STD -I$SPI -DF_CPU=16000000 -mmcu=atmega328p $SPI/SPI.cpp
avr-ar r spi-std-16m.a SPI.o

avr-g++ -c $OPTIONS $INC_COMMON $INC_MEGA -I$SPI -DF_CPU=16000000 -mmcu=atmega2560 $SPI/SPI.cpp
avr-ar r spi-mega-16m.a SPI.o

rm *.o

LORA=sx127x/src

avr-g++ -c $OPTIONS $INC_COMMON $INC_STD -I$SPI -I$LORA -DF_CPU=8000000 -mmcu=atmega328p $LORA/LoRa.cpp
avr-ar r lora-std-8m.a LoRa.o

avr-g++ -c $OPTIONS $INC_COMMON $INC_STD -I$SPI -I$LORA -DF_CPU=16000000 -mmcu=atmega328p $LORA/LoRa.cpp
avr-ar r lora-std-16m.a LoRa.o

avr-g++ -c $OPTIONS $INC_COMMON $INC_MEGA -I$SPI -I$LORA -DF_CPU=16000000 -mmcu=atmega2560 $LORA/LoRa.cpp
avr-ar r lora-mega-16m.a LoRa.o

rm *.o
