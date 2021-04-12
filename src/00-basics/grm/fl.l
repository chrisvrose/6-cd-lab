%{
int c1=0,c2=0,c3=0;
%}

%%
[aeiouAEIOU] {printf("%s vowel\n",yytext);c1++;}
[ \t\n] {c3++;}
[a-zA-Z]   {printf("%s text\n",yytext);c2++;}
. {}
%%

// Write a scanner to count the number of words, characters, lines and whitespaces. 
// int yywrap(){}

int main(){
    yylex();
    printf("vow:%d consonants:%d spaces:%d\n",c1,c2,c3);
    return 0;
}