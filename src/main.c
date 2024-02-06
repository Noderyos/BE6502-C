#define STA(address, value) ((*(volatile unsigned char *) address) = (value))

#define PORTB (*(volatile unsigned char *)0x6000)

void delay();

void main(void) {
  STA(0x6002, 0xFF);

  while (1) {
    PORTB = 0x55;
    delay();
    PORTB ^= 0xAA;
    delay();
  }
}


void delay(){
    int a = 0x0FFF;
    while(a > 0)
        a--;
}
