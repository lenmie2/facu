#
# Compilers
#
CC = gcc
#CC=g++

#
# exes
# 
EXE0=emp
#
# Flags
#
CFLAGS=-Wall -std=c99 
#CFLAGS=-Wall -std=c99 -G

#
# Libs + Incs
#
MYLIBDIR=
lib=
INC=-Iinclude
#INC=-I.

#   
# set object files   
#   
OBJ0=$(EXE0).o

#
# Other objects
#
OBJS=emp_op.o emp_args.o

#
# SRC
#

## make all
all: $(EXE0) 

# make main
$(EXE0): $(OBJ0) $(OBJS)
	$(CC) $(CFLAGS) $(OBJ0) $(OBJS) -o $@

.c.o: 
	$(CC) $(CFLAGS) $(INC) -c $<

clean:
	rm -f *.o $(EXE0) a.out core

splash:
	rm -f *~

### EOF ###










