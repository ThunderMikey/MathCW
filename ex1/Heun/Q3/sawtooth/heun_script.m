%close all
clc

period = 0.000160;%set period
t0=0; % t start
tfinal=4*period; %t final
i0=0;%initial val of i0
step=100; %number of steps
R=0.5; %R = 0.5 OhmRF
L=0.0015; %I = 1.5mH

Vin = @(t) 4*sawtooth((t*2*pi)/period); %input sawtooth function
    f = @(t,i) (Vin(t)-R*(i))/L; %Function in the question
    [T,IOut] = heun(f, t0, tfinal, i0, step); %function call to get T and IOut

Vout = zeros(1, step+1); 
    for j=1:step
        Vout(j) = Vin(T(j)) - R*IOut(j); %Use iteration to get Vout
    end
    
figure  %start to plot the graph
%plot(T, Vout , 'r');%plot time T vs Vout in red colour
% hold on;
 plot(T, Vin(T), 'c');%plot time T vs Vout in green colour
% plot(T, IOut, 'b');%plot time T vs Vout in blue colour
%     
% legend('Vout(V)', 'Vin(V)', 'IOut(A)') %label the graph
% title('Heun Sawtooth Period = 160us')%set the title
% xlabel('Time /s')%set x,y-axis and unit
% ylabel('Amp')

    