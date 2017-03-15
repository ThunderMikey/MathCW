%implement finite difference method
%v=k/(h^2) < 0.5 to ensure stability
%{
k: time interval
iterations: iterations in time
h: spatial interval
x0, xf: spatial range
init: function handle to initial condition
bcl: function handle to left boundary condition 
bcr: function handle to right boundary condition 
%}
function result=finite_script(k,iterations, h,x0,xf, init, bcl, bcr) 
N=round((xf-x0)/h);							%calculate number of segments in space
result=zeros(N+1, 1);           %initiate the result array
last_result=zeros(N+1, 1);			%initiate the array to store temp values
v=k/(h^2);											%coefficient used in iterative calculation
beta=1-2*v;											%coefficient used in iterative calculation
%put initial values in the array
last_result(1)=bcl(0);          %left boundary at time 0
last_result(N+1)=bcr(0);        %right boundary at time 0
for i=2:N
    last_result(i)=init(x0+h*(i-1));	%find initial states of all points according to the inital condition function
end
result=last_result;             %in case of zero iterations
for i=0:iterations
    result(1)=bcl(i*k);					%find left boundary condition at time i*k
    result(N+1)=bcr(i*k);				%find right boundary condition at time i*k
   for j=2:N
   		%iterate through the whole range to find the states at next time interval
			result(j)=v*last_result(j-1)+beta*last_result(j)+v*last_result(j+1);
   end
   last_result=result;					%store states in the result
end
return