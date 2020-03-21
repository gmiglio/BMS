clc;
clear all;

% Seção 2 - Detecção de não Linearidades

load('dados_parametrizacao.mat');
u1 = Sim_Corrente.Data;
u2 = Sim_Tensao.Data;
y = Sim_Est_Carga.Data;



%Programa para calcular e graficar a correlação cruzada entre as variáveis
%de entrada esaída dos blocos do modelo
[XCF,Lags,Bounds]=crosscorr(u1,y,40000);

plot(Lags,XCF,'k.') ;
hold on;

xlabel('Atraso [s]','FontWeight','Bold','Fontsize',12); 
ylabel('Correlação Cruzada','FontWeight','Bold','Fontsize',12); 
title('Corr. Cruzada Corrente (A) vs. Estado de Carga (%)','FontWeight','Bold','Fontsize',14);

%Programa para calcular e graficar a correlação cruzada entre as variáveis
%de entrada esaída dos blocos do modelo
[XCF,Lags,Bounds]=crosscorr(u2,y,40000);
figure;
plot(Lags,XCF,'k.') ;
xlabel('Atraso [s]','FontWeight','Bold','Fontsize',12); 
ylabel('Correlação Cruzada','FontWeight','Bold','Fontsize',12); 
title('Corr. Cruzada Tensão (V) vs. Estado de Carga (%)','FontWeight','Bold','Fontsize',14);

figure;
[XCF1, Lags, Bounds] = autocorr(y, 40000);
plot(Lags,XCF1,'k.', Lags, Bounds(2)*ones(size(Lags)), '--b') ;
xlabel('Atraso [s]','FontWeight','Bold','Fontsize',12); 
ylabel('AutoCorrelação','FontWeight','Bold','Fontsize',12); 
title('AutoCorrelação Estado de Carga (%)','FontWeight','Bold','Fontsize',14);

figure;
[XCF2, Lags, Bounds] = autocorr(y.^2, 40000);
plot(Lags,XCF2,'k.') ;
xlabel('Atraso [s]','FontWeight','Bold','Fontsize',12); 
ylabel('AutoCorrelação','FontWeight','Bold','Fontsize',12); 
title('AutoCorrelação Estado de Carga (%)','FontWeight','Bold','Fontsize',14);


