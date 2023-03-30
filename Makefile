BISON= bison -d -v -t
FLEX= flex
all: calc

calc.tab.c calc.tab.h:	calc.y
	$(BISON) calc.y

lex.yy.c: calc.l calc.tab.h
	$(FLEX) calc.l

calc: lex.yy.c calc.tab.c calc.tab.h
	gcc -o calc calc.tab.c lex.yy.c

clean:
	rm calc calc.tab.c lex.yy.c calc.tab.h calc.output