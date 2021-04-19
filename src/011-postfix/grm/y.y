%{
#include<stdio.h>
#include<stdlib.h>
#include "fl.yy.h"
int yyerror(char* error){
    printf("E:%.100s\n",error);
    return 1;
}
char text[500]={0};
int pos=0;
%}

%token NUM
%token ADD
%token VARCHAR
%token SUB
%token MULT
%token DIV
%token BSTART
%token BEND
%token EXPRMARK

%%
expr: term 
    | expr ADD term {text[pos++]='+';}
    | expr SUB term {text[pos++]='-';}
    ;

term: factor
    | term MULT factor {text[pos++]='*';}
    | term DIV factor {text[pos++]='/';}
    ;

factor: NUM {
              char val[500]={0};
              sprintf(val,"%d",yylval);
              if(strlen(val)>1)
                sprintf(val,"[%d]",yylval);
              strcat(text,val);
              pos+=strlen(val);
            }
      | ADD NUM {
          char val[500]={0};
              sprintf(val,"[%d]",yylval);
              strcat(text,val);
              pos+=strlen(val);
      }
      | SUB NUM {
          char val[500]={0};
              sprintf(val,"[%d]",-yylval);
              strcat(text,val);
              pos+=strlen(val);
      }
      | VARCHAR {
          text[pos++]=yylval;
      }
      | BSTART expr BEND
%%

int main(void){
    int x = yyparse();
    if(x==0) {printf("\nEXPR:%.500s\n",text);}
    printf("\nResult(%d) %.5s\n",x,x?"FAIL":"OK");
    return x;
}