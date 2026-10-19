entrada(paella).
entrada(gazpacho).
entrada(consomé).

carne('filete de cerdo').
carne('pollo asado').

pescado(trucha).
pescado(bacalao).

postre(flan).
postre(helado).
postre(pastel).

% 1. ¿Cuáles son los menús que ofrece el restaurante? (menu/3)
menu(Entrada, Plato, Postre):- entrada(Entrada), (carne(Plato); pescado(Plato)), postre(Postre).

% 2. ¿Cuáles son los menús que tienen consomé en las entradas? (menu_con_consomé/3).
%    ¿Sería mejor esta regla con 2 parámetros?
menu_con_consome(Plato, Postre):- entrada(consomé), (carne(Plato); pescado(Plato)), postre(Postre).

% 3. ¿Cuáles son los menús que no contienen flan como postre? (menu_sin_flan/3)
menu_sin_flan(Entrada, Plato, Postre):- entrada(Entrada), (carne(Plato); pescado(Plato)), postre(Postre), Postre \== flan.

% 4. ¿Cuáles son los menús que tienen carne como plato principal? (menu_con_carne/3)
menu_con_carne(Entrada, Plato, Postre):- entrada(Entrada), carne(Plato), postre(Postre).

% 5. Completar el programa "menú" de manera que una comida esté formada también por
%    la elección de una bebida, a elegir entre vino, cerveza o agua mineral. (menu/4)
bebida(vino).
bebida(cerveza).
bebida('agua mineral').

menu(Entrada, Plato, Postre, Bebida):- entrada(Entrada), (carne(Plato); pescado(Plato)), postre(Postre), bebida(Bebida).