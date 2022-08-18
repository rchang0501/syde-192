#define __SFR_OFFSET 0
#include "avr/io.h"

.global start
.global postlab

start:
ldi r16, 0xF9
out DDRB, r16
ldi r16, 0x06
out PORTB, r16

ldi r16, 0xFF
out DDRD, r16
ldi r16, 0x0
out PORTD, r16

call showQM

postlab:
ldi r17, 0x0F
ldi r18, 0x0
ldi r20, 0x0
ldi r24, 0x0
ldi r23, 0x0

infinite:
in r16, PINB
andi r16, 0x06
cpi r16, 0x02
brne Past1
inc r17
call loop

Past1:
in r16, PINB
andi r16, 0x06
cpi r16, 0x04
brne infinite
call enterpress
mov r18, r17
ldi r17, 0x0F
call showQM
jmp infinite2

infinite2:
in r16, PINB
andi r16, 0x06
cpi r16, 0x02
brne Past2
inc r17
call loop

Past2:
in r16, PINB
andi r16, 0x06
cpi r16, 0x04
brne infinite2
call enterpress
jmp multiply

multiply:
call cleardisplay
mul r17, r18
ldi r17, 0x0 ;
mov r17, r0
mov r25, r0
cpi r17, 0x0
brne showloop
jmp showF

showloop:
call delay_ms
call loop
call slowflashing
call loop4
call slowflashing
call showDash
call slowflashing
jmp showloop

slowflashing:
call delay_ms
call delay_ms
call cleardisplay
call delay_ms
call delay_ms
ret

enterpress:
call delay_ms
call cleardisplay
call loop
call cleardisplay
call delay_ms
call loop
call cleardisplay
call delay_ms
call loop
call cleardisplay
call delay_ms
call loop
ret


loop:
andi r17, 0X0F

cpi r17, 0x0
brne Skip0
call show0
ret

Skip0:
cpi r17, 0x01
brne Skip1
call show1
ret

Skip1:
cpi r17, 0x02
brne Skip2
call show2
ret

Skip2:
cpi r17, 0x03
brne Skip3
call show3
ret

Skip3:
cpi r17, 0x04
brne Skip4
call show4
ret

Skip4:
cpi r17, 0x05
brne Skip5
call show5
ret

Skip5:
cpi r17, 0x06
brne Skip6
call show6
ret

Skip6:
cpi r17, 0x07
brne Skip7
call show7
ret

Skip7:
cpi r17, 0x08
brne Skip8
call show8
ret

Skip8:
cpi r17, 0x09
brne Skip9
call show9
ret

Skip9:
cpi r17, 0x0A
brne SkipA
call showA
ret

SkipA:
cpi r17, 0x0B
brne SkipB
call showB
ret

SkipB:
cpi r17, 0x0C
brne SkipC
call showC
ret

SkipC:
cpi r17, 0x0D
brne SkipD
call showD
ret

SkipD:
cpi r17, 0x0E
brne SkipE
call showE
ret

SkipE:
cpi r17, 0x0F
call showF
ret
ret

loop4:
andi r25, 0XF0

cpi r25, 0x10
brne Skip14
call show1
ret

Skip14:
cpi r25, 0x20
brne Skip24
call show2
ret

Skip24:
cpi r25, 0x30
brne Skip34
call show3
ret

Skip34:
cpi r25, 0x40
brne Skip44
call show4
ret

Skip44:
cpi r25, 0x50
brne Skip54
call show5
ret

Skip54:
cpi r25, 0x60
brne Skip64
call show6
ret

Skip64:
cpi r25, 0x70
brne Skip74
call show7
ret

Skip74:
cpi r25, 0x80
brne Skip84
call show8
ret

Skip84:
cpi r25, 0x90
brne Skip94
call show9
ret

Skip94:
cpi r25, 0xA0
brne SkipA4
call showA
ret

SkipA4:
cpi r25, 0xB0
brne SkipB4
call showB
ret

SkipB4:
cpi r25, 0xC0
brne SkipC4
call showC
ret

SkipC4:
cpi r25, 0xD0
brne SkipD4
call showD
ret

SkipD4:
cpi r25, 0xE0
brne SkipE4
call showE
ret

SkipE4:
cpi r25, 0xF0
call show0
ret
ret

show0:
call cleardisplay
sbi PORTD, 3
sbi PORTD, 4
sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4
call delay_ms
ret

show1:
call cleardisplay
sbi PORTB, 3
sbi PORTB, 4
call delay_ms
ret

show2:
call cleardisplay
sbi PORTD, 3
sbi PORTD, 4
sbi PORTB, 5
sbi PORTB, 3
sbi PORTD, 6
call delay_ms
ret

show3:
call cleardisplay
sbi PORTD, 3
sbi PORTD, 4
sbi PORTB, 5
sbi PORTD, 5
sbi PORTD, 6
call delay_ms
ret

show4:
call cleardisplay
sbi PORTB, 4
sbi PORTB, 5
sbi PORTD, 4
sbi PORTD, 5
call delay_ms
ret

show5:
call cleardisplay
sbi PORTD, 3
sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 4
sbi PORTB, 5
call delay_ms
ret

show6:
call cleardisplay
sbi PORTD, 3
sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5
call delay_ms
ret

show7:
cbi PORTD, 3
cbi PORTD, 4
cbi PORTD, 5
cbi PORTD, 6
cbi PORTB, 3
cbi PORTB, 4
cbi PORTB, 5
sbi PORTD, 3
sbi PORTD, 4
sbi PORTD, 5
call delay_ms
ret

show8:
call cleardisplay
sbi PORTD, 3
sbi PORTD, 4
sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5
call delay_ms
ret

show9:
call cleardisplay
sbi PORTD, 3
sbi PORTD, 4
sbi PORTD, 5
sbi PORTB, 4
sbi PORTB, 5
call delay_ms
ret

showA:
call cleardisplay
sbi PORTD, 3
sbi PORTD, 4
sbi PORTD, 5
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5
call delay_ms
ret

showB:
call cleardisplay
sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5
call delay_ms
ret

showC:
call cleardisplay
sbi PORTD, 3
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4
call delay_ms
ret

jumpinfinite2D:
jmp infinite2

showD:
call cleardisplay
sbi PORTD, 4
sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 5
call delay_ms
ret

showE:
call cleardisplay
sbi PORTD, 3
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5
call delay_ms
ret

showF:
call cleardisplay
sbi PORTD, 3
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5
call delay_ms
ret

showQM:
call cleardisplay
sbi PORTD, 3
sbi PORTD, 4
sbi PORTB, 3
sbi PORTB, 5
ret

showDash:
call cleardisplay
sbi PORTB, 5
ret

cleardisplay:
cbi PORTD, 3
cbi PORTD, 4
cbi PORTD, 5
cbi PORTD, 6
cbi PORTB, 3
cbi PORTB, 4
cbi PORTB, 5
ret

delay_ms:
  ldi r19, 0xEF
  outer_loop:
  ldi r23, 0x0
  inner_loop:
  ldi r22, 0x0
  inner_inner_loop:
  mul r21, r21
  inc r22
  brne inner_inner_loop
  inc r23
  brne inner_loop
  inc r19
  brne outer_loop
  ret
