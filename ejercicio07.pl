natacion(a).
natacion(b).
natacion(c).
natacion(d).

futbol(a).
futbol(b).
futbol(e).
futbol(f).

teatro(a).
teatro(c).
teatro(e).
teatro(g).

% 1. Qué estudiantes participan de todas las actividades.
todas_las_actividades(X):- natacion(X), futbol(X), teatro(X). % a

% 2. Qué estudiantes realizan futbol y no teatro.
futbol_y_no_teatro(X):- futbol(X), \+teatro(X). % b, f

% 3. Qué estudiantes realizan al menos alguna actividad. Evitar duplicados.
al_menos_una_act(X):- natacion(X);
    (futbol(X), \+natacion(X));
    (teatro(X), \+futbol(X), \+natacion(X)). % a, b, c, d, e, f, g

% 4. Qué estudiantes participan de al menos dos actividades.
al_menos_dos_act(X):- (natacion(X), futbol(X));
    (natacion(X), teatro(X), \+futbol(X));
    (futbol(X), teatro(X), \+natacion(X)). % a, b, c, e

% 5. Teniendo un listado de estudiantes total estudiantes/1 comprendido entre [a, j],
%    qué estudiantes no realizan ninguna actividad.
estudiante(a).
estudiante(b).
estudiante(c).
estudiante(d).
estudiante(e).
estudiante(f).
estudiante(g).
estudiante(h).
estudiante(i).
estudiante(j).

no_realizan_act(X):- estudiante(X), \+natacion(X), \+futbol(X), \+teatro(X). % h, i, j