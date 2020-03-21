%function varvargout = OrthPoly(varvargin) 
 
    format short g
 
 
    Lrn = 2; 
    Lrd = 1; 
    Lr  = max(Lrn+1,Lrd+1); 
    N   = 1024;                                                               
    U   = -1+2*rand(N,1); 
    Y   = zeros(N,1); 

    for k = Lr:N                                                                 
        Y(k,1)=(0.3*Y(k-1)+0.5*U(k-1,1)+0.1*Y(k-1)*U(k-1)+0.1*U(k-2))/(1+U(k-1)^2); 
    end

    noise = randn(N,1);  
    noise = noise/std(noise);  
    noise = noise-mean(noise);  
    a = 0;  
    b = sqrt(0.00001);  
    noise = (a+b)*noise; 
    Y  = Y + noise; 
    
    Yr = Y; 
 
    Ln = 2; 
    Ld = 1; 
    St = max(Ln+1,Ld+1); 
    M  = 16; 
    N  = 1024; 

    for k=St:N 
        P(k,:)=[U(k-1) Y(k-1) U(k-1)^2 U(k-2) U(k-1)*Y(k-1) ...
        (U(k-1,1)*Y(k-2))^2 U(k-1)^2*Y(k-1) Y(k-2)^2 ...
        -Y(k)*U(k-1) -Y(k)*Y(k-1) -Y(k)*U(k-1)^2 -Y(k)*U(k-2)...
        -Y(k)*U(k-1)*Y(k-1) -Y(k)*(U(k-1,1)*Y(k-2))^2 ...
        -Y(k)*U(k-1)^2*Y(k-1) -Y(k)*Y(k-2)^2]; 
    end 
 
    Qs = zeros(N,M,M); 
    Gs = zeros(N,M,M); 
    Rs = zeros(M,M,M); 
    ERRs = zeros(M,M); 
    Qad  = zeros(N,1); 
    Max  = zeros(1,M); 
 
    for l=1:50 
        ERRs = zeros(M,M); 
        Max = zeros(1,M); 
        for j=1:M 
            for i=1:M 
                tt1 = find(Max==i); 
                
                if (length(tt1)==0) 
                    if j==1 
                        Qs(:,j,i)=P(:,i); 
                    else 
                        for t=1:j-1 
                            Qad = Qad+Rs(t,j,i)*Q(:,t); 
                        end % end t
                    
                        Qs(:,j,i) = P(:,i)-Qad; 
                        Qad = zeros(N,1); 
                    end % end j
                    
                    for t=1:j-1 
                        Rs(t,j,i)=(P(:,i)'*Q(:,t))/(Q(:,t)'*Q(:,t)); 
                    end % t 
                    
                    Gs(j,i)   = (Qs(:,j,i)'*Y(:,1))/(Qs(:,j,i)'*Qs(:,j,i)); 
                    ERRs(j,i) = ((Gs(j,i)^2)*(Qs(:,j,i)'*Qs(:,j,i)))/(Y(:,1)'*Y(:,1)); 
                    MM = find(ERRs(j,:)==max(ERRs(j,:))); 
                else 
                    ERRs(j,i) = -inf; 
                end % if length
            end%(i) 
        
            Max(1,j) = MM(1,1); 
            Q(:,j)   = Qs(:,j,Max(1,j)); 
        end%(j) 
    end %(l) 

    pause(1) 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      Ñ¡Ôñ�?ÔÖø�?î       %%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
    Selected = 6; 
    P =  P(:,Max(1:Selected)); 
    X = -1+2 * rand(Selected,1);  
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      ²ÎÊý±æÊ¶        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%¡¡ 
 
L  = 100; 
Si = 0.3; 
Se = 0.1; 
for l=0:L-1 
    for k=St:N 
        y(k,1)=P(k,:)*X; 
        e(k,1)=Y(k,1)-y(k,1); 
        S=Si-(Si-Se)*(l*N+k)/(L*N); 
        X=X+S*e(k,1)*P(k,:)'; 
    end 
end 
 
 
L  = 1000; 
Si = 0.05; 
Se = 0.0001; 
for l=0:L-1 
    for k=St:N 
        y(k,1)=P(k,:)*X; 
        e(k,1)=Y(k,1)-y(k,1); 
        S=Si-(Si-Se)*(l*N+k)/(L*N); 
        X=X+S*e(k,1)*P(k,:)'; 
    end 
end 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      ²ÎÊý±æÊ¶½á¹û        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%¡¡ 
 
plot(e) 
coeff=X 
MEAN=mean(e) 
VARIANCE=var(e) 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       Ä£�?�?¿ÉÓÃ�?ÔÅ�?¶¨       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%¡¡ 
 
just1=zeros(N,1); 
just2=zeros(N,1); 
num1=0; 
num2=0; 
den11=0; 
den12=0; 
den21=0; 
den22=0; 
delay=5; 
ye1=mean(y(delay+1:end)'*e(delay+1:end)); 
se1=mean(e(delay+1:end)'*e(delay+1:end)); 
su1=mean(U(delay+1:end)'*U(delay+1:end)); 
for k=delay+1:N 
    num1=num1+(y(k)*e(k)-ye1)*(e(k-delay)^2-se1); 
    num2=num2+(y(k)*e(k)-ye1)*(U(k-delay)^2-su1); 
    den11=den11+(y(k)*e(k)-ye1)^2; 
    den12=den12+(e(k)*e(k)-se1)^2; 
    den21=den21+(y(k)*e(k)-ye1)^2; 
    den22=den22+(U(k)*U(k)-su1)^2; 
    just1(k,1)=num1/sqrt(den11*den12); 
    just2(k,1)=num2/sqrt(den21*den22); 
end%(k) 
figure 
subplot(2,1,1) 
plot(just1(delay+1:end)) 
grid on 
title('correlation test y*e with e*e') 
subplot(2,1,2) 
plot(just2(delay+1:end))  
grid on 
title('correlation test y*e with u*u')