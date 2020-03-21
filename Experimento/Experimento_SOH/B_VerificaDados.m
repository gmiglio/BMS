

% Experimento do SOC com SOH em diversos níveis
% Verificação dos dados
% Guilherme Miglio Doxa


inicio = 0;

cd('A_100_90');
load('A_SOH_100_90.mat');
N = length(Corrente);

for i=1:1:N

    if((isnan(Corrente(i)) == 0) & (isnan(Corrente_Range(i)) == 0) &...
       (isnan(Est_Carga(i)) == 0) & (isnan(Est_Carga_Sts(i)) == 0) &...
       (isnan(Est_Saude(i)) == 0) & (isnan(Est_Saude_Sts(i)) == 0) &...
       (isnan(Ibs_Sts(i)) == 0) & (Ibs_Sts(i) == 0) & ...
       (isnan(Temperatura(i)) == 0) & (isnan(Temperatura_Sts(i))) == 0 &...
       (isnan(Tensao(i)) == 0) & (isnan(Tensao_Sts(i)) == 0) &...
       (Est_Carga_Sts(i) ~= 3) & Est_Saude_Sts(i) ~= 3)

        if (inicio == 0 && i > 1)
            inicio = 1;
            Corrente(1:i-1) = Corrente(i);
            Corrente_Range(1:i-1) = Corrente_Range(i);
            Tensao(1:i-1) = Tensao(i);
            Tensao_Sts(1:i-1) = Tensao_Sts(i);
            Temperatura(1:i-1) = Temperatura(i);
            Temperatura_Sts(1:i-1) = Temperatura_Sts(i);
            Est_Carga(1:i-1) = Est_Carga(i);
            Est_Carga_Sts(1:i-1) = Est_Carga_Sts(i);
            Est_Saude(1:i-1) = Est_Saude(i);
            Est_Saude_Sts(1:i-1) = Est_Saude_Sts(i);
            Ibs_Sts(1:i-1) = Ibs_Sts(i);
        end
    elseif(i>1 && inicio ==1)
            Corrente(i) = Corrente(i-1);
            Corrente_Range(i) = Corrente_Range(i-1);
            Tensao(i) = Tensao(i-1);
            Tensao_Sts(i) = Tensao_Sts(i-1);
            Temperatura(i) = Temperatura(i-1);
            Temperatura_Sts(i) = Temperatura_Sts(i-1);
            Est_Carga(i) = Est_Carga(i-1);
            Est_Carga_Sts(i) = Est_Carga_Sts(i-1);
            Est_Saude(i) = Est_Saude(i-1);
            Est_Saude_Sts(i) = Est_Saude_Sts(i-1);
            Ibs_Sts(i) = Ibs_Sts(i-1);
    end    
end

save('A_SOH_100_90', 'Tensao', 'Tensao_Sts', 'Corrente', 'Corrente_Range',...
    'Temperatura','Temperatura_Sts', 'Est_Saude', 'Est_Saude_Sts',...
    'Est_Carga', 'Est_Carga_Sts', 'Ibs_Sts');
