close all
clc

t0=0; % t start
tfinal=1; %t final
i0=0;
step=1000; %number of steps
R=0.5; %R = 0.5 Ohm
L=0.0015; %I = 1.5mH

tao = 0.000160;

Vin = @(t) 3.5*exp(-t.^2/tao); %exp signal
    f = @(t,i) (Vin(t)-R*(i))/L; %equation given in question
    [T,IOut] = heun(f, t0, tfinal, i0, step); %call the function

Vout = zeros(1, step+1); %initialise Vout to 0
    for j=1:step
        Vout(j) = Vin(T(j)) - R*IOut(j); %use iteration to get Vout
    end
    
    figure %plot the graph
    plot(T, Vout , 'r');%plot t vs Vout in red colour
    hold on;
    plot(T, Vin(T), 'g');%plot t vs Vin in green colour
    plot(T, IOut, 'b');%plot t vs Iout in blue colour
    
    legend('Vout(V)', 'Vin(V)', 'IOut(A)') %label 3 lines
    title('Heun Exp->t^2')%title
    xlabel('Time /s')%set x,y-axis
    ylabel('Amp')
    