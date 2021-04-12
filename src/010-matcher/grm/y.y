%{
#include<stdio.h>
#include "fl.yy.h"
int yyerror(char* error){
    printf("E:%.100s\n",error);
    return 1;
}
%}

%%
S : 'a' S 'b'
  | 'a' 'b';
%%

int main(void){
    int x = yyparse();
    printf("Result %.6s\n",x?"FAIL":"OK");
    return x;
}