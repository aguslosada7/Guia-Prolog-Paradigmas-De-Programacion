parcial1(ana,7).
parcial1(juan,4).
parcial1(julio, 2).
parcial1(maria, 10).

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