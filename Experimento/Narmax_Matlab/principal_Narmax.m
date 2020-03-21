% clear all;
% clc;
%_________________________________________________________________________
% Monta algoritmo 

load('dados');

%_________________________________________________________________________
Nr_Termos = 20000;
time = 1:1:Nr_Termos;

l  = 3;
ny = 3;
nu = 3;
ne = 0;

d = 4;
nro_variaveis = 10;
%_________________________________________________________________________

% Treinamento com a entrada como corrente
corrente_total = corrente_total';

% Treinamento com a entrada como tensão
tensao_total = tensao_total';


Tx1 = 1;
Tx2 = 1;

erro_quadratico=0;
u_tx1 = corrente_total(1:Nr_Termos);
%u_tx2 = corrente_total(Nr_Termos+1:40000);
%u_tx1 = tensao_total(1:Nr_Termos);
y_tx1 = SOC_CC(1:Nr_Termos);

%y_tx2 = SOC_CC(20001:40000);

m = length(y_tx1');

% define vec como as amostras que se 
% deseja identificar do vetor de medidas
vec = y_tx1(d:m); 


run('Nro_termos_possiveis');
run('Regressores_do_modelo');
np = nro_variaveis;


Psi=[psi vec]; 

[A, err, piv] = myhouse(Psi, np); 
Psit=Psi(:,piv(1:np));

teta = pinv(Psit'*Psit, 10^-20)*Psit'*vec;


teta_string = cellstr(num2str(teta(:)));
equacao = '';
for i=1:np
    equacao = strcat(equacao, ' + ', teta_string(i,:), '*' , Regressores(piv(i), :));
end

y_est = zeros(Nr_Termos,1);
y_est(1) = y_tx1(1);

if(d == 3)
    y_est(2) = y_tx1(2);
end
if(d == 4)
    y_est(2) = y_tx1(2);
    y_est(3) = y_tx1(3);
end

u_est = u_tx1;
for k=d:Nr_Termos
    y_est(k) = eval(equacao{1});
end

% plot(y_est);
% hold on;
% plot(y_tx1);
% 
% ruido = var(y_est-y_tx1);
% 
% AIC = abs(Nr_Termos*log10(ruido) + 2*np);
% 
% AIC

disp('Finalização do arquivo');