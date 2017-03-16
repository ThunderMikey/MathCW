function [T,IOut] = heun(f, t0, tfinal, y, step)
h = (tfinal - t0)/step;%calculate step size
T = zeros(1,step+1);%initialise T and Iout to 0
IOut = zeros(1,step+1);
T(1) = t0;%assign t0 to T
IOut(1) = y;%assign y to t0
for j=1:step
  INext  = IOut(j) + h*feval(f,T(j),IOut(j));%get the value of next I
  T(j+1) = T(j) + h;%get the next value of next T
  IOut(j+1) = IOut(j) + 0.5*h*(feval(f,T(j),IOut(j)) + feval(f,T(j+1),INext));
  %calculate Next Iout using current Iout->Heun method;
end