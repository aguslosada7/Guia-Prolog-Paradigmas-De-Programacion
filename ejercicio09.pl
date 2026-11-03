entrada(paella, 520).
entrada(gazpacho, 100).
entrada(consomé, 29).

carne('filete de cerdo', 200).
carne('pollo asado', 237).

pescado(trucha, 178).
pescado(bacalao, 211).

postre(flan, 210).
postre(helado, 100).
postre(pastel, 350).

% 1. Modificar el programa del ejercicio 01 - Menú de restaurant para poder consultar cual
% es el menú completo que tiene menor cantidad de calorías (agregando las calorias como
% parte de la información de los hechos). Se recomienda primero hacer un menu/4 donde
% incluya las calorias totales.
menu(Entrada, Plato, Postre, Calorias):-
    entrada(Entrada, CE),
    (carne(Plato, CPP); pescado(Plato, CPP)),
    postre(Postre, CP),
    Calorias is CE + CPP + CP.

todos_menos_min(Calorias):-
    menu(_, _, _, Calorias), menu(_, _, _, Calorias2),
    Calorias > Calorias2.

min_calorias(Entrada, Plato, Postre, Calorias):-
    menu(Entrada, Plato, Postre, Calorias),
    \+todos_menos_min(Calorias), !.

% Resultado: consomé, trucha, helado, 307

% 2. Hallar el menú completo que tiene la menor cantidad de calorias, sin contar al menor
% de todos (hallar el segundo mínimo).
todos_menos_dos_min(Calorias):- todos_menos_min(Calorias), todos_menos_min(Calorias2),
    Calorias > Calorias2.

segundo_min_calorias(Entrada, Plato, Postre, Calorias):-
    menu(Entrada, Plato, Postre, Calorias),
    \+todos_menos_dos_min(Calorias),
    \+min_calorias(Entrada, Plato, Postre, Calorias), !.

% Resultado: consomé, filete de cerdo, helado, 329