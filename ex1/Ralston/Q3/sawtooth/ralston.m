function [TIn, IOut] = ralston(f, t0, tf, i0, h)
    stepsize = (tf-t0)/h;
    TIn = zeros(1,h+1); 
    IOut = zeros(1,h+1); 
    TIn(1) = t0;
    IOut(1) = i0;
    t = t0; 
    i = i0;  
    for j=1:h 
        k1 = feval(f, t, i);
        k2 = feval(f, t + (0.75*stepsize), i + 0.75*stepsize*k1);
        i = i + stepsize*(1/3*k1 + 2/3*k2);
        TIn(j+1) = t; 
        IOut(j+1) = i; 
        t = t+stepsize;
    end
    
