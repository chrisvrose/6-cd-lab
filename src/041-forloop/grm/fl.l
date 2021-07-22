
%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
%}

%%
"for" {return FOR_;}
[0-9]+ {yylval = atoi(yytext) ;return NUM_;}


"int" {return DTYPE_;}
"float" {return DTYPE_;}
"double" {return DTYPE_;}
"long" {return DTYPE_;}
"short" {return DTYPE_;}

[a-zA-Z]+ {yylval=yytext[0]; return VARCHAR_;}

[;] return SEMI_;

"==" return CEQ_;
">=" return CGE_;
"<=" return CLE_;
[>] return CGT_;
[<] return CLT_;
"!=" return CNE_;


"++" {return INC_;}
"--" {return DEC_;}

[=] {return EQ_;}
[+] {return ADD_;}
[-] {return SUB_;}
[*] {return MULT_;}
[/] {return DIV_;}

[\{] {return CBSTART_;}
[\}] {return CBEND_;}

[\(] {return BSTART_;}
[\)] {return BEND_;}
\n {return 0;}
" " {}
. {printf("unrecognized %s\n",yytext);return yytext[0];}
%%
