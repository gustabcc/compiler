%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
"int"         { printf("Keyword: int\n"); }
"return"      { printf("Keyword: return\n"); }
"printf"      { printf("Keyword: printf\n"); }
"("           { printf("Left Parenthesis\n"); }
")"           { printf("Right Parenthesis\n"); }
"{"           { printf("Left Brace\n"); }
"}"           { printf("Right Brace\n"); }
"+"           { printf("Operator: +\n"); }
"-"           { printf("Operator: -\n"); }
"="           { printf("Operator: =\n"); }
[0-9]+        { printf("Integer: %s\n", yytext); }
[a-zA-Z_][a-zA-Z_0-9]* { printf("Identifier: %s\n", yytext); }
[\n\t ]+      { /* Ignorar espaços em branco e novas linhas */ }
.             { printf("Unknown character: %s\n", yytext); }
%%

int main() {
    yylex();  // Chama o analisador léxico
    return 0;
}

int yywrap(void) {
    return 1;  // Retorna 1 para indicar o fim da análise do arquivo
}