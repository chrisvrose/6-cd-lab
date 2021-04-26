%{
#include<stdio.h>
#include<stdlib.h>
#include "fl.yy.h"
int yyerror(char* error){
    printf("E:%.100s\n",error);
    return 1;
}

%}

%token A
%token B
%token C

%%
S: X Y;
X: A X B
 |;
Y: B Y C
 |;
%%

int main(void){
    int x = yyparse();
    // if(x==0) {printf("\nEXPR:%.500s\n",text);}
    printf("\nResult(%d) %.5s\n",x,x?"FAIL":"OK");
    return x;
}