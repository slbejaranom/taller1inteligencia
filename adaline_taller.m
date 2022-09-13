function [salida] = adaline_taller(entradas, pesos, polarizacion, umbral_step)
%PERCEPTRON Genera una neurona con su salida
%   A partir del modelo matemático de una neurona se generará la salida a
%   partir de dos entradas usando
%   y = w1*x1 + w2*x2 + ... + wn*xn + w0
%   Las entradas deben ir como vector y los pesos como vectors columna
    salida = (relu(entradas*pesos + polarizacion) > umbral_step)*1;
end