# bison-flex-calc

Simple example of Bison and Flex usage. This program requires both flex and bison to be used.

## About 
This program aims to show how to use different flex and bison mechanism such as start conditions, passing semantic value etc... This program  is an asbsurd calculator that is able to take positive integers and perform addition and substraction between them. Whenever the character `#` is given, the lexer enters in a second state, and all following input is ignored until EOF.

## Usage 
To create the executable:
```
make
```
or alternatively: 

``` 
bison -d -t -v  calc.y
flex calc.l
gcc -o calc calc.tab.c lex.yy.c
```
Start the executable with `./calc`.

Clean the directory through `make clean`.

