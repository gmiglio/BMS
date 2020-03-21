
load('dados');

l = 10000;
corrente = corrente_total(20001:30000);
y_out = zeros(l,1);

for i=2:1:l
    y_out(i) = 1.123*1 + 0.004986*corrente(i) + 0.9863*y_out(i-1);
end


plot(y_out);
hold on;
plot(SOC_CC(20001:30000));