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

%Clasificador para la clase 1
X_train = iris_train90(:,1:4);
Y_train = (iris_train90(:,5) == 1).*1.0 + (iris_train90(:,5) == 0).*0;

figure,
gplotmatrix(X_train,[],Y_train);


X_test = iris_test10(:,1:4);
Y_test = (iris_test10(:,5) == 1).*1.0 + (iris_test10(:,5) == 0).*0;

exps = zeros([1000,10]);
for lr = 1:1:9
    for j = 1:1:1000
        [pesos, polarizacion, iteraciones] = entrenamiento(X_train,Y_train,0.5,2,lr/10);
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