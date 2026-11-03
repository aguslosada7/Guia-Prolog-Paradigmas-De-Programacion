% hombre(N,A,C,E).
hombre(robert, media, negro, joven).
hombre(sting, alta, rubio, adulta).
hombre(lautaro, media, negro, vieja).
hombre(alex, alta, castaño, adulta).
hombre(ron, baja, pelirrojo, joven).

% mujer(N,A,C,E).
mujer(tina, media, rubio, adulta).
mujer(stevie, alta, castaño, adulta).
mujer(agustina, media, castaño, vieja).
mujer(ginny, baja, pelirrojo, joven).
mujer(amy, alta, negro, joven).

% gusta(N,M,L,S).
gusta(robert, clásica, policíaca, jogging).
gusta(sting, pop, aventura, tenis).
gusta(lautaro, jazz, ciencia-ficción, natación).
gusta(alex, jazz, ciencia-ficción, jogging).
gusta(ron, pop, aventura, natación).
gusta(tina, pop, ciencia-ficción, tenis).
gusta(stevie, clásica, aventura, jogging).
gusta(agustina, jazz, ciencia-ficción, natación).
gusta(ginny, jazz, policíaca, tenis).
gusta(amy, clásica, policíaca, natación).

% busca(N,A,C,E).
busca(robert, baja, negro, adulta).
busca(sting, alta, castaño, adulta).
busca(lautaro, media, castaño, vieja).
busca(alex, alta, negro, adulta).
busca(ron, media, rubio, joven).
busca(tina, media, negro, vieja).
busca(stevie, alta, castaño, adulta).
busca(agustina, media, negro, vieja).
busca(ginny, baja, negro, joven).
busca(amy, alta, negro, adulta).

% Se considera que dos personas x e y de sexos diferentes son adecuadas si x conviene a
% y e y conviene a x. Se dice que x conviene a y si x conviene físicamente a y (la
% altura, edad y color de cabello de y son los que busca x) y si, además, los gustos de
% x e y en música, literatura y deporte coinciden.
conviene(X, Y):-
    hombre(X, A1, C1, E1),
    mujer(Y, A2, C2, E2),
    busca(X, A2, C2, E2),
    busca(Y, A1, C1, E1),
    gusta(X, M1, L1, S1),
    gusta(Y, M2, L2, S2),
    M1 == M2, L1 == L2, S1 == S2.