function [T,IOut] = heun(f, t0, tfinal, y, step)
h = (tfinal - t0)/step;%use step to obtain step size
T = zeros(1,step+1);%initialise T and IOut
IOut = zeros(1,step+1);
T(1) = t0;%assign the initial value to T(1) and IOut(1)
IOut(1) = y;
for i=1:step
  INext  = IOut(i) + h*feval(f,T(i),IOut(i));%calculate value of the next I
  T(i+1) = T(i) + h;%calculcate the value of the next T
  IOut(i+1) = IOut(i) + 0.5*h*(feval(f,T(i),IOut(i)) + feval(f,T(i+1),INext));
  %use Heun Method-> y(j+1)=y(i)+1/2(h(f(x,y)+f(x+1,y+1)))
 
  
end