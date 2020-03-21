

% Cálculo para encontrar o número de termos possíveis

% entrada nu
% saída   ny
% erro    ne

M = 0;  % total de termos -1
%  l = 3;  % grau de não linearidade
%  ny = 2; % atraso na saída
%  nu = 2; % atraso na entrada
%  ne = 0; % atraso no erro

n = [];

for i=1:1:l
    if i == 1
        n(i) = (ny + nu + ne + i - 1)/i;
    else
        n(i) = n(i-1)*(ny + nu + ne + i - 1)/i;
    end
end

M = sum(n);
np = M + 1;

disp(sprintf('Numero de termos : %d', np));