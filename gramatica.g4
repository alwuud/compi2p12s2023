grammar YourLanguage;

program: statement+;

statement: variableDeclaration
        | expressionStatement
        ;

variableDeclaration: ('var' | 'let') Identifier (':' dataType)? '=' expression;

dataType: 'int'
        | 'float'
        | 'string'
        | 'char'
        | 'bool'
        ;

expressionStatement: expression;

expression: primaryExpression
         | expression ('+' | '-') expression
         | expression ('*' | '/') expression
         | '(' expression ')'
         ;

primaryExpression: literal
                | Identifier
                ;

literal: IntegerLiteral
       | FloatLiteral
       | StringLiteral
       | CharLiteral
       | 'nil'
       | 'true'
       | 'false'
       ;

IntegerLiteral: [0-9]+;

FloatLiteral: [0-9]+ '.' [0-9]+;

StringLiteral: '"' (ESC | ~["\\])* '"';

CharLiteral: '\'' (ESC | ~['])* '\'';

fragment ESC: '\\' [tnr"'\\"];

Identifier: [a-zA-Z][a-zA-Z0-9_]*;

WS: [ \t\r\n]+ -> skip;
