function [T,IOut] = midpoint(f, t0, tfinal, y, steps)
h = (tfinal - t0)/steps; %use step to obtain step size
half_h = h/2; %calculate half of the step size
T = zeros(1,steps+1);%initialise T and IOut
IOut = zeros(1,steps+1); 
T(1) = t0;%assign the initial value to T(1) and IOut(1)
IOut(1) = y;
for j=1:steps
  INext  = IOut(j) + half_h*feval(f,T(j),IOut(j)); %calculate value of the next I
  T(j+1) = T(j) + h; %calculcate the value of the next T
  IOut(j+1) = IOut(j) + h*feval(f,T(j)+half_h, INext);
  %use Midpoint method
end