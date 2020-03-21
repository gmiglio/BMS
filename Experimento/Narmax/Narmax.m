


% Desenvolvimento da fórmula polinomial NARMAX
clc; clear all;

% Fator de ruído
ne = 2;

% Grau de não linearidade do sistema
L = 2;

% Fator de saída
ny = 2;

% Fator de Entrada
nu = 2;

% fprintf('\n _______ Software de Identificação de Sistemas não Lineares _______ \n\n');
% fprintf('\n Grau de Não Linearidade do Sistema: %d', L);
% fprintf('\n Fator de Saída  : %d', ny);
% fprintf('\n Fator de Entrada: %d \n', nu);
% 
% fprintf('\n Processamento do modelo polinomial NARMAX \n');
% Coeficientes dos Regressores

C = [];
count = 1;
U = [];
Y = [];

for m = 0:1:L
    for p = 0:1:m
        % Monta a matriz de C
        str = sprintf('c_{%d, %d}', p, m - p);
        C{p+1, m-p+1, 1} = str;
        fprintf('%s', str);
    end
end

fprintf('\n');
% fprintf('\n _______ FIM DA EXECUÇÃO _______ \n');

