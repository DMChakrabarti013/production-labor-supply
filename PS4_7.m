N_bar = 24;
A = 2;
alpha = 0.33;
epsilon = 1.9;
sigma = 2;
ne = 8;

denominator = ne^(alpha + sigma * (1-alpha));
numerator = (N_bar - ne)^(epsilon) * (1-alpha) * A^(1-sigma);

psi = numerator/denominator