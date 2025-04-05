%{
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <sstream>
#include <vector>
using namespace std;

extern int yylex();
void yyerror(const char* msg);

int tempCount = 1;
char varZ[100];
vector<string> tac;
vector<string> optim;
vector<pair<string, string>> mul_results; // (temp, multiplication)

string newTemp() {
    stringstream ss;
    ss << "t" << tempCount++;
    return ss.str();
}
%}

%union {
    int num;
    char* str;
    char* temp;
}

%token <str> IDENTIFIER
%token <num> NUMBER
%token ASSIGN PLUS MINUS STAR SLASH SEMICOLON UNKNOWN
%token LPAREN RPAREN
%type <temp> expression term factor
%left PLUS MINUS
%left STAR SLASH
%%
input:
    assignment
    ;

assignment:
    IDENTIFIER ASSIGN expression SEMICOLON {
        strcpy(varZ, $1);
        tac.push_back(varZ + string(" = ") + $3);

        printf("[Three Address Code]\n");
        for (auto line : tac) printf("%s\n", line.c_str());

        printf("\n[Optimized Instructions]\n");
        for (auto line : optim) printf("%s\n", line.c_str());

        printf("\n[Final Code]\n");
        FILE* fout = fopen("output.asm", "w");
        for (auto line : tac) fprintf(fout, "%s\n", line.c_str());
        fprintf(fout, "STORE %s\n", varZ);
        fclose(fout);

        printf("[Assembly Written to output.asm]\n");
    }
    ;

expression:
    expression PLUS term {
        string t = newTemp();
        string combined = string($1) + " + " + $3;
        tac.push_back(t + " = " + combined);

        for (auto& m : mul_results) {
            if (strcmp($1, m.first.c_str()) == 0 && strcmp($3, "1") == 0) {
                optim.push_back("MIXMUL " + t + " = " + m.second + " + 1");
            }
        }

        $$ = strdup(t.c_str());
    }
  | expression MINUS term {
        string t = newTemp();
        tac.push_back(t + " = " + $1 + " - " + $3);
        $$ = strdup(t.c_str());
    }
  | term { $$ = $1; }
  ;

term:
    term STAR factor {
        string t = newTemp();
        string combined = string($1) + " * " + $3;
        tac.push_back(t + " = " + combined);
        mul_results.push_back({t, combined});
        $$ = strdup(t.c_str());
    }
  | term SLASH factor {
        string t = newTemp();
        tac.push_back(t + " = " + $1 + " / " + $3);
        $$ = strdup(t.c_str());
    }
  | factor { $$ = $1; }
  ;

factor:
    IDENTIFIER { $$ = strdup($1); }
  | NUMBER {
        char buf[32];
        sprintf(buf, "%d", $1);
        $$ = strdup(buf);
    }
  | LPAREN expression RPAREN { $$ = $2; }
  ;
%%

void yyerror(const char* msg) {
    fprintf(stderr, "Parse error: %s\n", msg);
}
