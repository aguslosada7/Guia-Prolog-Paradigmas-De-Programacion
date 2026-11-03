disponibilidad_equipo(marketing, 9).
disponibilidad_equipo(marketing, 10).
disponibilidad_equipo(desarrollo, 10).
disponibilidad_equipo(desarrollo, 11).
disponibilidad_equipo(ventas, 9).
disponibilidad_equipo(ventas, 11).

disponibilidad_cliente(google, 9).
disponibilidad_cliente(google, 10).
disponibilidad_cliente(google, 11).
disponibilidad_cliente(apple, 10).
disponibilidad_cliente(apple, 11).
disponibilidad_cliente(microsoft, 9).
disponibilidad_cliente(microsoft, 11).

% 1. Se desea saber la disponibilidad para formar una reunión entre nuestros equipos y
%    los clientes. Se debe crear la regla disponibilidad_reunion/3 que determine las
%    reuniones posibles de cada uno de nuestros equipos con cada uno de nuestros clientes
%    en cada horario posible.

disponibilidad_reunion(Equipo, Cliente, Hora):-
    disponibilidad_equipo(Equipo, Hora),
    disponibilidad_cliente(Cliente, Hora).

% 2. Se agrega la posibilidad de reservar un horario de reunión para un equipo y un
%    cliente en un horario en especifico, con el hecho reunion_pactada/3. Se pide crear
%    una nueva regla disponibilidad_reunion_final/3 donde se tenga en cuenta las
%    reuniones ya pactadas y se excluyan de las reuniones disponibles, pero ojo, si por
%    ejemplo una de las reuniones pactadas es de ventas con google a las 11, el equipo de
%    ventas no estará disponible a las 11, pero tampoco lo estará el equipo de google
%    (ya que se considera solo 1 disponibilidad por equipo y cliente por horario)

reunion_pactada(ventas, google, 11).
reunion_pactada(marketing, apple, 10).

disponibilidad_reunion_final(Equipo, Cliente, Hora):-
    disponibilidad_reunion(Equipo, Cliente, Hora),
    \+reunion_pactada(Equipo, _, Hora),
    \+reunion_pactada(_, Cliente, Hora).