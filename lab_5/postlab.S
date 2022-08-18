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

call displayQM
postlab:

ldi r17, 0x0F
ldi r18, 0x0
ldi r20, 0x0
ldi r24, 0x0
ldi r23, 0x0

inf:

in r16, PINB
andi r16, 0x06
cpi r16, 0x04

brne previous_one

inc r17
call loop

previous_one:

in r16, PINB
andi r16, 0x06
cpi r16, 0x02

brne inf

call userin
mov r18, r17
ldi r17, 0x0F
call displayQM
jmp inf2

inf2:
in r16, PINB
andi r16, 0x06
cpi r16, 0x04

brne previous_two

inc r17
call loop

previous_two:
in r16, PINB
andi r16, 0x06
cpi r16, 0x02

brne inf2

call userin
jmp op_mult

op_mult:
call wipedisp
mul r17, r18

ldi r17, 0x0

mov r17, r0
mov r25, r0
cpi r17, 0x0

brne showloop
jmp showF

showloop:
call millidelay
call loop

call slowflash
call next_loop

call slowflash
call showDash
call slowflash
jmp showloop

slowflash:

call millidelay
call millidelay

call wipedisp

call millidelay
call millidelay
ret

userin:
call millidelay
call wipedisp

call loop

call wipedisp
call millidelay

call loop

call wipedisp
call millidelay

call loop

call wipedisp
call millidelay

call loop

ret
loop:
andi r17, 0X0F

cpi r17, 0x0
brne move0
call zero
ret

move0:
cpi r17, 0x01
brne move1
call show1

ret

move1:
cpi r17, 0x02
brne move2
call show2

ret

move2:
cpi r17, 0x03
brne move3
call show3

ret

move3:
cpi r17, 0x04
brne move4
call show4

ret

move4:
cpi r17, 0x05
brne move5
call show5

ret

move5:
cpi r17, 0x06
brne move6
call show6

ret

move6:
cpi r17, 0x07
brne move7
call show7

ret

move7:
cpi r17, 0x08
brne move8
call show8

ret

move8:
cpi r17, 0x09
brne move9
call show9

ret

move9:
cpi r17, 0x0A
brne moveA
call showA

ret

moveA:
cpi r17, 0x0B
brne moveB
call showB

ret

moveB:
cpi r17, 0x0C
brne moveC
call showC

ret

moveC:
cpi r17, 0x0D
brne moveD
call showD

ret

moveD:
cpi r17, 0x0E
brne moveE
call showE

ret

moveE:
cpi r17, 0x0F
call showF

ret
ret

next_loop:
andi r25, 0XF0

cpi r25, 0x10
brne move1next
call show1

ret

move1next:
cpi r25, 0x20
brne move2next
call show2

ret

move2next:
cpi r25, 0x30
brne move3next
call show3

ret

move3next:
cpi r25, 0x40
brne move4next
call show4

ret

move4next:
cpi r25, 0x50
brne move5next
call show5

ret

move5next:
cpi r25, 0x60
brne move6next
call show6

ret

move6next:
cpi r25, 0x70
brne move7next
call show7

ret

move7next:
cpi r25, 0x80
brne move8next
call show8

ret

move8next:
cpi r25, 0x90
brne move9next
call show9

ret

move9next:
cpi r25, 0xA0
brne moveAnext
call showA

ret

moveAnext:
cpi r25, 0xB0
brne moveBnext
call showB

ret

moveBnext:
cpi r25, 0xC0
brne moveCnext
call showC

ret

moveCnext:
cpi r25, 0xD0
brne moveDnext
call showD

ret

moveDnext:
cpi r25, 0xE0
brne moveEnext
call showE

ret

moveEnext:
cpi r25, 0xF0
call zero

ret
ret

zero:
call wipedisp

sbi PORTD, 3
sbi PORTD, 4
sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4

call millidelay
ret

show1:
call wipedisp

sbi PORTB, 3
sbi PORTB, 4

call millidelay
ret

show2:
call wipedisp

sbi PORTD, 3
sbi PORTD, 4
sbi PORTB, 5
sbi PORTB, 3
sbi PORTD, 6

call millidelay
ret

show3:
call wipedisp

sbi PORTD, 3
sbi PORTD, 4
sbi PORTB, 5
sbi PORTD, 5
sbi PORTD, 6

call millidelay
ret

show4:
call wipedisp

sbi PORTB, 4
sbi PORTB, 5
sbi PORTD, 4
sbi PORTD, 5

call millidelay
ret

show5:
call wipedisp

sbi PORTD, 3
sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 4
sbi PORTB, 5

call millidelay
ret

show6:
call wipedisp

sbi PORTD, 3
sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5

call millidelay
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

call millidelay
ret

show8:
call wipedisp

sbi PORTD, 3
sbi PORTD, 4
sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5

call millidelay
ret

show9:
call wipedisp

sbi PORTD, 3
sbi PORTD, 4
sbi PORTD, 5
sbi PORTB, 4
sbi PORTB, 5

call millidelay
ret

showA:
call wipedisp

sbi PORTD, 3
sbi PORTD, 4
sbi PORTD, 5
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5

call millidelay
ret

showB:
call wipedisp

sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5

call millidelay
ret

showC:
call wipedisp

sbi PORTD, 3
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4

call millidelay
ret

jumpinf2D:
jmp inf2

showD:
call wipedisp

sbi PORTD, 4
sbi PORTD, 5
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 5

call millidelay
ret

showE:
call wipedisp

sbi PORTD, 3
sbi PORTD, 6
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5

call millidelay
ret

showF:
call wipedisp

sbi PORTD, 3
sbi PORTB, 3
sbi PORTB, 4
sbi PORTB, 5

call millidelay
ret

displayQM:
call wipedisp

sbi PORTD, 3
sbi PORTD, 4
sbi PORTB, 3
sbi PORTB, 5

ret

showDash:
call wipedisp

sbi PORTB, 5

ret

wipedisp:

cbi PORTD, 3
cbi PORTD, 4
cbi PORTD, 5
cbi PORTD, 6
cbi PORTB, 3
cbi PORTB, 4
cbi PORTB, 5

ret

millidelay:
  ldi r19, 0xEF
  outloop:

  ldi r23, 0x0
  innerloop:

  ldi r22, 0x0
  nestedinnerloop:

  mul r21, r21
  inc r22
  brne nestedinnerloop

  inc r23
  brne innerloop

  inc r19
  brne outloop

  ret
