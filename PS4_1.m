% parameters
N_bar = 24;
A = 2;
alpha = 0.33;
epsilon = 1.9;
sigma = 2;
Psi = 1;

% range of ne value (restricting 0)
ne_values = linspace(0, 24, 1000);

% computing g(ne) values
g_values = g(ne_values, N_bar, A, alpha, epsilon, sigma, Psi);

figure;
plot(ne_values, g_values, 'b-', 'LineWidth', 2);
hold on;
plot(ne_values, ne_values, 'r--', 'LineWidth',2);
xlabel('n_e');
ylabel('g(n_e)');
title('Plot of g(n_e) vs n_e with 45 Degree Line');
legend('g(n_e)', '45 Degree Line (y = n_e)', 'Location', 'Best');
grid on;
xlim([0, 24]);
ylim([0, 24]);
hold off;


% figure
% plot(ne_values, ne_values, ne_values, g_values)
% xlim([0, 24]);
% ylim([0, 24]);