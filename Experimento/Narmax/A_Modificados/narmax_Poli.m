% NARMAX - NonLinear
clc; clear all;

global L;
global nu;
global ny;
global c;

L = 3;
nu = 3;
ny = 3;

c = [];

for m=0:1:L
    for p=0:1:L-m
        str = sprintf('c_{%d,%d}', m, p);
        c{p+1, m+1, 1} = str;
        Componente_c(m, p);
    end
end




