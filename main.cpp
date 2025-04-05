#include <iostream>
extern int yyparse();

int main() {
    std::cout << "Enter code (e.g. Z = A * B + 1;) then press Enter:\n";
    yyparse();
    return 0;
}