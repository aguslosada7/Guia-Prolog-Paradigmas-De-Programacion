% 1. Suma de todos los valores de una lista. suma/2 (Lista, Total)
suma([], 0).
suma([H | T], Total):-
    suma(T, Parcial),
    Total is Parcial + H.

% 2. Contar cuantos valores repetidos de un elemento hay en una lista. contar/3 (Lista,
%    Elemento, Cantidad)
contar([], _, 0).
contar([H | T], X, Cantidad):-
    X \= H,
    contar(T, X, Cantidad).
contar([H | T], X, Cantidad):-
    X == H,
    contar(T, X, Parcial),
    Cantidad is Parcial + 1.

% 3. Buscar todas las posiciones de un elemento en una lista. indice_de/3 (Lista,
%    Elemento, Posicion)
indice_de([X | _], X, 0):- !.
indice_de([_ | T], X, Posicion):- indice_helper(T, X, 1, Posicion).

indice_helper([X | _], X, PosActual, PosActual).
indice_helper([_ | T], X, PosActual, PosRes):-
    P1 is PosActual + 1,
    indice_helper(T, X, P1, PosRes).

% 4. Para un listado de 0 a n hechos nota/1, con notas de 1 a 10, hallar el promedio de
%    las mismas. promedio_nota/1
nota(8).
nota(6).
nota(10).
nota(8).
nota(4).

promedio_nota(Promedio):-
    findall(X, nota(X), ListadoNotas),
    suma(ListadoNotas, Suma),
    length(ListadoNotas, Largo),
    Promedio is Suma/Largo.

% Promedio = 7.2