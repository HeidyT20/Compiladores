package com.mycompany.proyecto;

%%

// Opciones y declaraciones
%class AnalizadorLexico
%public
%standalone
%char
%line
%column

%{

// Método para imprimir información del token encontrado
public void imprimirToken(String tipo, String valor, int linea, int columna) {
    System.out.println("[" + tipo + "] '" + valor + "' en Línea: " + linea + ", Columna: " + columna);
}

%}

// Expresiones regulares
letra = [a-zA-Z]
digito = [0-9]
id = {letra}({letra}|{digito})*
entero = {digito}+
decimal = {digito}+ "." {digito}+
cadena = \"([^\"\n]|\\")*\"
espacio = [ \t\r\n]+

// Palabras clave (insensibles a mayúsculas si se desea)
%%

// Ignorar espacios en blanco
{espacio}    { /* no hacer nada */ }

// Palabras clave
"DEFINE"      { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); }
"PRINT"       { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); }
"IF"          { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); }
"ELSE"        { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); }
"ELSEIF"      { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); }
"WHILE"       { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); }
"LOOP"        { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); }
"FUNCTION"    { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); }
"RETURN"      { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); }
"END"         { imprimirToken("Palabra clave", yytext(), yyline, yycolumn); }

// Tipos de datos y booleanos
"true"        { imprimirToken("Booleano", yytext(), yyline, yycolumn); }
"false"       { imprimirToken("Booleano", yytext(), yyline, yycolumn); }

// Operadores aritméticos
"+"           { imprimirToken("Operador aritmético", yytext(), yyline, yycolumn); }
"-"           { imprimirToken("Operador aritmético", yytext(), yyline, yycolumn); }
"*"           { imprimirToken("Operador aritmético", yytext(), yyline, yycolumn); }
"/"           { imprimirToken("Operador aritmético", yytext(), yyline, yycolumn); }

// Operadores relacionales
"<="          { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); }
">="          { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); }
"<"           { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); }
">"           { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); }
"=="          { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); }
"!="          { imprimirToken("Operador relacional", yytext(), yyline, yycolumn); }

// Operadores lógicos
"AND"         { imprimirToken("Operador lógico", yytext(), yyline, yycolumn); }
"OR"          { imprimirToken("Operador lógico", yytext(), yyline, yycolumn); }
"NOT"         { imprimirToken("Operador lógico", yytext(), yyline, yycolumn); }

// Identificadores
{id}          { imprimirToken("Identificador", yytext(), yyline, yycolumn); }

// Literales numéricos
{decimal}     { imprimirToken("Decimal", yytext(), yyline, yycolumn); }
{entero}      { imprimirToken("Entero", yytext(), yyline, yycolumn); }

// Cadenas
{cadena}      { imprimirToken("Cadena", yytext(), yyline, yycolumn); }

// Otros símbolos
"("           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); }
")"           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); }
"{"           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); }
"}"           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); }
","           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); }
";"           { imprimirToken("Símbolo", yytext(), yyline, yycolumn); }

// Error léxico
.             { System.err.println("ERROR: Símbolo no reconocido '" + yytext() + "' en línea " + yyline + ", columna " + yycolumn); }

