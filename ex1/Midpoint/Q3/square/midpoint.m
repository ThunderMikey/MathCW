function [T,IOut] = midpoint(f, t0, tfinal, y, steps)
h = (tfinal - t0)/steps;
half_h = h/2;
T = zeros(1,steps+1);
IOut = zeros(1,steps+1);
T(1) = t0;
IOut(1) = y;
for j=1:steps
  INext  = IOut(j) + half_h*feval(f,T(j),IOut(j));
  T(j+1) = T(j) + h;
%   IOut(j+1) = IOut(j) + h*(feval(f,T(j),IOut(j)) + feval(f,T(j+1),INext));
  IOut(j+1) = IOut(j) + h*feval(f,T(j)+half_h, INext);
end