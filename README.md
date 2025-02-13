# Production and Labor Supply
## Theoretical Framework
Consider an economy in which there is a worker with preferences
for leisure $l$ and a consumption good $c$ represente dby the utility function $U(c,l) = u(c) + v(l)$. The
consumption good is produced by a competitive firm that uses labor $n$ and has access to technology $y = f(n)$ where $y$ is the quantity of the consumption good. The firm is owned by the worker
and hires labor for a wage $w$ in a competitive labor market. The worker has $\overline{N}$ hours available, which she
allocates to labor and leisure activities such that $l + n = \overline{N}$. The problem of the worker is to choose how
much to consume c and how many hours to work $n_{s}$ in order to maxmize her utility subject to her budget
and time constraints, that is:
```math
\max_{c, n_{s}} = u(c) + v\left( \overline{N} - n_{s} \right) \text{ subject to } c \leq w n_{s} + \pi \text{ and } l + n = \overline{N}
```
where $\pi$ aree the profits made by the firm (owned by the worker) and all relative prices are expressed in
terms of the consumption good (i.e. the price of $c$ is 1 ). The problem of the firm is to choose how much
labor to hire $n_{d}$ in order to maximize its profits, taking the wage $w$ as given:
```math
\max_{n_{d}} f\left( n_{d} \right) - wn_{d}.
```
An equilibrium in this economy is allocations { $c, n_{s}, n_{d}$ } and a wage $w$ such that: (i) given $w$, the allocations solve $c$ and $n_{s}$ solve the worker's problem, (ii) given $w$, the allocation $n_{d}$ solves the firm's problem, (iii) the market for the consumption good clears $c=y$ and (iv) the market for labor clears $n_{s} = n_{d}$.

The first-order conditions of the Lagrangian associated with the worker’s problem are:
```math
u'(c) - \lambda = 0
```
```math
-v'\left( \overline{N} - n_{s} \right) + \lambda w = 0
```
where $\lambda$ is the Lagrange multiplier for the budget constraint. Rearranging the above equations and
assuming that the budget constraint binds, we get an equation for $n_{s}$:
```math
v'\left( \overline{N} - n_{s} \right) = u'\left( wn_{s} + \pi \right)w
```
as a function of the wage $w$ and the firm's profits $\pi$.

The first order condition of the firm's problem is:
```math
f'(n_{d}) - w = 0
```
which implies that wages equal the marginal product of labor $w = f'(n_{d})$ and profits are $\pi = f(n_{d}) - f'(n_{d}) n_{d}$. Plugging these into the equation for $n_{s}$ and using the market clearing condition for labor $n_{d} = n_{s} = n_{e}$ we get an equation for the equilibrium labor supply $n_{e}$:
```math
v'\left( \overline{N} - n_{e} \right) = u'(f(n_{e})) f'(n_{e}).
```
Assume that $f(n) = An^{1-\alpha}$, $u(c) = \frac{c^{1-\sigma}}{1-\sigma}$ and $v(l) = \Psi \frac{l^{1-\varepsilon}}{1-\varepsilon}$. Then their derivatives are $f'(n) = \left( 1-\alpha \right)An^{-\alpha}$, $u'(c) = c^{-\sigma}$ and $v'(l) = \Psi l^{-\varepsilon}$. Then, observe that $v'\left( \overline{N} - n_{e} \right) = \left( An^{1-\alpha} \right) (1-\alpha) An^{-\alpha}$, $\Psi \left( \overline{N} - n_{e} \right)^{-\varepsilon} = \left( 1-\alpha \right) A^{1-\sigma} n_{e}^{-\left[ \alpha + \sigma (1-\alpha) \right]}$ and $\left( \overline{N} - n_{e} \right)^{-\varepsilon} = \Psi^{-1} \left( 1-\alpha \right) A^{1-\sigma} n_{e}^{- \left[ \alpha + \sigma \left( 1-\alpha \right) \right]}$. Observe that
```math
n_{e}^{\alpha + \sigma \left( 1-\alpha \right)} = \frac{\Psi}{\left( 1-\alpha \right) A^{1-\sigma}} \left( \overline{N} - n_{e} \right)^{\varepsilon}.
```
Then,
```math
\left( \overline{N} - n_{e} \right)^{\varepsilon} = \frac{(1-\alpha) A^{1-\sigma}}{\Psi} n_{e}^{\alpha + \sigma} (1-\alpha) \implies n_{e} = \overline{N} - \left[ \frac{(1-\alpha) A^{1-\sigma}}{\Psi} n_{e}^{\alpha + \sigma} (1-\alpha)\right]^{1/\varepsilon}.
```
## Estimating $n_{e}$
We create a function $g\left( n_{e}, \overline{N}, A, \alpha, \varepsilon, \sigma, \Psi \right)$ that returns a value so that we have $n_{e} = g(n_{e}, \cdots)$. The following function is first used.
```matlab
function val = g(ne , N_bar , A, alpha , epsilon , sigma , Psi )

numerator = Psi;
denominator = (1- alpha ) * A^(1 - sigma );
exponent = alpha + sigma * (1 - alpha );

val = N_bar - (( numerator / denominator ) * ne .^ exponent ) .^(1/ epsilon );

end
```
This is a function iteration method that involves repeatedly applying the function $g$ to an initial guess $n_{e}(0)$ to generate a sequence $n_{e}(k+1) = g(n_{e}(k))$ to converge towards a true solution. For this method to converge, $g$ needs to continuous and differentiable at every point. Another criterion is contraction mapping: meaning that $\left| g'\left( n_{e}^{\star} \right) \right| <1$ where $n^\star_{e}$ is a fixed point. Finally, the initial guess
has to be sufficiently close to the true solution. The function $g$ is highly nonlinear because of the presence of exponents and roots. Furthermore, the computation
of $g'(n_{e})$ is complicated because of the presence of several variables. Lastly, the function iteration method may diverge or
oscillate indefinitely.


## Solving for $n_{e}$ using the bisection method
The following function is used to solve for $n_{e}$
```matlab
function x = solve_ne_bisection (f,a,b, Tol)

if sign (f(a)) == sign (f(b))
  x =0;
  disp (’[a,b] is not a bracketing interval ’)
else
  d = 0.5*(b-a);
  x = a+d;

  while 2*d > Tol
    d = 0.5* d;
    if sign (f(x)) == sign (f(a))
      x = x+d;
    else
      x = x-d;
    end
  end
end

end
```












