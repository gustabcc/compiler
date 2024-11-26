%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

"int"         { printf("Keyword: int\n"); }
"return"      { printf("Keyword: return\n"); }
"printf"      { printf("Keyword: printf\n"); }
"float"       { printf("Keyword: float\n"); }
"double"      { printf("Keyword: double\n"); }
"if"          { printf("Keyword: if\n"); }
"else"        { printf("Keyword: else\n"); }
"while"       { printf("Keyword: while\n"); }
"for"         { printf("Keyword: for\n"); }
"break"       { printf("Keyword: break\n"); }
"continue"    { printf("Keyword: continue\n"); }

"("           { printf("Left Parenthesis\n"); }
")"           { printf("Right Parenthesis\n"); }
"{"           { printf("Left Brace\n"); }
"}"           { printf("Right Brace\n"); }
"["           { printf("Left Bracket\n"); }
"]"           { printf("Right Bracket\n"); }
"+"           { printf("Operator: +\n"); }
"-"           { printf("Operator: -\n"); }
"*"           { printf("Operator: *\n"); }
"/"           { printf("Operator: /\n"); }
"%"           { printf("Operator: %%\n"); }
"="           { printf("Operator: =\n"); }
"=="          { printf("Operator: ==\n"); }
"!="          { printf("Operator: !=\n"); }
"<"           { printf("Operator: <\n"); }
"<="          { printf("Operator: <=\n"); }
">"           { printf("Operator: >\n"); }
">="          { printf("Operator: >=\n"); }
"&&"          { printf("Operator: &&\n"); }
"||"          { printf("Operator: ||\n"); }
"!"           { printf("Operator: !\n"); }
";"           { printf("Semicolon\n"); }
","           { printf("Comma\n"); }

\".*\"        { printf("String: %s\n", yytext); }
\'.\'         { printf("Character: %s\n", yytext); }
[0-9]+\.[0-9]+ { printf("Floating Point Number: %s\n", yytext); }
[0-9]+        { printf("Integer: %s\n", yytext); }

[a-zA-Z_][a-zA-Z_0-9]* { printf("Identifier: %s\n", yytext); }

"//".*        { printf("Comment: %s\n", yytext); }
"/*".*"*/"    { printf("Block Comment: %s\n", yytext); }

[\n\t ]+      { /* Ignorar espaços em branco e novas linhas */ }

.             { printf("Unknown character: %s\n", yytext); }

%%

int main() {
    yylex();  // Chama o analisador léxico
    return 0;
}

int yywrap(void) {
    return 1;  // Retorna 1 para indicar o fim da análise
}
