#common makefile header

DIR_INC = ../include
DIR_BIN = ../bin
DIR_LIB = ../libs
MW_DIR  = ./
TARGET	= cae_sample
BIN_TARGET = $(DIR_BIN)/$(TARGET)

CROSS_COMPILE = ../../../../buildroot/output/host/usr/bin/aarch64-rockchip-linux-gnu-

CFLAGS = -fPIC -O3 -I$(DIR_INC) -I./util

LDFLAGS := -L$(DIR_LIB)
LDFLAGS +=  -ldl -lpthread -lasound 

C_FILES =$(shell find $(SAMDIR) -name '*.cpp')
OBJECTS := $(C_FILES:%.cpp=%.o)

$(BIN_TARGET) : $(OBJECTS)
	$(CROSS_COMPILE)g++ $(CFLAGS) $^ -o $@ $(LDFLAGS)

$(OBJECTS): %.o: %.cpp
	$(CROSS_COMPILE)g++ -c $(CFLAGS) $(INCLUDE) $< -o $@ 
clean:
	@rm -fr $(OBJECTS) $(BIN_TARGET)

.PHONY:clean

#common makefile foot
