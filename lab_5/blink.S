#define __SFR_OFFSET 0

#include "avr/io.h"

.global start
.global blink

start:
  ret

blink:
;ldi r19, 0x0
;outer_loop:
  ldi r16, 0xFF ; Load register 16 with 0xFF (all bits 1)
  out DDRB, r16 ; Write 0xFF to Data Direction Register for port B. This defines all pins on port B as output.
  ldi r16, 0x0 ; Load register 16 with 0x00 (all bits 0)
  out PORTB, r16 ; Write 0x00 to port B. This sets all pins to 0.
  sbi PORTB, 0 ; Sets bit 0 on port B to 1.
ldi r21, 0xF5; load with 10
out_out_loop1:
ldi r20, 0x0;
out_loop1:
ldi r18, 0x0 ; load with 0
loop1: mul r17, r17
  mul r17, r17
  mul r17, r17
  mul r17, r17
  mul r17, r17
  inc r18
  brne loop1
inc r20
brne out_loop1
inc r21
brne out_out_loop1

  ldi r16, 0xFF ; Load register 16 with 0xFF (all bits 1)
  out DDRB, r16 ; Write 0xFF to Data Direction Register for port B. This definesall pins on port B as output.
  ldi r16, 0x0 ; Load register 16 with 0x00 (all bits 0)
  cbi PORTB, 0 ; Clears bit 0 on port B to 0.

ldi r21, 0xF5; load with 10
out_out_loop2:
ldi r20, 0x0;
out_loop2:
ldi r18, 0x0 ; load with 0
loop2: mul r17, r17
  mul r17, r17
  mul r17, r17
  mul r17, r17
  mul r17, r17
  inc r18
  brne loop2
inc r20
brne out_loop2
inc r21
brne out_out_loop2

;inc r19
;brne outer_loop