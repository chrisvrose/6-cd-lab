%{ 
    #include <stdio.h>
    #include <stdlib.h>
    int pint=0,nint=0,pfrac=0,nfrac=0;
%}

DI [0-9]
EN [ \n]|"\r\n"
%%
[+-]?{DI}+[.][+-]{DI}{EN} {}
[+]?{DI}+[/][+]{DI}{EN} {pfrac++;}
[+]?{DI}+[/][-]{DI}{EN} {nfrac++;}
[-]{DI}+[/][+]{DI}{EN} {nfrac++;}
[-]{DI}+[/][-]{DI}{EN} {pfrac++;}

[+]?{DI}+[./]{DI}+{EN} {pfrac++;}
[-]{DI}+[./]{DI}+{EN} {nfrac++;}
[+]?{DI}+{EN} {pint++;}
[-]{DI}+{EN} {nint++;}
.|[ \r\n] {} 
%%

int main(){
    yylex();
    printf("Stats:\n+:%d\n-:%d\n+.:%d\n-.:%d\n",pint,nint,pfrac,nfrac);
    return 0;
}