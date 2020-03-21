


% Desenvolvimento da f�rmula polinomial NARMAX
clc; clear all;

% Fator de ru�do
ne = 2;

% Grau de n�o linearidade do sistema
L = 2;

% Fator de sa�da
ny = 2;

% Fator de Entrada
nu = 2;

% fprintf('\n _______ Software de Identifica��o de Sistemas n�o Lineares _______ \n\n');
% fprintf('\n Grau de N�o Linearidade do Sistema: %d', L);
% fprintf('\n Fator de Sa�da  : %d', ny);
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
% fprintf('\n _______ FIM DA EXECU��O _______ \n');

