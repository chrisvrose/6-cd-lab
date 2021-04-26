
%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
%}

%%
[Aa] return A;
[bB] return B;
[cC] return C;
[ \r\n]|"\r\n" {return 0;}
%%
