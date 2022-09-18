%% Scatter de todo el dataset
clear,
clc,
close all
load("banknote_with_different_splits.mat")
X = iris_train90(:,1:4);
Y = iris_train90(:,5);
figure,
gplotmatrix(X,[],Y);

%% Carga
clear,
close all,
clc
load("banknote_with_different_splits.mat")

%% Carga datos

X_train = iris_train60(:,1:4);
norm_factor_train = max(max(X_train));
X_train = X_train./norm_factor_train;
Y_train = (iris_train60(:,5) == 1).*1.0 + (iris_train60(:,5) ~= 1).*-1.0;

X_test = iris_test40(:,1:4);
Y_test = (iris_test40(:,5) == 1).*1.0 + (iris_test40(:,5) ~= 1).*-1.0;
%% Clasificador para la clase 1
figure,
gplotmatrix(X_train,[],Y_train);

exps = zeros([100,10]);
for lr = 1:1:9
    for j = 1:1:10
        [pesos, polarizacion, iteraciones] = entrenamiento_con_errores(X_train,Y_train,0.9,2,lr/10,0.01);
        exps(j,lr) = iteraciones;
    end
end
hold on;
for lr = 1:1:9
    subplot(3,3,lr);    
    histogram(exps(:,lr),'BinWidth',1)
    title(strcat("Clasificador iris con lr: ",num2str(lr/10)))
    xlabel("Cantidad de iteraciones")
    ylabel("Repeticiones")
end
%% Sistema clasificador
[cant_ejemplos, ~] = size(iris_test40);
predicciones = zeros(cant_ejemplos,1);
for i = 1:1:cant_ejemplos    
    predicciones(i) = -1;
    x_temp = iris_test40(i,1:4);
    pred_clase_1 = perceptron_taller(x_temp./norm_factor_train,pesos,polarizacion,0.9);    
    if(pred_clase_1 == 1)
        predicciones(i) = 1;    
    end    
end
figure,
confusionchart(2.*(iris_test40(:,5)-0.5),predicciones);