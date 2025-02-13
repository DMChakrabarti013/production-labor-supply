N_bar = 24;
A = 2;
alpha = 0.33;
epsilon = 1.9;
sigma = 2;
Psi = 1;

numerator = Psi;
denominator = (1-alpha) * A^(1 - sigma);
exponent = alpha + sigma * (1 - alpha);

val = @(ne) N_bar - ((numerator / denominator) * ne.^exponent).^(1/epsilon);

a = 0;
b = 10000;
Tol = 1e-7;

tic
vals = solve_ne_bisection(val,a,b,Tol)
toc

tic
fsolveValue = fsolve(val, 24)
toc
