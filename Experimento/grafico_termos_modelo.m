addpath('Narmax_Matlab');

termos = zeros(8, 1);


l = 1;
nu = 1;
ny = 1;
ne = 0;

run('Nro_termos_possiveis');
termos(1) = np;

l = 2;
nu = 1;
ny = 1;
ne = 0;

run('Nro_termos_possiveis');
termos(2) = np;

l = 2;
nu = 2;
ny = 2;
ne = 1;

run('Nro_termos_possiveis');
termos(3) = np;

l = 2;
nu = 2;
ny = 2;
ne = 2;

run('Nro_termos_possiveis');
termos(4) = np;

l = 3;
nu = 1;
ny = 1;
ne = 1;

run('Nro_termos_possiveis');
termos(5) = np;

l = 3;
nu = 2;
ny = 2;
ne = 2;

run('Nro_termos_possiveis');
termos(6) = np;

l = 4;
nu = 2;
ny = 2;
ne = 2;

run('Nro_termos_possiveis');
termos(7) = np;

l = 4;
nu = 3;
ny = 3;
ne = 3;

run('Nro_termos_possiveis');
termos(8) = np;

figure('Color',[1 1 1]);

plot(termos(1:7),'k*', 'LineWidth', 3) ;
hold on;
plot(termos(1:7), 'k-', 'LineWidth', 3);

set(gca,'FontName', 'Times New Roman');
set(gca, 'FontSize', 20);
set(gca, 'LineWidth', 2);

xlabel('Número de Termos','FontWeight','Bold'); 
ylabel('Regressores','FontWeight','Bold'); 
title('Quantidade de Regressores num modelo NARMAX','FontWeight','Bold');

saveas(gcf, 'nro_termos.png');
