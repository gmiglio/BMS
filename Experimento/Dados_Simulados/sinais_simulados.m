% Criação de um sinal simulado para a corrente e temperatura do modelos


% Limpar a buffer e tela
clc;
clear all;

Corrente = zeros(1, 10800);

carga = 10;
descarga = -30;

valor = carga;

for i=2801:1:3600
    Corrente(1, i) = valor;
end

for i=6401:1:7200
    Corrente(1, i) = valor;
end

for i=10001:1:10800
    Corrente(1, i) = valor;
end


Temperatura = zeros(1, 10800);
Temperatura(1, 1:10800) = 25;

time = 1:1:10800;
Sim_Corrente = timeseries(Corrente, time);
Sim_Temperatura = timeseries(Temperatura, time);

