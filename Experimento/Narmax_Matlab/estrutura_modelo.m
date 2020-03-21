% Rotina para calcular os regressores dos dados

kg   = input('Digite a ordem dos regressores (1 até 3): ');
kg0  = max(kg,1); 

cruz = 1

        
%Definição da ordem dos regressores
if k2==1
    nu=1;
    ny=1; 
end
if k2==2
    nu=2;
    ny=1;
end
if k2==3
    nu=3;
    ny=1; 
end
    
%Criacao da Matriz Psi dos Regressores
%Regressores constantes
Nn  = length(utfm);
Psi = ones(Nn-3,1);

M = length(uvfm);
Psi1 = ones(M-3,1);

Z = zeros(36,3);

%Regressores lineares de utfm e ytfm
for j=1:3
    Psi=[Psi utfm(4-j:Nn-j)];
    Psi1=[Psi1 uvfm(4-j:M-j)];
end
    
        if es == 2 || es == 4
            for j=1:3
                Psi  = [Psi ut2fm(4-j:Nn-j)];
                Psi1 = [Psi1 uv2fm(4-j:M-j)];
            end
        end

        for j=1:3
            Psi=[Psi ytfm(4-j:Nn-j)];
            Psi1=[Psi1 yvfm(4-j:M-j)];
        end
    
        %Regressores nao lineares de segunda ordem de utfm e ytfm if nu>1
        for j=2:4
            for k=j:4
                i=size(Psi,2)+1; Psi(:,i)=Psi(:,j).*Psi(:,k); ii=size(Psi1,2)+1; Psi1(:,ii)=Psi1(:,j).*Psi1(:,k); Z(i,:)=[j k 0];
            end
        end
    
        if es==2 || es==4
            for j=5:7
                for k=j:7
                    i=size(Psi,2)+1;
                end
            end
        end
    end
    
    Psi(:,i)=Psi(:,j).*Psi(:,k); 
    ii=size(Psi1,2)+1; 
    Psi1(:,ii)=Psi1(:,j).*Psi1(:,k); 
    Z(i,:)=[j k 0];
    
    if ny>1
        if es==2 || es==4
    for j=8:10
        for k=j:10
            i=size(Psi,2)+1;
            Psi(:,i)=Psi(:,j).*Psi(:,k); ii=size(Psi1,2)+1; Psi1(:,ii)=Psi1(:,j).*Psi1(:,k); Z(i,:)=[j k 0];
        end
    end
else
    for j=5:7
        for k=j:7
            i=size(Psi,2)+1;
            Psi(:,i)=Psi(:,j).*Psi(:,k); ii=size(Psi1,2)+1; Psi1(:,ii)=Psi1(:,j).*Psi1(:,k);


            Z(i,:)=[j k 0];
end
end
        end
    end




        
        
            