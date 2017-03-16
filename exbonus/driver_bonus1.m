clear;
init_condi=@(x)2*x.*(x<0.5)+(2-x).*(x>=0.5); %declare initial condition
boundry_left=@(x)0;						%declare left boundary condition
boundry_right=@(x)0;					%declare right boundary condition
k=0.00001;										%declare time interval
iterations=10;								%declare iterations in time
h=0.005;											%declare spatial interval
x0=0;													%declare left spatial boundary
xf=1;													%declare right spatial boundary
%declaration complete-------------------
N=round((xf-x0)/h);						%calculate number of segments in space
v=k/(h^2)       							%display v value, for stable output, v<0.5
distance=zeros(N+1, 1);				%initialize an array to store values for x-axis
for i=2:N+1
   distance(i)=x0+(i-1)*h;		%set values for x-axis
end
figure();
hold on;
for i=0:iterations
		%call finite_script function to solve the heat equation
		%pass inital, boundary conditions as function handles
    result=finite_script(k, i*1000, h,0,1,init_condi,boundry_left, boundry_right);
    plot(distance, result, '.');
end;
%generate title and axis labels
str=sprintf('1-D heat equation with tent initial conditions and constant boundary conditions, \n  %d iterations in time', iterations);
title(str);
xlabel('distance');
ylabel('temperature');
