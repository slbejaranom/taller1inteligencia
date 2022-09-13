%% COMPUERTA AND DE DOS ENTRADAS
clear, clc, close all
X = [0,0;0,1;1,0;1,1];
Y = [0,0,0,1];
exps = zeros([100,10]);
for lr = 1:1:9
    for j = 1:1:100
        [pesos, polarizacion, iteraciones] = entrenamiento(X,Y,0.5,1,lr/10);
        exps(j,lr) = iteraciones;
    end
end
figure,
for lr = 1:1:9
    subplot(3,3,lr);    
    histogram(exps(:,lr),10);
    title(strcat("Compuerta AND de 2 entradas con lr: ",num2str(lr/10)))
    xlabel("Cantidad de iteraciones")
    ylabel("Repeticiones")
end
%% COMPUERTA AND DE TRES ENTRADAS
clear, clc, close all
X = [0,0,0;
     0,0,1;
     0,1,0;
     0,1,1;
     1,0,0;
     1,0,1;
     1,1,0;
     1,1,1];
Y = [0,0,0,0,0,0,0,1];
exps = zeros([100,10]);
for lr = 1:1:9
    for j = 1:1:100
        [pesos, polarizacion, iteraciones] = entrenamiento(X,Y,0.5,1,lr/10);
        exps(j,lr) = iteraciones;
    end
end
figure,
for lr = 1:1:9
    subplot(3,3,lr);    
    histogram(exps(:,lr),10);
    title(strcat("Compuerta AND de 3 entradas con lr: ",num2str(lr/10)))
    xlabel("Cantidad de iteraciones")
    ylabel("Repeticiones")
end
%% COMPUERTA AND DE CUATRO ENTRADAS
clear, clc, close all
X = [0,0,0,0;
     0,0,0,1;
     0,0,1,0;
     0,0,1,1;
     0,1,0,0;
     0,1,0,1;
     0,1,1,0;
     0,1,1,1;
     1,0,0,0;
     1,0,0,1;
     1,0,1,0;
     1,0,1,1;
     1,1,0,0;
     1,1,0,1;
     1,1,1,0;
     1,1,1,1];
Y = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1];
exps = zeros([100,10]);
for lr = 1:1:9
    for j = 1:1:100
        [pesos, polarizacion, iteraciones] = entrenamiento(X,Y,0.5,1,lr/10);
        exps(j,lr) = iteraciones;
    end
end
figure,
for lr = 1:1:9
    subplot(3,3,lr);    
    histogram(exps(:,lr),10);
    title(strcat("Compuerta AND de 4 entradas con lr: ",num2str(lr/10)))
    xlabel("Cantidad de iteraciones")
    ylabel("Repeticiones")
end
%% COMPUERTA OR DE DOS ENTRADAS
clear, clc, close all
X = [0,0;0,1;1,0;1,1];
Y = [0,1,1,1];
exps = zeros([100,1]);
for j = 1:1:100
    [pesos, polarizacion, iteraciones] = entrenamiento(X,Y,0.5,1,0.50);
    exps(j) = iteraciones;
end
figure,
histogram(exps);
%% COMPUERTA OR DE TRES ENTRADAS
clear, clc, close all
X = [0,0,0;
     0,0,1;
     0,1,0;
     0,1,1;
     1,0,0;
     1,0,1;
     1,1,0;
     1,1,1];
Y = [0,1,1,1,1,1,1,1];
exps = zeros([100,1]);
for j = 1:1:100
    [pesos, polarizacion, iteraciones] = entrenamiento(X,Y,0.5,1,0.50);
    exps(j) = iteraciones;
end
figure,
histogram(exps);
%% COMPUERTA OR DE CUATRO ENTRADAS
clear, clc, close all
X = [0,0,0,0;
     0,0,0,1;
     0,0,1,0;
     0,0,1,1;
     0,1,0,0;
     0,1,0,1;
     0,1,1,0;
     0,1,1,1;
     1,0,0,0;
     1,0,0,1;
     1,0,1,0;
     1,0,1,1;
     1,1,0,0;
     1,1,0,1;
     1,1,1,0;
     1,1,1,1];
Y = [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
exps = zeros([100,1]);
for j = 1:1:100
    [pesos, polarizacion, iteraciones] = entrenamiento(X,Y,0.5,1,0.50);
    exps(j) = iteraciones;
end
figure,
histogram(exps);