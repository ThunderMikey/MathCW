function [T, IOut] = ralston(f, t0, tf, i0, h)
    stepsize = (tf-t0)/h;%calculate step size using number of step
    T = zeros(1,h+1); %initialise T and Iout
    IOut = zeros(1,h+1); 
    T(1) = t0;%assign t0 to T(1)
    IOut(1) = i0;%assign i0 to Iout(1)
    t = t0; %initial value of t and i
            %which will be use in the first iteration
    i = i0;  
    for j=1:h 
        INext = feval(f, t + (0.75*stepsize), i + 0.75*stepsize*feval(f, t, i));
        %calculate next Iout
        i = i + stepsize*(1/3*feval(f, t, i) + 2/3*INext);%calculate next i
        T(j+1) = t; %assign t to next T
        IOut(j+1) = i; %assign i to next I
        t = t+stepsize;%increament t by stepsize
    end
    
