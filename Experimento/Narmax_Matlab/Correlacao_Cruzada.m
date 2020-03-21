clc;
clear all;

% Se��o 2 - Detec��o de n�o Linearidades

load('dados_parametrizacao.mat');
u1 = Sim_Corrente.Data;
u2 = Sim_Tensao.Data;
y = Sim_Est_Carga.Data;



%Programa para calcular e graficar a correla��o cruzada entre as vari�veis
%de entrada esa�da dos blocos do modelo
[XCF,Lags,Bounds]=crosscorr(u1,y,40000);

plot(Lags,XCF,'k.') ;
hold on;

xlabel('Atraso [s]','FontWeight','Bold','Fontsize',12); 
ylabel('Correla��o Cruzada','FontWeight','Bold','Fontsize',12); 
title('Corr. Cruzada Corrente (A) vs. Estado de Carga (%)','FontWeight','Bold','Fontsize',14);

%Programa para calcular e graficar a correla��o cruzada entre as vari�veis
%de entrada esa�da dos blocos do modelo
[XCF,Lags,Bounds]=crosscorr(u2,y,40000);
figure;
plot(Lags,XCF,'k.') ;
xlabel('Atraso [s]','FontWeight','Bold','Fontsize',12); 
ylabel('Correla��o Cruzada','FontWeight','Bold','Fontsize',12); 
title('Corr. Cruzada Tens�o (V) vs. Estado de Carga (%)','FontWeight','Bold','Fontsize',14);

figure;
[XCF1, Lags, Bounds] = autocorr(y, 40000);
plot(Lags,XCF1,'k.', Lags, Bounds(2)*ones(size(Lags)), '--b') ;
xlabel('Atraso [s]','FontWeight','Bold','Fontsize',12); 
ylabel('AutoCorrela��o','FontWeight','Bold','Fontsize',12); 
title('AutoCorrela��o Estado de Carga (%)','FontWeight','Bold','Fontsize',14);

figure;
[XCF2, Lags, Bounds] = autocorr(y.^2, 40000);
plot(Lags,XCF2,'k.') ;
xlabel('Atraso [s]','FontWeight','Bold','Fontsize',12); 
ylabel('AutoCorrela��o','FontWeight','Bold','Fontsize',12); 
title('AutoCorrela��o Estado de Carga (%)','FontWeight','Bold','Fontsize',14);


