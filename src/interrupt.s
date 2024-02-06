; Checks for a BRK instruction and returns from all valid interrupts.

.setcpu "65c02"
.export   _irq_int, _nmi_int

.segment  "CODE"

; Non-maskable interrupt (NMI)

_nmi_int:  RTI ; Just return

; Maskable interrupt (IRQ)

_irq_int:  PHX                    ; Save X register contents to stack
           TSX                    ; Transfer stack pointer to X
           PHA                    ; Save accumulator contents to stack
           INX                    ; Increment X so it points to the status
           INX                    ;   register value saved on the stack
           LDA $100,X             ; Load status register contents
           AND #$10               ; Isolate B status bit
           BNE break              ; If B = 1, BRK detected

; IRQ detected, return

irq:       PLA                    ; Restore accumulator contents
           PLX                    ; Restore X register contents
           RTI                    ; Return from all IRQ interrupts

; BRK detected, stop

break:     JMP _stop              ; If BRK is detected, something not cool happend LOL

.proc _stop: near

.byte      $DB                    ; Inserts a STP opcode

.endproc
