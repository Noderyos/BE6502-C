SRC := src
OBJ := obj

MKDIR = mkdir

CC = cc65
AS = ca65
LD = ld65
AR = ar65

TARGET = rom.bin

SRCS := $(wildcard $(SRC)/*.c)
ASMS := $(wildcard $(SRC)/*.s)

C_ASMS := $(patsubst $(SRC)/%.c, $(OBJ)/%.c.s, $(SRCS))
C_OBJS := $(patsubst $(OBJ)/%.c.s, $(OBJ)/%.c.o, $(C_ASMS))

A_OBJS += $(patsubst $(SRC)/%.s, $(OBJ)/%.s.o, $(ASMS))

all: $(TARGET)

flash: $(TARGET)
	minipro -p AT28C16@SOIC24 -w $<

$(TARGET): $(C_OBJS) $(A_OBJS)
	$(LD) -C init/breadboard.cfg $^ init/none.lib -o $(TARGET)

$(OBJ)/%.c.o: $(OBJ)/%.c.s $(OBJ)
	$(AS) -o $@ $<

$(OBJ)/%.s.o: $(SRC)/%.s $(OBJ)
	$(AS) -o $@ $<

$(OBJ)/%.c.s: $(SRC)/%.c $(OBJ)
	$(CC) -o $@ $<

$(OBJ):
	$(MKDIR) -p $@



clean:
	rm -frv $(OBJ) $(TARGET)

