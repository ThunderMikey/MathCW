close all
clc

t0=0; % t start
tfinal=1; %t final
i0=0;
steps=100000; %number of steps
R=0.5; %R = 0.5 Ohm
L=0.0015; %I = 1.5mH

tao = 0.000160;

Vin = @(t) 3.5*exp(-t./tao); %step signal
    f = @(t,i) (Vin(t)-R*(i))/L; %Function in
    [T,IOut] = ralston(f, t0, tfinal, i0, steps); %function call

Vout = zeros(1, steps+1); 
    for j=1:steps
        Vout(j) = Vin(T(j)) - R*IOut(j); %Get Vout
    end
    
    figure %plot graphs
    plot(T, Vout , 'r');
    hold on;
    plot(T, Vin(T), 'g');
    plot(T, IOut, 'b');
    
    legend('Vout(V)', 'Vin(V)', 'IOut(A)') %label
    title('Ralston Exp->t')%set title
    xlabel('Time /s')%set y,x-axis
    ylabel('Amp')
    