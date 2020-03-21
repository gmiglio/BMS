

% Script de autocorrelacao da função
xi = y_est - y_tx2;
u  = u_tx2;

% figure;
% subplot(211);
% autocorr(xi);
% 
% subplot(212);
% [ac, lags, CB] = parcorr(xi, 50);
% plot(lags, ac, '-k', lags, CB(1)*ones(size(lags)), '--b', lags, CB(2)*ones(size(lags)), '--b', 'LineWidth', 2);
% set(gca, 'FontSize', 14);
% title('Teste de Validação - r_{\xi}');
% xlabel('Atraso','FontWeight','bold');

r = zeros(100,1);
N = length(xi);
for tau = 10:1:1000
    temp = xi(1:N-tau).*u(tau: N-1);
    [phi_uxi(:,tau), lags, CB] = crosscorr(xi, temp);
    plot(lags, phi_uxi(:,tau));
end
