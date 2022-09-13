function [pesos, polarizacion, iteraciones] = entrenamiento(entradas, salidas, regla_aprendizaje, lr)
%Función de entrenamiento del perceptrón
%   
    rng("shuffle");
    size_entradas = size(entradas);
    cantidad_ejemplos = size_entradas(1);
    cantidad_entradas = size_entradas(2);
    
    pesos = rand([cantidad_entradas, 1]);
    polarizacion = rand(1);
    iteraciones = 0;
    y_pred = 200*ones(1,length(salidas));
    aux = 0;    
    iteraciones = 0;
    while(aux < length(salidas))
    for i = 1:1:cantidad_ejemplos
        x_temp = entradas(i,:);
        y = adaline_taller(x_temp,pesos,polarizacion);        
        dw = 0;
        db = 0;        
        error = (y-salidas(i));
        if(error > 0.01)
            switch(regla_aprendizaje)
                case 0
                    dw = salidas(i).*x_temp;
                    db = salidas(i);
                case 1
                    dw = (salidas(i)-y).*x_temp;
                    db = (salidas(i)-y);
                case 2
                    dw = lr*(salidas(i)-y).*x_temp;
                    db = lr*(salidas(i)-y);
            end        
            pesos = pesos + dw';
            polarizacion = polarizacion + db;
            aux = 0;
            iteraciones = iteraciones + 1
        else
            aux = aux + 1;
        end    
    end
end