%% Scatter de todo el dataset
clear,
clc,
close all
load("iris_with_different_splits.mat")
X = iris_train90(:,1:4);
Y = iris_train90(:,5);
figure,
gplotmatrix(X,[],Y);

%% Carga
clear,
close all,
clc
load("iris_with_different_splits.mat")

%% Carga datos

X_train = iris_train60(:,3:4);
norm_factor_train = max(max(X_train));
X_train = X_train./norm_factor_train;
Y_train = (iris_train60(:,5) == 1).*1.0 + (iris_train60(:,5) ~= 1).*-1.0;

X_test = iris_test40(:,3:4);
Y_test = (iris_test40(:,5) == 1).*1.0 + (iris_test40(:,5) ~= 1).*-1.0;

X_train_rojo = iris_train60(:,3:4);
norm_factor_train_rojo = max(max(X_train_rojo));
X_train_rojo = X_train_rojo./norm_factor_train_rojo;
Y_train_rojo = (iris_train60(:,5) == 3).*1.0 + (iris_train60(:,5) ~= 3).*-1.0;

X_test_rojo = iris_test40(:,3:4);
X_test_rojo = X_test_rojo/max(max(X_test_rojo));
Y_test_rojo = (iris_test40(:,5) == 3).*1.0 + (iris_test40(:,5) ~= 3).*-1.0;
%% Clasificador para la clase 1
figure,
gplotmatrix(X_train,[],Y_train);

exps = zeros([100,10]);
for lr = 1:1:9
    for j = 1:1:10
        [pesos, polarizacion, iteraciones] = entrenamiento(X_train,Y_train,0.9,2,lr/10);
        exps(j,lr) = iteraciones;
    end
end
figure,
scatter(X_train(:,1),X_train(:,2),[],Y_train);
hold on;
plotpc(pesos',polarizacion);
for lr = 1:1:9
    subplot(3,3,lr);    
    histogram(exps(:,lr),'BinWidth',1)
    title(strcat("Clasificador iris con lr: ",num2str(lr/10)))
    xlabel("Cantidad de iteraciones")
    ylabel("Repeticiones")
end
%% Clasificador para la clase 3
figure,
gplotmatrix(X_train_rojo,[],Y_train_rojo);

exps = zeros([100,10]);
for lr = 1:1:9
    for j = 1:1:10
        [pesos_rojo, polarizacion_rojo, iteraciones_rojo] = entrenamiento_con_errores(X_train_rojo,Y_train_rojo,0.5,2,lr/10,0.1);
        exps(j,lr) = iteraciones_rojo;
    end
end
figure,
for lr = 1:1:9
    subplot(3,3,lr);    
    histogram(exps(:,lr),'BinWidth',1)
    title(strcat("Clasificador iris con lr: ",num2str(lr/10)))
    xlabel("Cantidad de iteraciones")
    ylabel("Repeticiones")
end
%% Sistema clasificador
[cant_ejemplos, ~] = size(iris_test30);
predicciones = zeros(cant_ejemplos,1);
for i = 1:1:cant_ejemplos
    predicciones(i) = 2;
    x_temp = iris_test30(i,3:4);
    pred_clase_1 = perceptron_taller(x_temp./norm_factor_train,pesos,polarizacion,0.9);
    pred_clase_3 = perceptron_taller(x_temp./norm_factor_train_rojo,pesos_rojo,polarizacion_rojo,0.6);
    if(pred_clase_1 == 1)
        predicciones(i) = 1;
    else
        if(pred_clase_3 == 1)
            predicciones(i) = 3;
        end
    end    
end
figure,
confusionchart(iris_test30(:,5),predicciones);