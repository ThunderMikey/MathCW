clc
t0=0; % t start
tfinal=1; %t final
i0=0;
steps=100000; %number of steps
R=0.5; %R = 0.5 Ohm
L=0.0015; %I = 1.5mH

Vin = @(t) 5.5*heaviside(t); %step the signal
    f = @(t,i) (Vin(t)-R*(i))/L; %Function given in the question
    [T,IOut] = midpoint(f, t0, tfinal, i0, steps); %call the function

Vout = zeros(1, steps+1); %initialise Vout
    for j=1:steps
        Vout(j) = Vin(T(j)) - R*IOut(j); %Use iteration to get Vout
    end
    
figure %start to plot the graph
plot(T, Vout , 'r'); %plot time T vs Vout in red colour
hold on;
plot(T, Vin(T), 'g'); %plot time T vs Vin in green
plot(T, IOut, 'b'); %plot time T vs Iout in red colour
    
legend('Vout(V)', 'Vin(V)', 'IOut(A)') %label the graph
title('Midpoint Step Signal')%set the title
xlabel('Time /s')%set y,x-axis and unit
ylabel('Amp')
    