%{
	#include <ctype.h> 
  #include <stdio.h> 
  #include <string.h>

  int yylex(void);
  int yyerror(char* s);

  #define YYDEBUG 1

  int productions[1024];
  int production_index = 0;

  void addProduction(int production) 
  {
    productions[production_index++] = production;
  }

  void printProductions() 
  {
    int i;
    for (i = 0; i < production_index; i++) 
    {
      printf("%d ", productions[i]);
    }
    printf("\n");
  }
%}


%token BEGIN_TOKEN
%token END
%token INT 
%token CHAR
%token STRING
%token ARRAY
%token IF
%token THEN
%token ELSE
%token FOR
%token WHILE 
%token READ
%token WRITE
%token RETURN_TOKEN

%token IDENTIFIER
%token INTEGER_CONST
%token STRING_CONST
%token CHAR_CONST

%token ADD
%token SUB
%token MUL
%token DIV

%token EQ
%token NE
%token LT
%token LE
%token GT
%token GE

%token ASSIGN

%token OPEN_CURLY
%token CLOSE_CURLY
%token OPEN_BRACKET
%token CLOSE_BRACKET
%token OPEN_SQUARE
%token CLOSE_SQUARE

%token COMMA
%token COLON
%token SEMICOLON

%start program

%%
program : compound_statement {addProduction(0);}
        ;

compound_statement : BEGIN_TOKEN statement_list END {addProduction(1);}
                   ;

statement_list : statement SEMICOLON {addProduction(2);}
               | statement_list statement SEMICOLON {addProduction(3);}
               ;

statement : assignment_statement {addProduction(4);}
          | declaration_statement {addProduction(5);}
          | io_statement {addProduction(6);}
          | if_statement {addProduction(7);}
          | for_statement {addProduction(8);}
          | while_statement {addProduction(9);}
          | return_statement {addProduction(10);}
          ;

assignment_statement : IDENTIFIER ASSIGN expression {addProduction(11);}
                     | IDENTIFIER ASSIGN OPEN_CURLY array_factor_int CLOSE_CURLY {addProduction(12);}
                     ;

expression : expression ADD term {addProduction(13);}
           | expression SUB term {addProduction(14);}
           | term {addProduction(15);}
           ;

term : term MUL factor {addProduction(16);}
     | term DIV factor {addProduction(17);}
     | factor {addProduction(18);}
     ;

factor : OPEN_BRACKET expression CLOSE_BRACKET {addProduction(19);}
       | IDENTIFIER {addProduction(20);}
       | INTEGER_CONST {addProduction(21);}
       ;

array_factor_int : INTEGER_CONST {addProduction(22);}
                 | array_factor_int COMMA INTEGER_CONST {addProduction(23);} 
                 ;

declaration_statement : IDENTIFIER COLON type {addProduction(24);}
                      ;

type : simple_type {addProduction(25);}
     | array_type {addProduction(26);}
     ;

simple_type : INT {addProduction(27);}
            | CHAR {addProduction(28);}
            | STRING {addProduction(29);}
            ;

array_type : ARRAY OPEN_SQUARE simple_type CLOSE_SQUARE {addProduction(30);}
           ;

io_statement : READ OPEN_BRACKET IDENTIFIER CLOSE_BRACKET {addProduction(31);}
             | WRITE OPEN_BRACKET IDENTIFIER CLOSE_BRACKET {addProduction(32);}
             | WRITE OPEN_BRACKET STRING_CONST CLOSE_BRACKET {addProduction(33);}
             ;

if_statement : IF OPEN_BRACKET condition CLOSE_BRACKET THEN compound_statement {addProduction(34);}
             | IF OPEN_BRACKET condition CLOSE_BRACKET THEN compound_statement ELSE compound_statement {addProduction(35);}
             ;

condition : expression relation expression {addProduction(36);}
          ;

relation : EQ {addProduction(37);}
         | NE {addProduction(38);}
         | LT {addProduction(39);}
         | GT {addProduction(40);}
         | LE {addProduction(41);}
         | GE {addProduction(42);}
         ;

for_statement : FOR for_conditions compound_statement {addProduction(43);}
              ;

for_conditions : OPEN_BRACKET INT assignment_statement SEMICOLON condition SEMICOLON assignment_statement CLOSE_BRACKET {addProduction(44);}
               ;

while_statement : WHILE OPEN_BRACKET condition CLOSE_BRACKET compound_statement {addProduction(45);}
                ;

return_statement : RETURN_TOKEN expression {addProduction(46);}
                 ;

%%

int yyerror(char *s)
{
    printf("Error: %s\n", s);
}

extern FILE *yyin;

int main(int argc, char** argv) 
{
  if (argc > 1) 
  {
    yyin = fopen(argv[1], "r");
    if (!yyin) 
    {
      printf("'%s': Could not open specified file\n", argv[1]);
      return 1;
    }
  }

  if (argc > 2 && strcmp(argv[2], "-d") == 0) 
  {
    printf("Debug mode on\n");
    yydebug = 1;
  }

  printf("Starting parsing...\n");

  if (yyparse() == 0) 
  {
    printf("Parsing successful!\n");
    printProductions();
    return 0;
  }

  printf("Parsing failed!\n");
  return 0;


}