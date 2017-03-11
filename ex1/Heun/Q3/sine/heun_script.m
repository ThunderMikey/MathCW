
%function heun_script(period)
close all
clc

period = 0.0001000;
t0=0; % t start
tfinal=4*period; %t final
i0=0;
steps=100; %number of steps
R=0.5; %R = 0.5 Ohm
L=0.0015; %I = 1.5mH

Vin = @(t) 4*sin((t*2*pi)/period); %Input voltage function
    f = @(t,i) (Vin(t)-R*(i))/L; %Function input for difference method
    [T,IOut] = heun(f, t0, tfinal, i0, steps); 

Vout = zeros(1, steps+1); 
    for j=1:steps
        Vout(j) = Vin(T(j)) - R*IOut(j); %Create Vout array from Iout, R and Vin
    end
    
figure %plot graphs
plot(T, Vout , 'r');
hold on;
plot(T, Vin(T), 'c');
plot(T, IOut, 'b');
    
legend('Vout(V)', 'Vin(V)', 'IOut(A)') %label
title('Heun Sine Period = 1000us')%set title
xlabel('Time /s')%set y,x-axis
ylabel('Amp')

    