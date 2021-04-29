%{
#include<stdio.h>
#include<stdlib.h>
#include "fl.yy.h"
#define CSA 255
int varmap[CSA];
short ismap[CSA];
int yyerror(char* error){
    printf("E:%.100s\n",error);
    return 1;
}
int result=0;
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
S: expr{$$=$1;result=$1;};
expr: term {$$=$1;}
    | expr ADD term {$$=$1+$3;}
    | expr SUB term {$$=$1-$3;}
    ;

term: factor
    | term MULT factor {$$=$1*$3;}
    | term DIV factor {$$=$1/$3;}
    ;

factor: NUM {
              $$=yylval;
            }
      | ADD NUM {
          $$=yylval;
      }
      | SUB NUM {
          $$=-yylval;
      }
      | VARCHAR {
          if(!ismap[yylval]){
            printf("\nP:Enter value for \'%c\':",yylval);
            scanf("%d",varmap+yylval);
            
          }
          $$=varmap[yylval];
      }
      | BSTART expr BEND {$$=$2;}
%%

int main(void){
    for(int i=0;i<CSA;i++){
        varmap[i]=0;ismap[i]=0;
    }
    printf("Enter an expression:\n");
    int x = yyparse();
    
    printf("\nResult(%d) %.5s\n",x,x?"FAIL":"OK");
    if(!x) printf("Result: %d\n",result);
    return x;
}