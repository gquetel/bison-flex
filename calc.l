
%option noyywrap nodefault 
%{
    #include <stdio.h>
    #include "calc.tab.h"
    extern int yyerror();
    
%}

%x SC_IGNORE

number  [0-9]
eol \n|\r\n

%%

<INITIAL>{
    [ \t]	        {continue; }            
    {number}+       {yylval.ival = atoi(yytext); return INT;}
    {eol}	        {return NEWLINE;}
    "+"		        {return PLUS;}
    "-"		        {return MINUS;}
    "#"             {BEGIN(SC_IGNORE); return COMMENT;}
    . { 
        yyerror("Invalid character");
    }
    <<EOF>> { 
        yyterminate();
    }
}

<SC_IGNORE>{
    .|{eol}   {continue;}
    <<EOF>> { yyterminate();}
}
