BIN=calc
SRC=main.c args.c operations.c
HEADERS=args.h operations.h
CFLAGS?=--std=c99 -g

all: $(BIN)

$(BIN): $(SRC) $(HEADERS)
	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(SRC)

%.o: %.c %.h
	$(CC) -c $@ $(CFLAGS) $(LDFLAGS)


clean:
	rm -rf *.o *.dSYM
	rm $(BIN)

reallyclean: clean
