parcial1(ana,7).
parcial1(juan,4).
parcial1(julio, 2).
parcial1(maria, 10).

% Esto es para el punto 5
parcial1(lautaro, 10).
parcial1(malcolm, 7).
parcial2(lautaro, 9).
parcial2(malcolm, 8).

parcial2(ana,9).
parcial2(juan,8).
parcial2(julio, 4).
parcial2(maria, 2).

% 1. El listado de los alumnos que promocionan la materia.
promociona(Alumno):- parcial1(Alumno, N1), parcial2(Alumno, N2), N1 >= 7, N2 >= 7.

% 2. El mismo listado pero esta vez incluyendo la nota final
%   (promedio de los dos parciales) para cada uno.
promocionaYNota(Alumno, Promedio):- parcial1(Alumno, N1), parcial2(Alumno, N2),
    N1 >= 7, N2 >= 7, Promedio is (N1+N2)/2.

% Alumno = ana, Nota = 8

% 3. El listado de los alumnos que recursan la materia.
recursa(Alumno):- parcial1(Alumno, N1), parcial2(Alumno, N2), (N1 < 4; N2 < 4).

% Alumno = julio
% Alumno = maria

% 4. El listado de los alumnos que obtendrán la cursada.
cursa(Alumno):- parcial1(Alumno, N1), parcial2(Alumno, N2), N1 >= 4, N2 >= 4, (N1 < 7; N2 < 7).

% Alumno = juan

% 5. (maximos) A fin de entregar la medalla al mérito, encontrar de aquellos que
%    promocionan (punto 2), el o los alumnos con mayor nota final (nombre y nota).

% Hace un producto cartesiano (con promocionaYNota(_, X), promocionaYNota(_, Y)) y
% selecciona (con X < Y) todos los valores posibles menos el máximo
todos_menos_max(X):- promocionaYNota(_, X), promocionaYNota(_, Y), X < Y.

medalla(Alumno, Nota):- promocionaYNota(Alumno, Nota), \+ todos_menos_max(Nota).

% 6. (maximos) Ahora se desea obtener cuales fueron las dos notas más altas,
%    considerando simplemente a la nota como el promedio de la nota de parcial1 y
%    parcial2. Solo interesan los números. Un tip es pensar la resolución en dos
%    etapas, la más alta, y después la más alta de lo restante.

nota(Alumno, Nota):- parcial1(Alumno, P1), parcial2(Alumno, P2), Nota is (P1 + P2) / 2.

% Se obtiene la nota más alta. Es similar al anterior pero se tienen en cuenta todas las
% notas, no solo la de los promocionados
todos_menos_max2(X):- nota(_, X), nota(_, Y), X < Y.
nota_max(X):- nota(_, X), \+todos_menos_max2(X).

% Se hace lo mismo que el punto anterior pero con el grupo que excluye la nota más alta
% (para también excluir la segunda)
todos_menos_dos_max(X):- todos_menos_max2(X), todos_menos_max2(Y), X < Y.

nota_dos_max(X):- nota(_, X), \+todos_menos_dos_max(X).