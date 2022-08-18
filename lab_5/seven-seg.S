#define __SFR_OFFSET 0

#include "avr/io.h"

build_unflags = mrelax
.global start
.global blink

start:
  ret

blink:
ldi r16, 0xFF ; load r16 with 1s
out DDRB, r16 ;all pins on port B as output
out DDRD, r16 ; all pins on port D as output
out PORTC, r16; all pins on port C have pull up resistors enabled
out PINC, r16;
ldi r16, 0x00 ; load r16 with 0s
out PORTB, r16 ; portb has output 0 right now
out PORTD, r16; portd has output 0 right now
out DDRC, r16 ;all pins on port C as input

loop:
ldi r19, 0x00
cpi r19, 0x00
breq go
brne loop

go:
cpi r17, 0x00 ;compare r17 and 0
breq zero
zero:
sbi PORTD, 6; A = 1
sbi PORTD, 7; B = 1
sbi PORTB, 0; C = 1
sbi PORTB, 1; D = 1
sbi PORTB, 2; E = 1
sbi PORTB, 3; F = 1
cbi PORTB, 4 ;G = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x01 ;compare r17 and 1
breq one
one:
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
cbi PORTD, 6 ;A = 0
cbi PORTD, 7 ;B = 0
cbi PORTB, 0 ;C = 0
cbi PORTB, 1 ;D = 0
cbi PORTB, 4 ;G = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x02 ;compare r17 and 2
breq two
two:
sbi PORTD, 6 ;A = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 4 ;G = 1
sbi PORTD, 7 ;B = 1
cbi PORTB, 0 ;C = 0
cbi PORTB, 3 ;F = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x03 ;compare r17 and 3
breq three
three:
sbi PORTD, 6; A = 1
sbi PORTD, 7; B = 1
sbi PORTB, 0; C = 1
sbi PORTB, 1; D = 1
cbi PORTB, 2; E = 1
cbi PORTB, 3; F = 1
sbi PORTB, 4 ;G = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x04 ;compare r17 and 4
breq four
four:
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 6 ;A = 0
cbi PORTB, 1 ;D = 0
cbi PORTB, 2 ;E = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x05 ;compare r17 and 5
breq five
five:
sbi PORTD, 6 ;A = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 7 ;B = 0
cbi PORTB, 2 ;E = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x06 ;compare r17 and 6
breq six
six:
sbi PORTD, 6 ;A = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 7 ;B = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x07 ;compare r17 and 7
breq seven
seven:
sbi PORTD, 6 ;A = 1
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
cbi PORTB, 1 ;D = 0
cbi PORTB, 2 ;E = 0
cbi PORTB, 3 ;F = 0
cbi PORTB, 4 ;G = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x08 ;compare r17 and 8
breq eight
eight:
sbi PORTD, 6 ;A = 1
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x09 ;compare r17 and 9
breq nine
nine:
sbi PORTD, 6 ;A = 1
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
sbi PORTB, 1 ;D = 0
cbi PORTB, 2 ;E = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x0A ;compare r17 and A
breq a
a:
sbi PORTD, 6 ;A = 1
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 4 ;G = 1
cbi PORTB, 3 ;F = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x0B ;compare r17 and B
breq b
b:
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 6 ;A = 0
cbi PORTD, 7 ;B = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x0C ;compare r17 and C
breq c
c:
sbi PORTD, 6 ;A = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
cbi PORTD, 7 ;B = 0
cbi PORTB, 0 ;C = 0
cbi PORTB, 4 ;G = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x0D ;compare r17 and D
breq d
d:
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 6 ;A = 0
cbi PORTB, 3 ;F = 0
cbi PORTB, 5 ;DP = 0
call delay 

cpi r17, 0x0E ;compare r17 and E
breq e
e:
sbi PORTD, 6 ;A = 1
sbi PORTD, 7 ;B = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTB, 0 ;C = 0
cbi PORTB, 5 ;DP = 0
call delay

cpi r17, 0x0F ;compare immediate r17 and F
breq f
f:
sbi PORTD, 6 ;A = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 7 ;B = 0
cbi PORTB, 0 ;C = 0
cbi PORTB, 1 ;D = 0
cbi PORTB, 5 ;DP = 0
call delay

delay:
push r0
ldi r21, 0xF5; load with 245
out_out_loop0:
ldi r20, 0x0;
out_loop0:
ldi r18, 0x0 ; load with 0
loop0: mul r17, r17
  mul r17, r17
  mul r17, r17
  mul r17, r17
  mul r17, r17
  inc r18
  brne loop0
inc r20
brne out_loop0
inc r21
brne out_out_loop0
pop r0
ret