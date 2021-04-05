%{
#include<stdio.h>
int np=0,ns=0;
%}

%%
"printf" {np++;fprintf(yyout,"writef");}
"scanf" {ns++;fprintf(yyout,"readf");}
%%

// Write a LEX program to count the number of ‘scanf’ and ‘printf’ statements in a C  program.
// Replace them with ‘readf’ and ‘writef’ statements respectively. 
int main(){
    yyin = fopen("input.txt","r");
    if(yyin==NULL) {printf("FAIL1");return 1;}
    yyout = fopen("output.txt","w+");
    if(yyout==NULL) {printf("FAIL2");return 1;}

    yylex();
    printf("Counts:\n %d %d\n",np,ns);
    return 0;
}