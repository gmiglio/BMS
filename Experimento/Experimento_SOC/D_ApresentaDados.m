% Guilherme Miglio Doxa
clear all; clc; close all;

Variacao = [];

fprintf('Teste de Baterias de 72 Ah \n\n');

fprintf('       Bateria A \n\n');

%%
% Amosttra1
% Amostra 1 - OK
cd('A_Cap_72_Bateria_A_Amostra_1');
load('Bat_A_72_Amostra_1.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 72; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria A|72Ah|Amostra 1 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria A|72Ah|Amostra 1 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria A|72Ah|Amostra 1 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra1
fprintf('              Variância da diferença para os valores do IBS para a Amostra 1 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{1,1} = '72';
Variacao{1,2} = 'A';
Variacao{1,3} = '1';

Variacao{1,4} = Var_Ceraolo;
Variacao{1,5} = Var_Shephard;
Variacao{1,6} = Var_CC;

cd('..');

%%
% Amostra 2
cd('B_Cap_72_Bateria_A_Amostra_2');
load('Bat_A_72_Amostra_2.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 72; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria A|72Ah|Amostra 2 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria A|72Ah|Amostra 2 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria A|72Ah|Amostra 2 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra2

fprintf('              Variância da diferença para os valores do IBS para a Amostra 2 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{2,1} = '72';
Variacao{2,2} = 'A';
Variacao{2,3} = '2';

Variacao{2,4} = Var_Ceraolo;
Variacao{2,5} = Var_Shephard;
Variacao{2,6} = Var_CC;

cd('..');

%%
% Amostra 3
cd('C_Cap_72_Bateria_A_Amostra_3');
load('Bat_A_72_Amostra_3.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 72; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria A|72Ah|Amostra 3 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria A|72Ah|Amostra 3 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria A|72Ah|Amostra 3 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra3

fprintf('              Variância da diferença para os valores do IBS para a Amostra 3 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{3,1} = '72';
Variacao{3,2} = 'A';
Variacao{3,3} = '3';

Variacao{3,4} = Var_Ceraolo;
Variacao{3,5} = Var_Shephard;
Variacao{3,6} = Var_CC;

cd('..');

%%
fprintf('       Bateria B \n\n');

% Amostra 4
cd('D_Cap_72_Bateria_B_Amostra_1');
load('Bat_B_72_Amostra_1.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 72; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria B|72Ah|Amostra 1 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria B|72Ah|Amostra 1 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria B|72Ah|Amostra 1 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra4

fprintf('              Variância da diferença para os valores do IBS para a Amostra 1 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{4,1} = '72';
Variacao{4,2} = 'B';
Variacao{4,3} = '1';

Variacao{4,4} = Var_Ceraolo;
Variacao{4,5} = Var_Shephard;
Variacao{4,6} = Var_CC;

cd('..');

%%
% Amostra 5
cd('E_Cap_72_Bateria_B_Amostra_2');
load('Bat_B_72_Amostra_2.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 72; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria B|72Ah|Amostra 2 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria B|72Ah|Amostra 2 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria B|72Ah|Amostra 2 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra5

fprintf('              Variância da diferença para os valores do IBS para a Amostra 2 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{5,1} = '72';
Variacao{5,2} = 'B';
Variacao{5,3} = '2';

Variacao{5,4} = Var_Ceraolo;
Variacao{5,5} = Var_Shephard;
Variacao{5,6} = Var_CC;

cd('..');

%%

% Amostra 6
cd('F_Cap_72_Bateria_B_Amostra_3');
load('Bat_B_72_Amostra_3.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 72; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria B|72Ah|Amostra 3 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria B|72Ah|Amostra 3 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria B|72Ah|Amostra 3 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra6

fprintf('              Variância da diferença para os valores do IBS para a Amostra 3 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{6,1} = '72';
Variacao{6,2} = 'B';
Variacao{6,3} = '3';

Variacao{6,4} = Var_Ceraolo;
Variacao{6,5} = Var_Shephard;
Variacao{6,6} = Var_CC;

cd('..');
%%
fprintf('       Bateria C \n\n');

% Amostra 7
cd('G_Cap_72_Bateria_C_Amostra_1');
load('Bat_C_72_Amostra_1.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 72; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria C|72Ah|Amostra 1 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria C|72Ah|Amostra 1 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria C|72Ah|Amostra 1 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra7

fprintf('              Variância da diferença para os valores do IBS para a Amostra 1 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{7,1} = '72';
Variacao{7,2} = 'C';
Variacao{7,3} = '1';

Variacao{7,4} = Var_Ceraolo;
Variacao{7,5} = Var_Shephard;
Variacao{7,6} = Var_CC;

cd('..');

%%
% Amostra 8
cd('H_Cap_72_Bateria_C_Amostra_2');
load('Bat_C_72_Amostra_2.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 72; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria C|72Ah|Amostra 2 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria C|72Ah|Amostra 2 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria C|72Ah|Amostra 2 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra8

fprintf('              Variância da diferença para os valores do IBS para a Amostra 2 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{8,1} = '72';
Variacao{8,2} = 'C';
Variacao{8,3} = '2';

Variacao{8,4} = Var_Ceraolo;
Variacao{8,5} = Var_Shephard;
Variacao{8,6} = Var_CC;

cd('..');

%%
% Amostra 9
cd('I_Cap_72_Bateria_C_Amostra_3');
load('Bat_C_72_Amostra_3.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 72; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria C|72Ah|Amostra 3 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria C|72Ah|Amostra 3 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria C|72Ah|Amostra 3 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra9

fprintf('              Variância da diferença para os valores do IBS para a Amostra 3 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{9,1} = '72';
Variacao{9,2} = 'C';
Variacao{9,3} = '3';

Variacao{9,4} = Var_Ceraolo;
Variacao{9,5} = Var_Shephard;
Variacao{9,6} = Var_CC;

cd('..');

%%
fprintf('Teste de Baterias de 60 Ah \n\n');
fprintf('       Bateria A \n\n');

% Amostra 10
cd('J_Cap_60_Bateria_A_Amostra_1');
load('Bat_A_60_Amostra_1.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 60; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria A|60Ah|Amostra 1 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria A|60Ah|Amostra 1 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria A|60Ah|Amostra 1 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra10

fprintf('              Variância da diferença para os valores do IBS para a Amostra 1 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{10,1} = '60';
Variacao{10,2} = 'A';
Variacao{10,3} = '1';

Variacao{10,4} = Var_Ceraolo;
Variacao{10,5} = Var_Shephard;
Variacao{10,6} = Var_CC;

cd('..');

%%
% Amostra 11
cd('K_Cap_60_Bateria_A_Amostra_2');
load('Bat_A_60_Amostra_2.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 60; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria A|60Ah|Amostra 2 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria A|60Ah|Amostra 2 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria A|60Ah|Amostra 2 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra11

fprintf('              Variância da diferença para os valores do IBS para a Amostra 2 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{11,1} = '60';
Variacao{11,2} = 'A';
Variacao{11,3} = '2';

Variacao{11,4} = Var_Ceraolo;
Variacao{11,5} = Var_Shephard;
Variacao{11,6} = Var_CC;

cd('..');

%%
% Amostra12
cd('L_Cap_60_Bateria_A_Amostra_3');
load('Bat_A_60_Amostra_3.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 60; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria A|60Ah|Amostra 3 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria A|60Ah|Amostra 3 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria A|60Ah|Amostra 3 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra12

fprintf('              Variância da diferença para os valores do IBS para a Amostra 3 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{12,1} = '60';
Variacao{12,2} = 'A';
Variacao{12,3} = '3';

Variacao{12,4} = Var_Ceraolo;
Variacao{12,5} = Var_Shephard;
Variacao{12,6} = Var_CC;

cd('..');

fprintf('       Bateria B \n\n');

%%
% Amostra 13
cd('M_Cap_60_Bateria_B_Amostra_1');
load('Bat_B_60_Amostra_1.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 60; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria B|60Ah|Amostra 1 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria B|60Ah|Amostra 1 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria B|60Ah|Amostra 1 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra13

fprintf('              Variância da diferença para os valores do IBS para a Amostra 1 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{13,1} = '60';
Variacao{13,2} = 'B';
Variacao{13,3} = '1';

Variacao{13,4} = Var_Ceraolo;
Variacao{13,5} = Var_Shephard;
Variacao{13,6} = Var_CC;

cd('..');

%%
% Amostra 14
cd('N_Cap_60_Bateria_B_Amostra_2');
load('Bat_B_60_Amostra_2.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 60; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria B|60Ah|Amostra 2 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria B|60Ah|Amostra 2 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria B|60Ah|Amostra 2 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra14

fprintf('              Variância da diferença para os valores do IBS para a Amostra 2 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{14,1} = '60';
Variacao{14,2} = 'B';
Variacao{14,3} = '2';

Variacao{14,4} = Var_Ceraolo;
Variacao{14,5} = Var_Shephard;
Variacao{14,6} = Var_CC;

cd('..');

%%
% Amostra 15
cd('O_Cap_60_Bateria_B_Amostra_3');
load('Bat_B_60_Amostra_3.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 60; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria B|60Ah|Amostra 3 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria B|60Ah|Amostra 3 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria B|60Ah|Amostra 3 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra15

fprintf('              Variância da diferença para os valores do IBS para a Amostra 3 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{15,1} = '60';
Variacao{15,2} = 'B';
Variacao{15,3} = '3';

Variacao{15,4} = Var_Ceraolo;
Variacao{15,5} = Var_Shephard;
Variacao{15,6} = Var_CC;

cd('..');

%%
fprintf('       Bateria C \n\n');
% Amostra 16
cd('P_Cap_60_Bateria_C_Amostra_1');
load('Bat_C_60_Amostra_1.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 60; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria C|60Ah|Amostra 1 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria C|60Ah|Amostra 1 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria C|60Ah|Amostra 1 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra16

fprintf('              Variância da diferença para os valores do IBS para a Amostra 1 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{16,1} = '60';
Variacao{16,2} = 'C';
Variacao{16,3} = '1';

Variacao{16,4} = Var_Ceraolo;
Variacao{16,5} = Var_Shephard;
Variacao{16,6} = Var_CC;

cd('..');

%%
% Amostra 17
cd('Q_Cap_60_Bateria_C_Amostra_2');
load('Bat_C_60_Amostra_2.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 60; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria C|60Ah|Amostra 2 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria C|60Ah|Amostra 2 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria C|60Ah|Amostra 2 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra17

fprintf('              Variância da diferença para os valores do IBS para a Amostra 2 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);

Variacao{17,1} = '60';
Variacao{17,2} = 'C';
Variacao{17,3} = '2';

Variacao{17,4} = Var_Ceraolo;
Variacao{17,5} = Var_Shephard;
Variacao{17,6} = Var_CC;

cd('..');

%%
% Amostra 18
cd('R_Cap_60_Bateria_C_Amostra_3');
load('Bat_C_60_Amostra_3.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;
CAPACIDADE = 60; % Ah
% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(CAPACIDADE*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

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
plot(y_Shephard, 'g','LineWidth',1);
hold on;

plot(Est_Carga(1:15000), 'r','LineWidth',1);
hold on;

plot(uint32(Bat_CC), 'm','LineWidth',1);
hold on;

plot(y_Ceraolo, 'b','LineWidth',1); 

legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Bateria C|60Ah|Amostra 3 - Estado de Carga por Modelos');
grid on;


figure;
time = 1:1:N;

[AX, H1, H2] = plotyy(time, Est_Carga(time), time, Corrente(time));
% 
% %style the plot
set(H1,'Color','r','LineWidth',1);
set(H2,'Color','b','LineWidth',1);
% 
set(AX(1),'YColor','r');
set(AX(2),'YColor','b');
% 
% %x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (%)');
set(get(AX(2),'Ylabel'),'String','Corrente');
%  
set(get(AX(1),'Xlabel'),'String','Tempo (s)');
% set(get(AX(2),'Ylabel'),'String','Corrente'); 
% 
title('Bateria C|60Ah|Amostra 3 - Corrente e Estado de Carga');
% 
% %grid
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

title('Bateria C|60Ah|Amostra 3 - Diferença do Estado de Carga em relação ao IBS');

Var_Ceraolo = var(Erro_Ceraolo);
Var_Shephard = var(Erro_Shephard);
Var_CC = var(double(Erro_CC));

% Amostra18

fprintf('              Variância da diferença para os valores do IBS para a Amostra 3 \n');
fprintf('                     Modelo de Ceraolo: %6.2f\n', Var_Ceraolo);
fprintf('                     Modelo de Shephard: %6.2f\n', Var_Shephard);
fprintf('                     Modelo Counting Coulomb: %6.2f\n', Var_CC);


Variacao{18,1} = '60';
Variacao{18,2} = 'C';
Variacao{18,3} = '3';

Variacao{18,4} = Var_Ceraolo;
Variacao{18,5} = Var_Shephard;
Variacao{18,6} = Var_CC;
