
function heun_script(period)
close all
clc

t0=0; % t start
tfinal=1; %t final
i0=0;
steps=100000; %number of steps
R=0.5; %R = 0.5 Ohm
L=0.0015; %I = 1.5mH

Vin = @(t) 4.5*heaviside(t); %step signal
    f = @(t,i) (Vin(t)-R*(i))/L; %Function in
    [T,IOut] = heun(f, t0, tfinal, i0, steps); %function call

Vout = zeros(1, steps+1); 
    for j=1:steps
        Vout(j) = Vin(T(j)) - R*IOut(j); %Create Vout array from Iout, R and Vin
    end
    
    figure %plot graphs
    plot(T, Vout , 'r');
    hold on;
    plot(T, Vin(T), 'g');
    plot(T, IOut, 'b');
    
    legend('Vout(V)', 'Vin(V)', 'IOut(A)') %label
    title('Heun Step Signal')%set title
    xlabel('Time (/s)')%set y,x-axis
    ylabel('Amp')
end
    