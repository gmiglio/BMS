clear all; clc; close all;


%%
% Amostra_A: 100-90
% Diretório dos dados do IBS
cd('A_100_90');
% Carrega os dados do IBS
load('A_SOH_100_90.mat');
% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;

Range = [2 200 1500];
Calc_Corrente = zeros(N,1);
for i=1:1:N
    Calc_Corrente(i) = (Corrente(i) - 32769)*Range(Corrente_Range(i) + 1)/65534;
end

% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(60*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Calc_Corrente(i);
end

intervalo = 1:15000;
Est_Carga = Est_Carga(intervalo);


Quant = length(Ceraolo_SoC.Data)/N;
y_af_Ceraolo = int8(Ceraolo_SoC.Data);
y_Ceraolo = zeros(N, 1);
for i=0:1:(N-1)
    y_Ceraolo(i+1) =  mean(y_af_Ceraolo(int32(i*Quant+1):int32(Quant*(i+1))));
end

Quant = length(Shephard_SoC_Simulado.Data)/N;
y_af_Shephard = int8(Shephard_SoC_Simulado.Data);
y_Shephard = zeros(N, 1);
for i=0:1:(N-1)
    y_Shephard(i+1) = mean(y_af_Shephard(int32(i*Quant+1):int32(Quant*(i+1))));
end

figure;

plot(y_Shephard, 'g');
hold on;

plot(Est_Carga(1:15000), 'r');
hold on;

plot(uint8(Bat_CC), 'm');
hold on;

plot(y_Ceraolo, 'b'); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Comparação dos valores do estado de Carga');
grid on;

Erro_Ceraolo = y_Ceraolo - Est_Carga;
Erro_Shephard = y_Shephard - Est_Carga;
Erro_CC = int8(Bat_CC-Est_Carga);

figure;
plot(1:1:15000, abs(Erro_Ceraolo),'g','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_Shephard),'b','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_CC),'r','LineWidth',1);

legend('Erro Ceraolo', 'Erro Shepherd', 'Erro Coulomb Counting');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra1
fprintf('              Variância da diferença para os valores do IBS \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

%% 
% Amostra_B - B_100_90
cd('..');

% Diretório dos dados do IBS
cd('B_100_90');
% Carrega os dados do IBS
load('B_SOH_100_90.mat');
% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;

Range = [2 200 1500];
Calc_Corrente = zeros(N,1);
for i=1:1:N
    Calc_Corrente(i) = (Corrente(i) - 32769)*Range(Corrente_Range(i) + 1)/65534;
end

% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(60*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Calc_Corrente(i);
end

intervalo = 1:15000;
Est_Carga = Est_Carga(intervalo);


Quant = length(Ceraolo_SoC.Data)/N;
y_af_Ceraolo = int8(Ceraolo_SoC.Data);
y_Ceraolo = zeros(N, 1);
for i=0:1:(N-1)
    y_Ceraolo(i+1) =  mean(y_af_Ceraolo(int32(i*Quant+1):int32(Quant*(i+1))));
end

Quant = length(Shephard_SoC_Simulado.Data)/N;
y_af_Shephard = int8(Shephard_SoC_Simulado.Data);
y_Shephard = zeros(N, 1);
for i=0:1:(N-1)
    y_Shephard(i+1) = mean(y_af_Shephard(int32(i*Quant+1):int32(Quant*(i+1))));
end

figure;

plot(y_Shephard, 'g');
hold on;

plot(Est_Carga(1:15000), 'r');
hold on;

plot(uint8(Bat_CC), 'm');
hold on;

plot(y_Ceraolo, 'b'); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Comparação dos valores do estado de Carga');
grid on;

Erro_Ceraolo = y_Ceraolo - Est_Carga;
Erro_Shephard = y_Shephard - Est_Carga;
Erro_CC = int8(Bat_CC-Est_Carga);

figure;
plot(1:1:15000, abs(Erro_Ceraolo),'g','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_Shephard),'b','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_CC),'r','LineWidth',1);

legend('Erro Ceraolo', 'Erro Shepherd', 'Erro Coulomb Counting');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra1
fprintf('              Variância da diferença para os valores do IBS \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

%%
% Amostra_C : 100-90
cd('..');
% Diretório dos dados do IBS
cd('C_100_90');
% Carrega os dados do IBS
load('C_SOH_100_90.mat');
% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;

Range = [2 200 1500];
Calc_Corrente = zeros(N,1);
for i=1:1:N
    Calc_Corrente(i) = (Corrente(i) - 32769)*Range(Corrente_Range(i) + 1)/65534;
end

% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(60*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Calc_Corrente(i);
end

intervalo = 1:15000;
Est_Carga = Est_Carga(intervalo);


Quant = length(Ceraolo_SoC.Data)/N;
y_af_Ceraolo = int8(Ceraolo_SoC.Data);
y_Ceraolo = zeros(N, 1);
for i=0:1:(N-1)
    y_Ceraolo(i+1) =  mean(y_af_Ceraolo(int32(i*Quant+1):int32(Quant*(i+1))));
end

Quant = length(Shephard_SoC_Simulado.Data)/N;
y_af_Shephard = int8(Shephard_SoC_Simulado.Data);
y_Shephard = zeros(N, 1);
for i=0:1:(N-1)
    y_Shephard(i+1) = mean(y_af_Shephard(int32(i*Quant+1):int32(Quant*(i+1))));
end

figure;

plot(y_Shephard, 'g');
hold on;

plot(Est_Carga(1:15000), 'r');
hold on;

plot(uint8(Bat_CC), 'm');
hold on;

plot(y_Ceraolo, 'b'); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Comparação dos valores do estado de Carga');
grid on;

Erro_Ceraolo = y_Ceraolo - Est_Carga;
Erro_Shephard = y_Shephard - Est_Carga;
Erro_CC = int8(Bat_CC-Est_Carga);

figure;
plot(1:1:15000, abs(Erro_Ceraolo),'g','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_Shephard),'b','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_CC),'r','LineWidth',1);

legend('Erro Ceraolo', 'Erro Shepherd', 'Erro Coulomb Counting');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra1
fprintf('              Variância da diferença para os valores do IBS \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

%%
% Amostra_D : 90-80
cd('..');

% Diretório dos dados do IBS
cd('D_90_80');
% Carrega os dados do IBS
load('D_SOH_90_80.mat');
% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;

Range = [2 200 1500];
Calc_Corrente = zeros(N,1);
for i=1:1:N
    Calc_Corrente(i) = (Corrente(i) - 32769)*Range(Corrente_Range(i) + 1)/65534;
end

% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(60*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Calc_Corrente(i);
end

intervalo = 1:15000;
Est_Carga = Est_Carga(intervalo);


Quant = length(Ceraolo_SoC.Data)/N;
y_af_Ceraolo = int8(Ceraolo_SoC.Data);
y_Ceraolo = zeros(N, 1);
for i=0:1:(N-1)
    y_Ceraolo(i+1) =  mean(y_af_Ceraolo(int32(i*Quant+1):int32(Quant*(i+1))));
end

Quant = length(Shephard_SoC_Simulado.Data)/N;
y_af_Shephard = int8(Shephard_SoC_Simulado.Data);
y_Shephard = zeros(N, 1);
for i=0:1:(N-1)
    y_Shephard(i+1) = mean(y_af_Shephard(int32(i*Quant+1):int32(Quant*(i+1))));
end

figure;

plot(y_Shephard, 'g');
hold on;

plot(Est_Carga(1:15000), 'r');
hold on;

plot(uint8(Bat_CC), 'm');
hold on;

plot(y_Ceraolo, 'b'); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Comparação dos valores do estado de Carga');
grid on;

Erro_Ceraolo = y_Ceraolo - Est_Carga;
Erro_Shephard = y_Shephard - Est_Carga;
Erro_CC = int8(Bat_CC-Est_Carga);

figure;
plot(1:1:15000, abs(Erro_Ceraolo),'g','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_Shephard),'b','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_CC),'r','LineWidth',1);

legend('Erro Ceraolo', 'Erro Shepherd', 'Erro Coulomb Counting');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra1
fprintf('              Variância da diferença para os valores do IBS \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

%%
% Amostra_E : 90-80
cd('..');

% Diretório dos dados do IBS
cd('E_90_80');
% Carrega os dados do IBS
load('D_SOH_90_80.mat');
% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;

Range = [2 200 1500];
Calc_Corrente = zeros(N,1);
for i=1:1:N
    Calc_Corrente(i) = (Corrente(i) - 32769)*Range(Corrente_Range(i) + 1)/65534;
end

% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(60*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Calc_Corrente(i);
end

intervalo = 1:15000;
Est_Carga = Est_Carga(intervalo);


Quant = length(Ceraolo_SoC.Data)/N;
y_af_Ceraolo = int8(Ceraolo_SoC.Data);
y_Ceraolo = zeros(N, 1);
for i=0:1:(N-1)
    y_Ceraolo(i+1) =  mean(y_af_Ceraolo(int32(i*Quant+1):int32(Quant*(i+1))));
end

Quant = length(Shephard_SoC_Simulado.Data)/N;
y_af_Shephard = int8(Shephard_SoC_Simulado.Data);
y_Shephard = zeros(N, 1);
for i=0:1:(N-1)
    y_Shephard(i+1) = mean(y_af_Shephard(int32(i*Quant+1):int32(Quant*(i+1))));
end

figure;

plot(y_Shephard, 'g');
hold on;

plot(Est_Carga(1:15000), 'r');
hold on;

plot(uint8(Bat_CC), 'm');
hold on;

plot(y_Ceraolo, 'b'); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Comparação dos valores do estado de Carga');
grid on;

Erro_Ceraolo = y_Ceraolo - Est_Carga;
Erro_Shephard = y_Shephard - Est_Carga;
Erro_CC = int8(Bat_CC-Est_Carga);

figure;
plot(1:1:15000, abs(Erro_Ceraolo),'g','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_Shephard),'b','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_CC),'r','LineWidth',1);

legend('Erro Ceraolo', 'Erro Shepherd', 'Erro Coulomb Counting');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra1
fprintf('              Variância da diferença para os valores do IBS \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

%%

% Amostra_F : 90-80
cd('..');

% Diretório dos dados do IBS
cd('F_90_80');
% Carrega os dados do IBS
load('F_SOH_90_80.mat');
% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;

Range = [2 200 1500];
Calc_Corrente = zeros(N,1);
for i=1:1:N
    Calc_Corrente(i) = (Corrente(i) - 32769)*Range(Corrente_Range(i) + 1)/65534;
end

% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(60*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Calc_Corrente(i);
end

intervalo = 1:15000;
Est_Carga = Est_Carga(intervalo);


Quant = length(Ceraolo_SoC.Data)/N;
y_af_Ceraolo = int8(Ceraolo_SoC.Data);
y_Ceraolo = zeros(N, 1);
for i=0:1:(N-1)
    y_Ceraolo(i+1) =  mean(y_af_Ceraolo(int32(i*Quant+1):int32(Quant*(i+1))));
end

Quant = length(Shephard_SoC_Simulado.Data)/N;
y_af_Shephard = int8(Shephard_SoC_Simulado.Data);
y_Shephard = zeros(N, 1);
for i=0:1:(N-1)
    y_Shephard(i+1) = mean(y_af_Shephard(int32(i*Quant+1):int32(Quant*(i+1))));
end

figure;

plot(y_Shephard, 'g');
hold on;

plot(Est_Carga(1:15000), 'r');
hold on;

plot(uint8(Bat_CC), 'm');
hold on;

plot(y_Ceraolo, 'b'); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Comparação dos valores do estado de Carga');
grid on;

Erro_Ceraolo = y_Ceraolo - Est_Carga;
Erro_Shephard = y_Shephard - Est_Carga;
Erro_CC = int8(Bat_CC-Est_Carga);

figure;
plot(1:1:15000, abs(Erro_Ceraolo),'g','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_Shephard),'b','LineWidth',1);
hold on;
plot(1:1:15000, abs(Erro_CC),'r','LineWidth',1);

legend('Erro Ceraolo', 'Erro Shepherd', 'Erro Coulomb Counting');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra1
fprintf('              Variância da diferença para os valores do IBS \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);