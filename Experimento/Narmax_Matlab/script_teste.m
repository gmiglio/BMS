% clear all;
% clc;

% 
% 
nro_variaveis = 1;
regress_0  = zeros(15,1);
regress_u  = zeros(15,1);
regress_y  = zeros(15,1);
regress_u2 = zeros(15,1);
regress_y2 = zeros(15,1);
regress_yu2= zeros(15,1);

run('Regressores_do_modelo_3');

for teste = 3:1:10
     nro_variaveis = teste;
     run('principal_Narmax');

    
     
    u_est(1:3) = 1;
    y_est(1:3) = 1;
    k = 4;
    
    equacao = '';
    for i=1:np
        equacao = strcat(equacao, ' + ', teta_string(i,:), '*' , Regressores_0(piv(i), :));
    end
    regress_0(teste)  = eval(equacao{1});
    
    equacao = '';
    for i=1:np
        equacao = strcat(equacao, ' + ', teta_string(i,:), '*' , Regressores_u(piv(i), :));
    end
    regress_u(teste)  = eval(equacao{1});
    
    equacao = '';
    for i=1:np
        equacao = strcat(equacao, ' + ', teta_string(i,:), '*' , Regressores_y(piv(i), :));
    end
    regress_y(teste)  = eval(equacao{1});
    
    equacao = '';
    for i=1:np
        equacao = strcat(equacao, ' + ', teta_string(i,:), '*' , Regressores_u2(piv(i), :));
    end
    regress_u2(teste) = eval(equacao{1});
    
    equacao = '';
    for i=1:np
        equacao = strcat(equacao, ' + ', teta_string(i,:), '*' , Regressores_y2(piv(i), :));
    end
    regress_y2(teste) = eval(equacao{1});
    
    equacao = '';
    for i=1:np
        equacao = strcat(equacao, ' + ', teta_string(i,:), '*' , Regressores_yu2(piv(i), :));
    end
    regress_yu2(teste) = eval(equacao{1});

end


subplot(611);
plot(regress_0); xlim([3 10]);
set(gca, 'FontSize', 10);
title('Agrupamento \Omega_{0}');
xlabel('Número de Termos','FontWeight','bold');

subplot(612);
plot(regress_u); xlim([3 10]);
set(gca, 'FontSize', 10);
title('Agrupamento \Omega_{u}');
xlabel('Número de Termos','FontWeight','bold');

subplot(613);
plot(regress_y); xlim([3 10]);
set(gca, 'FontSize', 10);
title('Agrupamento \Omega_{y}');
xlabel('Número de Termos','FontWeight','bold');

subplot(614);
plot(regress_u2); xlim([3 10]);
set(gca, 'FontSize', 10);
title('Agrupamento \Omega_{u^2}');
xlabel('Número de Termos','FontWeight','bold');

subplot(615);
plot(regress_y2); xlim([3 10]);
set(gca, 'FontSize', 10);
title('Agrupamento \Omega_{y^2}');
xlabel('Número de Termos','FontWeight','bold');

subplot(616);
plot(regress_yu2); xlim([3 10]);
set(gca, 'FontSize', 10);
title('Agrupamento \Omega_{yu^2}');
xlabel('Número de Termos','FontWeight','bold');

saveas(gcf, 'agrupamento_omega322.png');
% 
% [ind, valor] = min(criterio)
% 
% 
% save('criterio_v_333', 'criterio');


% load('criterio222.mat');
% criterio1 = criterio;
% 
% load('criterio322.mat');
% criterio2 = criterio;
% 
% load('criterio333.mat');
% criterio3 = criterio;
% 
% 
% plot(criterio1, 'ko', 'LineWidth', 5);
% hold on;
% plot(criterio2, 'rs', 'LineWidth', 5);
% hold on;
% plot(criterio3, 'bv', 'LineWidth', 5);
% hold on;
% plot(criterio1, 'k-', 'LineWidth', 2);
% hold on;
% plot(criterio2, 'r-', 'LineWidth', 2);
% hold on;
% plot(criterio3, 'b-', 'LineWidth', 2);



% load('dados.mat');
% 
% 
% subplot(211);
% plot(tensao_total(1:40000), 'k-', 'LineWidth', 2);
% set(gca, 'FontSize', 16);
% title('Perfil de Tensão');
% ylabel('Tensão (V)');
% xlabel('Tempo (s)','FontWeight','bold');
% 
% subplot(212);
% plot(corrente_total(1:40000), 'k-', 'LineWidth', 2);
% set(gca, 'FontSize', 16);
% title('Perfil de Corrente');
% ylabel('Corrente (A)');
% xlabel('Tempo (s)','FontWeight','bold');
% 
% 
% 
% saveas(gcf, 'perfil_tensao_corrente.png');
