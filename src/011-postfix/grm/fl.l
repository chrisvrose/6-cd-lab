
%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
%}

%%
[0-9]+ {yylval = atoi(yytext) ;return NUM;}
[a-zA-Z] {yylval=yytext[0]; return VARCHAR;}
[+] {return ADD;}
[-] {return SUB;}
[*] {return MULT;}
[/] {return DIV;}

[\(] {return BSTART;}
[\)] {return BEND;}
\n {return 0;}
. {return yytext[0];}
%%
