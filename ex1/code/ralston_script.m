close all
clc

t0=0; % t start
tfinal=1; %t final
i0=0;
step=1000; %number of steps
R=0.5; %R = 0.5 Ohm
L=0.0015; %I = 1.5mH

Vin = @(t) 5.5*heaviside(t); %step signal
    f = @(t,i) (Vin(t)-R*(i))/L; %Function in
    [T,IOut] = ralston(f, t0, tfinal, i0, step); %function call

Vout = zeros(1, step+1); %initialise the vout
    for j=1:step
        Vout(j) = Vin(T(j)) - R*IOut(j); %use iteration to get Vout from the equation
    end
    
figure %plot graphs
plot(T, Vout , 'r'); %plot time T vs Vout in red colour
hold on;
plot(T, Vin(T), 'g'); %plot time T vs Vout in green colour
plot(T, IOut, 'b'); %plot time T vs Vout in blue colour
    
legend('Vout(V)', 'Vin(V)', 'IOut(A)') %label
title('Ralston Step Signal')%set title
xlabel('Time /s')%set y,x-axis
ylabel('Amp')
    