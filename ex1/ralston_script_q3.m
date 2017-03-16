close all
clc

period = 0.0001000;%set period
t0=0; % t start
tf=4*period; %t final is 4 times greater than tfinal
i0=0;%initialise i0
steps=100; %number of steps
R=0.5; %R = 0.5 Ohm
L=0.0015; %I = 1.5mH

Vin = @(t) 4*sawtooth((t*2*pi)/period); %sawtooth signal
    f = @(t,i) (Vin(t)-R*(i))/L; %Function in the question
    [T,IOut] = ralston(f, t0, tf, i0, steps); %function call

Vout = zeros(1, steps+1); %initialise Vout = 0
    for j=1:steps
        Vout(j) = Vin(T(j)) - R*IOut(j); %Use iteration to get Vout
    end
    
figure %start to plot the graph
plot(T, Vout , 'r');%plot time T vs Vout in red colour
hold on;
plot(T, Vin(T), 'c');%plot time T vs Vout in cyan colour
plot(T, IOut, 'b');%plot time T vs Vout in blue colour
    
legend('Vout(V)', 'Vin(V)', 'IOut(A)')%label the graph
title('Ralston Sawtooth Period = 1000us')%set the title
xlabel('Time /s')%set x,y-axis and unit

    