%% Scatter de todo el dataset
clear,
clc,
close all
load("iris_with_different_splits.mat")
X = iris_train90(:,1:4);
Y = iris_train90(:,5);
figure,
gplotmatrix(X,[],Y);

%% Carga 90-19
clear,
close all,
clc
load("iris_with_different_splits.mat")

%% Clasificador para la clase 1
X_train = iris_train90(:,3:4);
Y_train = (iris_train90(:,5) == 1).*1.0 + (iris_train90(:,5) ~= 1).*-1.0;

figure,
gplotmatrix(X_train,[],Y_train);


X_test = iris_test10(:,3:4);
Y_test = (iris_test10(:,5) == 1).*1.0 + (iris_test10(:,5) ~= 1).*-1.0;

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
    histogram(exps(:,lr),10);
    title(strcat("Clasificador iris con lr: ",num2str(lr/10)))
    xlabel("Cantidad de iteraciones")
    ylabel("Repeticiones")
end
%% Clasificador para la clase 3
X_train_rojo = iris_train90(:,3:4);
X_train_rojo = X_train_rojo./max(max(X_train_rojo));
Y_train_rojo = (iris_train90(:,5) == 3).*1.0 + (iris_train90(:,5) ~= 3).*-1.0;

figure,
gplotmatrix(X_train_rojo,[],Y_train_rojo);


X_test_rojo = iris_test10(:,3:4);
X_test_rojo = X_test_rojo/max(max(X_test_rojo));
Y_test_rojo = (iris_test10(:,5) == 3).*1.0 + (iris_test10(:,5) ~= 3).*-1.0;

exps = zeros([100,10]);
for lr = 1:1:9
    for j = 1:1:10
        [pesos_rojo, polarizacion_rojo, iteraciones_rojo] = entrenamiento_con_errores(X_train_rojo,Y_train_rojo,0.5,2,lr/10,0.3);
        exps(j,lr) = iteraciones;
    end
end
figure,
for lr = 1:1:9
    subplot(3,3,lr);    
    histogram(exps(:,lr),10);
    title(strcat("Clasificador iris con lr: ",num2str(lr/10)))
    xlabel("Cantidad de iteraciones")
    ylabel("Repeticiones")
end