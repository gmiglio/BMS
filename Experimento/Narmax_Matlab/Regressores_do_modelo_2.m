% nl111 - 3 termos
if(l == 1 && ny == 1 && nu == 1)
    reg1=ones((m-1),1); % constante
    reg2=u_tx2(1:(m-1)); % u(k-1)
    reg3=y_tx2(1:(m-1)); % y(k-1)
    psi=[reg1 reg2 reg3];
    Regressores = {'1';'u_est(k-1)';'y_est(k-1)';};
end

% nl121 - 4 termos
if(l == 1 && ny == 2 && nu == 1)
    reg1=ones((m-2),1); % constante
    reg2=u_tx2(2:(m-1)); % u(k-1)
    reg3=y_tx2(2:(m-1)); % y(k-1)
    reg4=y_tx2(1:(m-2)); % y(k-2)
    psi=[reg1 reg2 reg3 reg4];
    Regressores = {'1';'u_est(k-1)';'y_est(k-1)';'y_est(k-2)';};
end

%nl112 - 4 termos
if(l == 1 && ny == 1 && nu == 2)
    reg1=ones((m-2),1); % constante
    reg2=u_tx2(2:(m-1)); % u(k-1)
    reg3=u_tx2(1:(m-2)); % u(k-2)
    reg4=y_tx2(2:(m-1)); % y(k-1)
    psi=[reg1 reg2 reg3 reg4];
    Regressores = {'1';'u_est(k-1)';'u_est(k-2)';'y_est(k-1)';};
end

%nl122 - 5 termos
if(l == 1 && ny == 2 && nu == 2)
    reg1 = ones((m-2),1);
    reg2 = u_tx2(2:(m-1)); %u(k-1)
    reg3 = u_tx2(1:(m-2)); %u(k-2)
    reg4 = y_tx2(2:(m-1)); %y(k-1)
    reg5 = y_tx2(1:(m-2)); %y(k-2)
    psi=[reg1 reg2 reg3 reg4 reg5];
    Regressores = {'1';'u_est(k-1)';'u_est(k-2)';'y_est(k-1)';'y_est(k-2)';};
end

%nl133 - 7 termos
if(l == 1 && ny == 3 && nu == 3)
    reg1 = ones((m-2),1);
    reg2 = u_tx2(3:(m-1)); %u(k-1)
    reg3 = u_tx2(2:(m-2)); %u(k-2)
    reg4 = u_tx2(1:(m-3)); %u(k-3)
    reg5 = y_tx2(3:(m-1)); %y(k-1)
    reg6 = y_tx2(2:(m-2)); %y(k-2)
    reg7 = y_tx2(1:(m-3)); %y(k-3)
    psi=[reg1 reg2 reg3 reg4 reg5 reg6 reg7];
    Regressores = {'1';'u_est(k-1)';'u_est(k-2)'; 'u_est(k-3)';'y_est(k-1)';'y_est(k-2)';'y_est(k-3)'};
end

%nl211 - 6 termos
if(l == 2 && ny == 1 && nu == 1)
    reg1=ones((m-1),1);
    reg2=u_tx2(1:(m-1)); %u(k-1)
    reg3=y_tx2(1:(m-1)); %y(k-1)
    reg4=reg2.^2; % u(k-1).^2
    reg5=reg2.*reg3; % y(k-1)*u(k-1)
    reg6=reg3.^2; % y(k-1).^2
    psi=[reg1 reg2 reg3 reg4 reg5 reg6];
    Regressores = {'1';'u_est(k-1)';'y_est(k-1)';'u_est(k-1)^2';'u_est(k-1)*y_est(k-1)';'y_est(k-1)^2'};
end

%nl222 - 15 termos
if(l == 2 && ny == 2 && nu == 2)
    reg1 = ones((m-2),1);
    reg2 = u_tx2(2:(m-1)); %u(k-1)
    reg3 = u_tx2(1:(m-2)); %u(k-2)
    reg4 = y_tx2(2:(m-1)); %y(k-1)
    reg5 = y_tx2(1:(m-2)); %y(k-2)
    
    reg6 = reg2.^2;        %u(k-1)^2
    reg7 = reg2.*reg3;     %u(k-1)*u(k-2)
    reg8 = reg3.^2;        %u(k-2)^2
    
    reg9 = reg4.*reg2;     %y(k-1)*u(k-1)
    reg10= reg4.*reg3;     %y(k-1)*u(k-2)
    reg11= reg5.*reg2;     %y(k-2)*u(k-1)
    reg12= reg5.*reg3;     %y(k-2)*u(k-2)
   
    reg13= reg4.*reg4;     %y(k-1)^2;
    reg14= reg4.*reg5;     %y(k-1)*y(k-2)
    reg15= reg5.*reg5;     %y(k-2)^2; 
    
    psi=[reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 reg10];
    psi=[psi reg11 reg12 reg13 reg14 reg15];
    
    Regressores = {'1';'u_est(k-1)'; 'u_est(k-2)'; 'y_est(k-1)'; 'y_est(k-1)'; ...
                   'u_est(k-1)^2';'u_est(k-1)*u_est(k-2)';'u_est(k-2)^2'; ...
                   'y_est(k-1)*u_est(k-1)'; 'y_est(k-1)*u_est(k-2)'; ...
                   'y_est(k-2)*u_est(k-1)'; 'y_est(k-2)*u_est(k-2)'; ...
                   'y_est(k-1)^2'; 'y_est(k-1)*y_est(k-2)'; ...
                   'y_est(k-2)^2'};
    
end

%nl311 - 10 termos
if(l == 3 && ny == 1 && nu == 1)
    reg1=ones((m-1),1);
    reg2=u_tx2(1:(m-1)); %u(k-1)
    reg3=y_tx2(1:(m-1)); %y(k-1)
    
    reg4=reg2.^2; % u(k-1)^2
    reg5=reg2.*reg3; % y(k-1)*u(k-1)
    reg6=reg3.^2; % y(k-1)^2
    
    reg7=reg2.^3; % u(k-1)^3
    reg8=reg2.*reg4; %u(k-1)^2*y(k-1)
    reg9=reg2.*reg6; %u(k-1)*y(k-1)^2
    reg10=reg3.^3; %y(k-1)^3
    
    psi=[reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 reg10];
    
    Regressores = {'1';'u_est(k-1)'; 'y_est(k-1)'; ...
               'u_est(k-1)^2'; ...
               'y_est(k-1)*u_est(k-1)'; ... 
               'y_est(k-1)^2'; ...
               'u_est(k-1)^3'; ...
               'y_est(k-1)^2*u_est(k-1)'; ... 
               'y_est(k-1)^2*u_est(k-1)'; ...
               'y_est(k-1)^3';};
end

%nl322 - 35 termos
if(l == 3 && ny == 2 && nu == 2)
    % Montar matriz de regressores
    reg1 = ones((m-2),1);
    reg2 = u_tx2(2:(m-1));   % u(k-1)
    reg3 = u_tx2(1:(m-2));   % u(k-2)
    reg4 = y_tx2(2:(m-1));   % y(k-1)
    reg5 = y_tx2(1:(m-2));   % y(k-2)
    
    reg6 = reg2.^2;          % u(k-1).^2
    reg7 = reg2.*reg3;       % u(k-1)*u(k-2)
    reg8 = reg3.^2;          % u(k-2).^2 
    
    reg9 = reg4.*reg2;       % y(k-1)*u(k-1)
    reg10= reg4.*reg3;       % y(k-1)*u(k-2)
    reg11= reg5.*reg2;       % y(k-2)*u(k-1)
    reg12= reg5.*reg3;       % y(k-2)*u(k-2)
    
    reg13= reg4.^2;          % y(k-1).^2
    reg14= reg4.*reg5;       % y(k-1)*y(k-2)
    reg15= reg5.^2;          % y(k-2).^2
    
    reg16= reg6.*reg2;       % u(k-1).^3
    reg17= reg6.*reg3;       % u(k-1).^2*u(k-2)
    reg18= reg2.*reg8;       % u(k-1)*u(k-2).^2
    reg19= reg3.^3;          % u(k-2).^3
    
    reg20= reg4.*reg6;       % y(k-1)*u(k-1).^2
    reg21= reg4.*reg7;       % y(k-1)*u(k-1)*u(k-2)
    reg22= reg4.*reg8;       % y(k-1)*u(k-2).^2
    
    reg23= reg5.*reg6;       % y(k-2)*u(k-1).^2
    reg24= reg5.*reg7;       % y(k-2)*u(k-1)*u(k-2)
    reg25= reg5.*reg6;       % y(k-2)*u(k-2).^2
    
    reg26= reg13.*reg2;       % y(k-1).^2*u(k-1)
    reg27= reg13.*reg3;       % y(k-1).^2*u(k-2)
    reg28= reg14.*reg2;       % y(k-1)*y(k-2)*u(k-1)
    reg29= reg14.*reg3;       % y(k-1)*y(k-2)*u(k-2)
    
    reg30= reg15.*reg2;      % y(k-2).^2*u(k-1)
    reg31= reg15.*reg3;      % y(k-2).^2*u(k-2)
    reg32= reg4.^3;          % y(k-1).^3
    reg33= reg13.*reg5;      % y(k-1).^2*y(k-2)    
    reg34= reg4.*reg15;      % y(k-1)*y(k-1).^2
    reg35= reg5.^3;          % y(k-2)^3
    
    psi=[reg1 reg2  reg3  reg4  reg5  reg6  reg7  reg8  reg9 reg10 reg11 reg12];
    psi=[psi reg13 reg14 reg15 reg16 reg17 reg18 reg19 reg20 reg21 reg22];
    psi=[psi reg23 reg24 reg25 reg26 reg27 reg28 reg29 reg30 reg31 reg32];
    psi=[psi reg33 reg34 reg35];
   
    
    Regressores = { '1'; 'u_est(k-1)'; 'u_est(k-2)'; 'y_est(k-1)'; 'y_est(k-1)'; ...               
                    'u_est(k-1)^2'; ... 
                    'u_est(k-1)*u_est(k-2)'; ... 
                    'u_est(k-2)^2'; ...
                    'y_est(k-1)*u_est(k-1)'; ... 
                    'y_est(k-1)*u_est(k-2)'; ...
                    'y_est(k-2)*u_est(k-1)'; ...
                    'y_est(k-2)*u_est(k-2)'; ...                
                    'y_est(k-1)^2'; ... 
                    'y_est(k-1)*y_est(k-2)'; ...
                    'y_est(k-2)^2'; ...               
                    'u_est(k-1)^3'; ...
                    'u_est(k-1)^2*u_est(k-2)'; ...
                    'u_est(k-1)*u_est(k-2)^2'; ...
                    'u_est(k-2)^3'; ...                              
                    'y_est(k-1)*u_est(k-1)^2'; ... 
                    'y_est(k-1)*u_est(k-1)*u_est(k-2)'; ...
                    'y_est(k-1)*u_est(k-2)^2'; ...               
                    'y_est(k-2)*u_est(k-1)^2'; ...
                    'y_est(k-2)*u_est(k-1)*u_est(k-2)'; ...
                    'y_est(k-2)*u_est(k-2)^2'; ...               
                    'y_est(k-1)^2*u_est(k-1)'; ...               
                    'y_est(k-1)^2*u_est(k-2)'; ...              
                    'y_est(k-1)*y_est(k-2)*u_est(k-1)'; ...
                    'y_est(k-1)*y_est(k-2)*u_est(k-2)'; ...
                    'y_est(k-2)^2*u_est(k-1)'; ...
                    'y_est(k-2)^2*u_est(k-2)'; ...
                    'y_est(k-1)^3'; ...
                    'y_est(k-1)^2*y_est(k-2)'; ...
                    'y_est(k-1)*y_est(k-1)^2'; ...
                    'y_est(k-2)^3';};
               
end

%nl333 - 84 termos
if(l == 3 && ny == 3 && nu == 3)
    
    % Montar matriz de regressores
    reg1=ones((m-3),1); % constante
    reg2=u_tx2(3:(m-1)); % u(k-1)
    reg3=u_tx2(2:(m-2)); % u(k-2)
    reg4=u_tx2(1:(m-3)); % u(k-3)
    reg5=y_tx2(3:(m-1)); % y(k-1)
    reg6=y_tx2(2:(m-2)); % y(k-2)
    reg7=y_tx2(1:(m-3)); % y(k-3)
    reg8=reg2.^2; % u(k-1).^2
    reg9=reg2.*reg3; % u(k-1)*u(k-2)
    reg10=reg2.*reg4; % u(k-1)*u(k-3)
    reg11=reg3.^2; % u(k-2).^2
    reg12=reg3.*reg4; % u(k-2)*u(k-3)
    reg13=reg4.^2; % u(k-3).^2
    reg14=reg5.*reg2; % y(k-1)*u(k-1)
    reg15=reg5.*reg3; % y(k-1)*u(k-2)
    reg16=reg5.*reg4; % y(k-1)*u(k-3)
    reg17=reg6.*reg2; % y(k-2)*u(k-1)
    reg18=reg6.*reg3; % y(k-2)*u(k-2)
    reg19=reg6.*reg4; % y(k-2)*u(k-3)
    reg20=reg7.*reg2; % y(k-3)*u(k-1)
    reg21=reg7.*reg3; % y(k-3)*u(k-2)
    reg22=reg7.*reg4; % y(k-3)*u(k-3)
    reg23=reg5.^2; % y(k-1).^2
    reg24=reg5.*reg6; % y(k-1)*y(k-2)
    reg25=reg5.*reg7; % y(k-1)*y(k-3)
    reg26=reg6.^2; % y(k-2).^2
    reg27=reg6.*reg7; % y(k-2)*y(k-3)
    reg28=reg7.^3; % y(k-3).^2
    reg29=reg2.^2; % u(k-1).^3
    reg30=(reg2.^2).*reg3; % u(k-1).^2*u(k-2)
    reg31=(reg2.^2).*reg4; % u(k-1).^2*u(k-3)
    reg32=reg2.*reg3.^2; % u(k-1)*u(k-2).^2
    reg33=reg2.*reg3.*reg4; % u(k-1)*u(k-2)*u(k-3)
    reg34=reg2.*reg4.^2; % u(k-1)*u(k-3).^2
    reg35=reg3.^3; % u(k-2).^3
    reg36=(reg3.^2).*reg4; % u(k-2).^2*u(k-3)
    reg37=reg3.*reg4.^2; % u(k-2)*u(k-3).^2
    reg38=reg4.^3; % u(k-3).^3
    reg39=reg5.*reg2.^2; % y(k-1)*u(k-1).^2
    reg40=reg5.*reg2.*reg3; % y(k-1)*u(k-1)*u(k-2)
    reg41=reg5.*reg2.*reg4; % y(k-1)*u(k-1)*u(k-3)
    reg42=reg5.*reg3.^2; % y(k-1)*u(k-2).^2
    reg43=reg5.*reg3.*reg4; % y(k-1)*u(k-2)*u(k-3)
    reg44=reg5.*reg4.^2; % y(k-1)*u(k-3).^2
    reg45=reg6.*reg2.^2; % y(k-2)*u(k-1).^2
    reg46=reg6.*reg2.*reg3; % y(k-2)*u(k-1)*u(k-2)
    reg47=reg6.*reg2.*reg4; % y(k-2)*u(k-1)*u(k-3)
    reg48=reg6.*reg3.^2; % y(k-2)*u(k-2).^2
    reg49=reg6.*reg3.*reg4; % y(k-2)*u(k-2)*u(k-3)
    reg50=reg6.*reg4.^2; % y(k-2)*u(k-3).^2
    reg51=reg7.*reg2.^2; % y(k-3)*u(k-1).^2
    reg52=reg7.*reg2.*reg3; % y(k-3)*u(k-1)*u(k-2)
    reg53=reg7.*reg2.*reg4; % y(k-3)*u(k-1)*u(k-3)
    reg54=reg7.*reg3.^2; % y(k-3)*u(k-2).^2
    reg55=reg7.*reg3.*reg4; % y(k-3)*u(k-2)*u(k-3)
    reg56=reg7.*reg4.^2; % y(k-3)*u(k-3).^2
    reg57=(reg5.^2).*reg2; % y(k-1).^2*u(k-1)
    reg58=(reg5.^2).*reg3; % y(k-1).^2*u(k-2)
    reg59=(reg5.^2).*reg4; % y(k-1).^2*u(k-3)
    reg60=reg5.*reg6.*reg2; % y(k-1)*y(k-2)*u(k-1)
    reg61=reg5.*reg6.*reg3; % y(k-1)*y(k-2)*u(k-2)
    reg62=reg5.*reg6.*reg4; % y(k-1)*y(k-2)*u(k-3)
    reg63=reg5.*reg7.*reg2; % y(k-1)*y(k-3)*u(k-1)
    reg64=reg5.*reg7.*reg3; % y(k-1)*y(k-3)*u(k-2)
    reg65=reg5.*reg7.*reg4; % y(k-1)*y(k-3)*u(k-3)
    reg66=(reg6.^2).*reg2; % y(k-2).^2*u(k-1)
    reg67=(reg6.^2).*reg3; % y(k-2).^2*u(k-2)
    reg68=(reg6.^2).*reg4; % y(k-2).^2*u(k-3)
    reg69=reg6.*reg7.*reg2; % y(k-2)*y(k-3)*u(k-1)
    reg70=reg6.*reg7.*reg3; % y(k-2)*y(k-3)*u(k-2)
    reg71=reg6.*reg7.*reg4; % y(k-2)*y(k-3)*u(k-3)
    reg72=(reg7.^2).*reg2; % y(k-3).^2*u(k-1)
    reg73=(reg7.^2).*reg3; % y(k-3).^2*u(k-2)
    reg74=(reg7.^2).*reg4; % y(k-3).^2*u(k-3)
    reg75=(reg5.^3); % y(k-1).^3
    reg76=(reg5.^2).*reg6; % y(k-1).^2*y(k-2)
    reg77=(reg5.^2).*reg7; % y(k-1).^2*y(k-3)
    reg78=reg5.*reg6.^2; % y(k-1)*y(k-2).^2
    reg79=reg5.*reg6.*reg7; % y(k-1)*y(k-2)*y(k-3)
    reg80=reg5.*reg7.^2; % y(k-1)*y(k-3).^2
    reg81=reg6.^3; % y(k-2).^3
    reg82=(reg6.^2).*reg7; % y(k-2).^2*y(k-3)
    reg83=reg6.*reg7.^2; % y(k-2)*y(k-3).^2
    reg84=reg7.^3; % y(k-3).^3

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Determinação da Estrutura %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    psi=[reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 reg10 reg11 reg12 reg13];
    psi=[psi reg14 reg15 reg16 reg17 reg18 reg19 reg20 reg21 reg22 reg23 reg24 reg25];
    psi=[psi reg26 reg27 reg28 reg29 reg30 reg31 reg32 reg33 reg34 reg35 reg36 reg37];
    psi=[psi reg38 reg39 reg40 reg41 reg42 reg43 reg44 reg45 reg46 reg47 reg48 reg49];
    psi=[psi reg50 reg51 reg52 reg53 reg54 reg55 reg56 reg57 reg58 reg59 reg60 reg61];
    psi=[psi reg62 reg63 reg64 reg65 reg66 reg67 reg68 reg69 reg70 reg71 reg72 reg73];
    psi=[psi reg74 reg75 reg76 reg77 reg78 reg79 reg80 reg81 reg82 reg83 reg84];
    
    
        Regressores = {'1'; 'u(k-1)'; 'u(k-2)'; ...
    'u(k-3)'; 'y(k-1)'; 'y(k-2)'; 'y(k-3)'; 'u(k-1)^2'; ...
    'u(k-1)*u(k-2)'; 'u(k-1)*u(k-3)'; 'u(k-2).^2'; ...
    'u(k-2)*u(k-3)'; 'u(k-3).^2'; ...
    'y(k-1)*u(k-1)'; ...
    'y(k-1)*u(k-2)'; ...
    'y(k-1)*u(k-3)'; ...
    'y(k-2)*u(k-1)'; ...
    'y(k-2)*u(k-2)'; ...
    'y(k-2)*u(k-3)'; ...
    'y(k-3)*u(k-1)'; ...
    'y(k-3)*u(k-2)'; ...
    'y(k-3)*u(k-3)'; ...
    'y(k-1).^2'; ...
    'y(k-1)*y(k-2)'; ...
    'y(k-1)*y(k-3)'; ...
    'y(k-2).^2'; ...
    'y(k-2)*y(k-3)'; ...
    'y(k-3).^2'; ...
    'u(k-1).^3'; ...
    'u(k-1).^2*u(k-2)'; ...
    'u(k-1).^2*u(k-3)'; ...
    'u(k-1)*u(k-2).^2'; ...
    'u(k-1)*u(k-2)*u(k-3)'; ...
    'u(k-1)*u(k-3).^2'; ...
    'u(k-2).^3'; ...
    'u(k-2).^2*u(k-3)'; ...
    'u(k-2)*u(k-3).^2'; ...
    'u(k-3).^3'; ...
    'y(k-1)*u(k-1).^2'; ...
    'y(k-1)*u(k-1)*u(k-2)'; ...
    'y(k-1)*u(k-1)*u(k-3)'; ...
    'y(k-1)*u(k-2).^2'; ...
    'y(k-1)*u(k-2)*u(k-3)'; ...
    'y(k-1)*u(k-3).^2'; ...
    'y(k-2)*u(k-1).^2'; ...
    'y(k-2)*u(k-1)*u(k-2)'; ...
    'y(k-2)*u(k-1)*u(k-3)'; ...
    'y(k-2)*u(k-2).^2'; ...
    'y(k-2)*u(k-2)*u(k-3)'; ...
    'y(k-2)*u(k-3).^2'; ...
    'y(k-3)*u(k-1).^2'; ...
    'y(k-3)*u(k-1)*u(k-2)'; ...
    'y(k-3)*u(k-1)*u(k-3)'; ...
    'y(k-3)*u(k-2).^2'; ...
    '% y(k-3)*u(k-2)*u(k-3)'; ...
    'y(k-3)*u(k-3).^2'; ...
    'y(k-1).^2*u(k-1)'; ...
    'y(k-1).^2*u(k-2)'; ...
    'y(k-1).^2*u(k-3)'; ...
    'y(k-1)*y(k-2)*u(k-1)'; ...
    'y(k-1)*y(k-2)*u(k-2)'; ...
    'y(k-1)*y(k-2)*u(k-3)'; ...
    'y(k-1)*y(k-3)*u(k-1)'; ...
    'y(k-1)*y(k-3)*u(k-2)'; ...
    'y(k-1)*y(k-3)*u(k-3)'; ...
    'y(k-2).^2*u(k-1)'; ...
    'y(k-2).^2*u(k-2)'; ...
    'y(k-2).^2*u(k-3)'; ...
    'y(k-2)*y(k-3)*u(k-1)'; ...
    'y(k-2)*y(k-3)*u(k-2)'; ...
    'y(k-2)*y(k-3)*u(k-3)'; ...
    'y(k-3).^2*u(k-1)'; ...
    'y(k-3).^2*u(k-2)'; ...
    'y(k-3).^2*u(k-3)'; ...
    'y(k-1).^3'; ...
    'y(k-1).^2*y(k-2)'; ...
    'y(k-1).^2*y(k-3)'; ...
    'y(k-1)*y(k-2).^2'; ...
    'y(k-1)*y(k-2)*y(k-3)'; ...
    'y(k-1)*y(k-3).^2'; ...
    'y(k-2).^3'; ...
    'y(k-2).^2*y(k-3)'; ...
    'y(k-2)*y(k-3).^2'; ...
    'y(k-3).^3'};
end