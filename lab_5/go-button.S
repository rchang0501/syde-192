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

ldi r17, 0x00
body:
cbi PORTD, 6; A = 1
cbi PORTD, 7; B = 1
cbi PORTB, 0; C = 1
cbi PORTB, 1; D = 1
cbi PORTB, 2; E = 1
cbi PORTB, 3; F = 1
cbi PORTB, 4 ;G = 0
cbi PORTB, 5 ;DP = 0
in r16, PINC
cpi r16, 0x00
brne body
jmp main_loop

main_loop:
inc r17
andi r17, 0X0F
call delay

cpi r17, 0x00
brne move0 ;go to move0 if not 0
call zero
jmp body

move0:
cpi r17, 0x01
brne move1
jmp one

move1:
cpi r17, 0x02
brne move2
jmp two

move2:
cpi r17, 0x03
brne move3
jmp three

move3:
cpi r17, 0x04
brne move4
jmp four

move4:
cpi r17, 0x05
brne move5
jmp five

move5:
cpi r17, 0x06
brne move6
jmp six

move6:
cpi r17, 0x07
brne move7
jmp seven

move7:
cpi r17, 0x08
brne move8
jmp eight

move8:
cpi r17, 0x09
brne move9
jmp nine

move9:
cpi r17, 0x0A
brne moveA
jmp a

moveA:
cpi r17, 0x0B
brne moveB
jmp b

moveB:
cpi r17, 0x0C
brne moveC
jmp c

moveC:
cpi r17, 0x0D
brne moveD
jmp d

moveD:
cpi r17, 0x0E
brne moveE
jmp e

moveE:
cpi r17, 0x0F
jmp f

jmp main_loop

zero:
push r1
sbi PORTD, 6; A = 1
sbi PORTD, 7; B = 1
sbi PORTB, 0; C = 1
sbi PORTB, 1; D = 1
sbi PORTB, 2; E = 1
sbi PORTB, 3; F = 1
cbi PORTB, 4 ;G = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

one:
push r1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
cbi PORTD, 6 ;A = 0
cbi PORTD, 7 ;B = 0
cbi PORTB, 0 ;C = 0
cbi PORTB, 1 ;D = 0
cbi PORTB, 4 ;G = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

two:
push r1
sbi PORTD, 6 ;A = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 4 ;G = 1
sbi PORTD, 7 ;B = 1
cbi PORTB, 0 ;C = 0
cbi PORTB, 3 ;F = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

three:
push r1
sbi PORTD, 6; A = 1
sbi PORTD, 7; B = 1
sbi PORTB, 0; C = 1
sbi PORTB, 1; D = 1
cbi PORTB, 2; E = 1
cbi PORTB, 3; F = 1
sbi PORTB, 4 ;G = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

four:
push r1
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 6 ;A = 0
cbi PORTB, 1 ;D = 0
cbi PORTB, 2 ;E = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

five:
push r1
sbi PORTD, 6 ;A = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 7 ;B = 0
cbi PORTB, 2 ;E = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

six:
push r1
sbi PORTD, 6 ;A = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 7 ;B = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

seven:
push r1
sbi PORTD, 6 ;A = 1
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
cbi PORTB, 1 ;D = 0
cbi PORTB, 2 ;E = 0
cbi PORTB, 3 ;F = 0
cbi PORTB, 4 ;G = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

eight:
push r1
sbi PORTD, 6 ;A = 1
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

nine:
push r1
sbi PORTD, 6 ;A = 1
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
sbi PORTB, 1 ;D = 0
cbi PORTB, 2 ;E = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

a:
push r1
sbi PORTD, 6 ;A = 1
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 4 ;G = 1
cbi PORTB, 3 ;F = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

b:
push r1
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 6 ;A = 0
cbi PORTD, 7 ;B = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

c:
push r1
sbi PORTD, 6 ;A = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
cbi PORTD, 7 ;B = 0
cbi PORTB, 0 ;C = 0
cbi PORTB, 4 ;G = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

d:
push r1
sbi PORTD, 7 ;B = 1
sbi PORTB, 0 ;C = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 6 ;A = 0
cbi PORTB, 3 ;F = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

e:
push r1
sbi PORTD, 6 ;A = 1
sbi PORTD, 7 ;B = 1
sbi PORTB, 1 ;D = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTB, 0 ;C = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp main_loop

f:
push r1
sbi PORTD, 6 ;A = 1
sbi PORTB, 2 ;E = 1
sbi PORTB, 3 ;F = 1
sbi PORTB, 4 ;G = 1
cbi PORTD, 7 ;B = 0
cbi PORTB, 0 ;C = 0
cbi PORTB, 1 ;D = 0
cbi PORTB, 5 ;DP = 0
call delay
pop r1
jmp body

delay:
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
