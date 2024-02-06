; Startup code

.export   _init, _exit
.import   _main

.export   __STARTUP__ : absolute = 1
.import   __RAM_START__, __RAM_SIZE__

.import    copydata, zerobss, initlib, donelib

.include  "zeropage.inc"

; startup is in a specific section

.segment  "STARTUP"

_init:    LDX     #$FF                 ; Initialize stack pointer to $FF
          TXS
          CLD                          ; Clear decimal mode

; Set stack pointer for cc65 arguments

          LDA     #<(__RAM_START__ + __RAM_SIZE__)
          STA     sp
          LDA     #>(__RAM_START__ + __RAM_SIZE__)
          STA     sp+1

; Init mem

          JSR     zerobss              ; Clear BSS segment
          JSR     copydata             ; Initialize DATA segment
          JSR     initlib              ; Run constructors

; Call main function

          JSR     _main

; back from main, force a software break

_exit:    JSR     donelib
          BRK
