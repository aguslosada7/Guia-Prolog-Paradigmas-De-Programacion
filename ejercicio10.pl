vendedor(alex). % 3
vendedor(jeff). % 3
vendedor(gerard). % 2
vendedor(robert). % 1
vendedor(thomas). % 2
vendedor(siouxie). % 1
vendedor(jim). % 2
vendedor(tina). % 1
vendedor(james). % 3
vendedor(dave). % 3

ventas1erSem(thomas, 55555).
ventas1erSem(james, 90000).
ventas1erSem(gerard, 13000).
ventas1erSem(tina, 60000).
ventas1erSem(robert, 30000).
ventas1erSem(siouxie, 23000).
ventas1erSem(alex, 50500).
ventas1erSem(jim, 16000).

ventas2doSem(dave, 30000).
ventas2doSem(tina, 25000).
ventas2doSem(thomas, 19090).
ventas2doSem(jim, 21000).
ventas2doSem(jeff, 87500).
ventas2doSem(siouxie, 40000).
ventas2doSem(robert, 33000).
ventas2doSem(gerard, 17000).

% - 20% del total vendido en el año para aquellos vendedores que hayan tenido ventas
    %   en ambos semestres y cada una de ellas supera los $ 20000.
% - 10% del total vendido en el año para aquellos vendedores que hayan tenido ventas
    %   en ambos semestres, pero no superan los $ 20000 en alguno de estos.
% - 5% del total vendido para los vendedores que no registran ventas en algún semestre

comisiones_anuales(Vendedor, Comision):-
    (
    	ventas1erSem(Vendedor, Comision1), ventas2doSem(Vendedor, Comision2),
        Comision1 > 20000, Comision2 > 20000, Comision is (Comision1 + Comision2)*0.2
    );
    (
    	ventas1erSem(Vendedor, Comision1), ventas2doSem(Vendedor, Comision2),
        (Comision1 =< 20000; Comision2 =< 20000),
        Comision is (Comision1 + Comision2)*0.1
    );
    (
    	(ventas1erSem(Vendedor, Comision1), \+ventas2doSem(Vendedor, _),
        Comision is Comision1*0.05);
    	(ventas2doSem(Vendedor, Comision2), \+ventas1erSem(Vendedor, _),
        Comision is Comision2*0.05)
    ).