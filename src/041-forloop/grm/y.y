%{
#include<stdio.h>
#include<stdlib.h>
#include "fl.yy.h"
int yyerror(char* error){
    printf("E:%.100s\n",error);
    return 1;
}
int result=0;
%}

%token SEMI_ FOR_ DTYPE_

%token NUM_ VARCHAR_

%token CEQ_ CGE_ CGT_ CLE_ CLT_ CNE_

%token EQ_ ADD_ SUB_ MULT_ DIV_ INC_ DEC_

%token CBSTART_ CBEND_ BSTART_ BEND_


%token EXPRMARK_

%%
body: body floop
    |;

floop: FOR_ foreval fbody {result+=1;};
foreval: BSTART_ forinit SEMI_ forcondition SEMI_ forchange BEND_;

forinit: DTYPE_ asnexpr | asnexpr|;
forcondition: bcexpr |;
forchange: asnexpr |;


fbody: CBSTART_ body CBEND_
| floop
| SEMI_
;

asnexpr: VARCHAR_ EQ_ bcexpr
        | bcexpr;

bcexpr: beexpr
    | bcexpr CGE_ beexpr
    | bcexpr CLE_ beexpr
    | bcexpr CGT_ beexpr
    | bcexpr CLT_ beexpr
    ;

beexpr: expr
    | beexpr CEQ_ expr
    | beexpr CNE_ expr
    ;
expr: term 
    | expr ADD_ term 
    | expr SUB_ term 
    ;

term: factor
    | term MULT_ factor 
    | term DIV_ factor
    ;

factor: NUM_
      | ADD_ NUM_
      | SUB_ NUM_
      | INC_ NUM_
      | DEC_ NUM_
      | NUM_ INC_
      | NUM_ DEC_
      | ADD_ VARCHAR_
      | SUB_ VARCHAR_
      | INC_ VARCHAR_
      | DEC_ VARCHAR_
      | VARCHAR_ INC_
      | VARCHAR_ DEC_
      | VARCHAR_
      | BSTART_ asnexpr BEND_
      ;
%%

int main(void){
    printf("Provide input:\n");
    int x = yyparse();
    
    printf("\nResult(%d) %.5s\n",x,x?"FAIL":"OK");
    if(!x) printf("Result: %d\n",result);
    return x;
}