N_bar = 24;
A = 2;
alpha = 0.33;
epsilon = 1.9;
sigma = 2;

Psi1 = 1;
Psi2 = 3;

numerator1 = Psi1;
numerator2 = Psi2;
denominator = (1-alpha) * A^(1 - sigma);
exponent = alpha + sigma * (1 - alpha);

ne_function1 = @(ne) N_bar - ((numerator1 / denominator) * ne.^exponent).^(1/epsilon);
ne_function2 = @(ne) N_bar - ((numerator2 / denominator) * ne.^exponent).^(1/epsilon);

a = 0;
b = 10000;
Tol = 1e-7;

neVal1 = solve_ne_bisection(ne_function1,a,b,Tol)
neVal2 = solve_ne_bisection(ne_function2,a,b,Tol)

difference = neVal2 - neVal1

