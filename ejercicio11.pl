% 1. Codifique en prolog las reglas necesarias para obtener el término N en la serie
%    de Gauss.
gauss(1, 1):- !.
gauss(N, Resultado):-
    N > 1,
    N1 is N - 1,
    gauss(N1, Parcial),
    Resultado is Parcial + N.

% 2. Codifique en prolog las reglas necesarias para obtener el término N en la serie
%    de Fibonacci (sin, y con mejora).

% Sin mejora
fibonacci(0, 0):- !.
fibonacci(1, 1):- !.
fibonacci(N, Resultado):-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, Parcial1),
    fibonacci(N2, Parcial2),
    Resultado is Parcial1 + Parcial2.

% Con mejora
fibonacci_mejorado(N, Resultado):- fibonacci_helper(N, 0, 1, Resultado).
fibonacci_helper(0, _, _, 0):- !.
fibonacci_helper(1, _, _, 1):- !.
fibonacci_helper(N, A, B, Resultado):-
    N > 1,
    N1 is N - 1,
    AB is A + B,
    fibonacci_helper(N1, B, AB, Parcial),
    Resultado is Parcial + A.

% 3. Codifique en prolog las reglas necesarias para obtener el factorial de un número
%    natural N.
factorial(0, 1):- !.
factorial(N, Resultado):-
    N > 0,
    N1 is N - 1,
    factorial(N1, Parcial),
    Resultado is Parcial*N.

% 4. Codifique en prolog las reglas necesarias para obtener el producto de dos numeros
%    X e Y, aplicando sumas sucesivas.
producto(_, 0, 0):- !.
producto(0, _, 0):- !.
producto(X, Y, Resultado):-
    Y1 is Y - 1,
    producto(X, Y1, Parcial),
    Resultado is Parcial + X.

% 5. Codifique en prolog las reglas necesarias para obtener la potencia N de un numero X
%    aplicando multiplicaciones sucesivas.
potencia(_, 0, 1):- !.
potencia(X, Y, Resultado):-
    Y > 0,
    Y1 is Y - 1,
    potencia(X, Y1, Parcial),
    Resultado is Parcial*X.

% 6. Codifique en prolog las reglas necesarias para obtener el cociente entre dos
%    números a partir de restas sucesivas.
cociente(0, _, 0):- !.
cociente(X, Y, 0):- X - Y < 0, !.
cociente(X, Y, Resultado):-
    X - Y >= 0,
    Y \= 0,
    X1 is X - Y,
    cociente(X1, Y, Parcial),
    Resultado is Parcial + 1.

% 7. Idem 6, pero que permita obtener el cociente y el resto. Definir la relación
%    mcd(X,Y,Z) que se verifique si Z es el máximo común divisor entre X e Y.
cociente_y_resto(0, _, 0, 0):- !.
cociente_y_resto(X, Y, 0, Resto):- X - Y < 0, Resto is X, !.
cociente_y_resto(X, Y, Resultado, Resto):-
    X - Y >= 0,
    Y \= 0,
    X1 is X - Y,
    cociente_y_resto(X1, Y, ResultParcial, Resto),
    Resultado is ResultParcial + 1.

mcd(X, Y, Y):- cociente_y_resto(X, Y, _, Resto), Resto == 0, !.
mcd(X, Y, Z):-
    cociente_y_resto(X, Y, _, Resto),
    Resto \= 0, 
    mcd(Y, Resto, Z).

% 8. Define un predicado mcm(X,Y,M) que signifique "M es el mínimo común múltiplo
%    de X e Y".
mcm(X, Y, M):-
    mcd(X, Y, MCD),
    M is (X*Y) / MCD.