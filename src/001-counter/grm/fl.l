%{
int c1=0,c2=0;
int numlines=0,numwhites=0;
%}

%%
"exit" {return 0;}
[a-zA-Z]+ {c1+=yyleng;c2++;}
\n {numlines++;}
[ \t] {numwhites++;}
%%


int main(){
    yylex();
    printf("Counts:\n %d %d %d %d\n",c1,c2,numlines,numwhites);
    return 0;
}