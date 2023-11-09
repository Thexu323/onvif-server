#CROSS = arm-himix200-linux-
COMPILE = $(CROSS)gcc -g -DWITH_NONAMESPACES  -DSOAP_DEBUG -DDEBUG

SRC = $(wildcard ./soap/*.c ./src/*.c)
OBJ = $(patsubst %.c, %.o, $(SRC))

INC = -I./soap
INC += -I./src

all: $(OBJ)
	$(COMPILE) -o onvif-server $(OBJ) -lpthread

%.o: %.c
	$(COMPILE) $(INC) -c $< -o $@

clean:
	rm -f $(OBJ) onvif-server RECV.log  SENT.log TEST.log

debug:
	echo $(OBJDIR)
