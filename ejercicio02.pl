hombre(pedro).
hombre(manuel).
hombre(arturo).
mujer(maría).
padre(pedro, manuel).
padre(pedro, arturo).
padre(pedro, maría).

% expresa que X es hijo o hija de Y.
niño(X,Y):- padre(Y, X).

% expresa que X es un hijo varón de Y.
hijo(X,Y):- hombre(X), padre(Y, X).

% expresa que X es una hija de Y.
hija(X,Y):- mujer(X), padre(Y, X).

% expresa que X es hermano o hermana de Y.
hermano-o-hermana(X,Y):- X \== Y, padre(P, X), padre(P, Y).

% expresa que X es un hermano de Y.
hermano(X,Y):- X \== Y, padre(P, X), padre(P, Y), hombre(X).

% expresa que X es una hermana de Y.
hermana(X,Y):- X \== Y, padre(P, X), padre(P, Y), mujer(X).