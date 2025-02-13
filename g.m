function val = g(ne, N_bar, A, alpha, epsilon, sigma, Psi)

numerator = Psi;
denominator = (1-alpha) * A^(1 - sigma);
exponent = alpha + sigma * (1 - alpha);

val = N_bar - ((numerator / denominator) * ne.^exponent).^(1/epsilon);

end