

% % Algoritmo do erro médio quadrático
% N = 20000;
% EMQ = zeros(N,1);
% EMQ = var(y_est - y_tx2)
% 
% EMQ = sum((y_est - y_tx2).^2)/N
% 
erro = y_est - y_tx2;
% var(erro)
% mean(erro)


xiu = xi(1:end-1, i).*u(1:end-1, i);
        [phi_xixi(:,i), lags, CB] = crosscorr(xi, xi);  
        phi_uxi(:,i) = crosscorr(u, xi); 
        [phi_xixiu(:,i), lags1, CB1] = crosscorr(xi(2:end),xiu); 
        figure
        title(['Validation Tests - trial ', num2str(i)])
        subplot(3,1,1)
        plot(lags, phi_xixi(:,i), '-k', lags, CB(1)*ones(size(lags)), '--b', lags, CB(2)*ones(size(lags)), '--b')
        ylabel('\Phi_{\xi\xi}')
        xlim([-maxLag maxLag])
        subplot(3,1,2)        
        plot(lags, phi_uxi(:,i), '-k', lags, CB(1)*ones(size(lags)),  '--b', lags, CB(2)*ones(size(lags)), '--b')
        ylabel('\Phi_{u\xi}')
        xlim([-maxLag maxLag])
        subplot(3,1,3)
        plot(lags1, phi_xixiu(:,i), '-k', lags1, CB1(1)*ones(size(lags1)), '--b', lags1, CB1(2)*ones(size(lags1)), '--b')
        ylabel('\Phi_{\xi(\xi u)}')
        xlim([0 maxLag])