function [T,IOut] = heun(f, t0, tfinal, y, steps)
h = (tfinal - t0)/steps;
T = zeros(1,steps+1);
IOut = zeros(1,steps+1);
T(1) = t0;
IOut(1) = y;
for j=1:steps
  INext  = IOut(j) + h*feval(f,T(j),IOut(j));
  T(j+1) = T(j) + h;
  IOut(j+1) = IOut(j) + 0.5*h*(feval(f,T(j),IOut(j)) + feval(f,T(j+1),INext));
 
  
end