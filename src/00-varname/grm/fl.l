%{
int numidentifiers=0, numkeywords=0, numop=0;
%}

%%
"$exit" {return 0;}
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" {printf("keyword:%s\n",yytext);numkeywords++;}
[_a-zA-Z][_a-zA-Z0-9]* {printf("identifier:%s\n",yytext);numidentifiers++;}
[\+\-\*/\%\|\!\^=]|"->" {printf("identifier:%s\n",yytext);numop++;}
[ \n\t] {}
. {}
%%


//int yywrap(){}

int main(){
    yylex();
    printf("Counts:\n %d %d %d\n",numidentifiers,numkeywords,numop);
    return 0;
}