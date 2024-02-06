`init/none.lib` is just the none.lib of `cc65 v 2.19 - Git 51b946bf2` (located in `lib` folder)

`init/breadboard.cfg` : memory layout configuration for BE6502

`src/crt0.s` : code responsible for system init and give the hand to main function

`src/interrupt.s` : code for NMI and IRQ interrupts

`src/vectors.s` : reset vectors (byte FFFA to FFFF (part that contains addresses to first instruction when reset, IRQ and NMI))

`src/main.c` : main file (you can rename it, remove it, launch a thermonuclear missile on it, I don't care, but you need to have a main() function)
