LIB_NAME ?= config
STATIC_LIB ?= lib$(LIB_NAME).a

all: lib test

lib: 
	@rm -rf *.o
	@rm -rf *.a
	gcc -c cfg_util.c config.c;
	ar -cr $(STATIC_LIB) cfg_util.o config.o;
	@echo "==> $(STATIC_LIB)"

test: cfg_util.o config.o example.o
	@rm -rf test
	gcc -o test cfg_util.o config.o example.o
	@echo "==> test"

clean:
	@rm -rf *.o
	@rm -rf *.a
	@rm -rf test
	@rm -rf output.ini
