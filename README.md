`init/none.lib` is just the none.lib of `cc65 v 2.19 - Git 51b946bf2` (located in `lib` folder)

`src/crt0.s` : code responsible for system init and give the hand to main function

`src/interrupt.s` : code for NMI and IRQ interrupts

`src/vectors.s` : reset vectors (byte FFFA to FFFF (part that contains addresses to first instruction when reset, IRQ and NMI))