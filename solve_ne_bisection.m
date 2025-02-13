function x = solve_ne_bisection(f,a,b,Tol)

if sign(f(a)) == sign(f(b))
    x=0;
    disp('[a,b] is not a bracketing interval')
else
    d = 0.5*(b-a);
    x = a+d;
    
    while 2*d > Tol
        d = 0.5*d;
        if sign(f(x)) == sign(f(a))
            x = x+d;
        else
            x = x-d;
        end
    end
end

end