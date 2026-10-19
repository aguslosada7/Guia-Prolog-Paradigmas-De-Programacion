transporte(roma, 20).
transporte(londres, 30).
transporte(tunez, 10).

alojamiento(roma, hotel, 50).
alojamiento(roma, hostal, 30).
alojamiento(roma, camping, 10).
alojamiento(londres, hotel, 60).
alojamiento(londres, hostal, 40).
alojamiento(londres, camping, 20).
alojamiento(tunez, hotel, 40).
alojamiento(tunez, hostal, 20).
alojamiento(tunez, camping, 5).

% 1. Crear la regla viaje/4 tal que se cumpla que: "el viaje a una Ciudad durante S semanas
%    con un Hospedaje valido con un Precio total"
viaje(Ciudad, Semanas, Hospedaje, Precio):- transporte(Ciudad, P1),
    alojamiento(Ciudad, Hospedaje, P2), Precio is Semanas*(P1 + P2).

% Ejemplo: viaje(roma, 3, hotel, Precio) da Precio = 210

% 2. Completar con viajeeconomico/5, agregando un parámetro extra que defina el Precio
%    máximo del viaje.
viajeeconomico(Ciudad, Semanas, Hospedaje, Precio, PrecioMax):- transporte(Ciudad, P1),
    alojamiento(Ciudad, Hospedaje, P2), Precio is Semanas*(P1 + P2), Precio =< PrecioMax.

% Ejemplo: viajeeconomico(roma, 3, Hospedaje, Precio, 200) muestra:
% Hospedaje = hostal, Precio = 150
% Hospedaje = camping, Precio = 90