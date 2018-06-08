PROJECT_DIR := $(shell pwd)
PROM	= cae_vad
CXX	?= ../../buildroot/output/host/usr/bin/aarch64-rockchip-linux-gnu-g++

CPPFLAGS ?= -fPIC -O3 -I$(PROJECT_DIR)/include -L$(PROJECT_DIR)/libs -ldl -lpthread -lasound
OBJ = samples/cae_lib.o  samples/cae_sample.o  samples/InfoLed.o

$(PROM): $(OBJ)	
	echo "arch=$(ARCH)"
	$(CXX) -o $(PROM) $(OBJ) $(CPPFLAGS)
%.o: %.cpp
	$(CXX) -c $< -o $@ $(CPPFLAGS)
clean:
	@rm -fr $(OBJ) $(PROM)

install:
	sudo install -D -m 755 cae_vad -t /usr/bin/
