%function heun_script(period)
clc
period = 0.00015;
t0=0; % t start
tfinal=4*period; %t final
i0=0;
steps=100; %number of steps
R=0.5; %R = 0.5 Ohm
L=0.0015; %I = 1.5mH

Vin = @(t) 6*cos((t*2*pi)/period); %Input voltage function
    f = @(t,i) (Vin(t)-R*(i))/L; %Function input for difference method
    [THeun,IOutHeun] = heun(f, t0, tfinal, i0, steps);
    [TMidpoint, IOutMidpoint] = Midpoint(f, t0, tfinal, i0, steps);
    [TRalston, IOutRalston] = ralston(f, t0, tfinal, i0, steps);
    
IOutExact = @(t) (1/(1+(period^2*R^2)/(4*pi^2*L^2)))*((((6*period)/(2*pi*L))*sin(2*pi*t/period))+(((6*period^2*R)/(4*pi^2*L^2))*cos(2*pi*t/period)));
    
ErrorHeun = IOutHeun - IOutExact(THeun);
ErrorMidpoint = IOutMidpoint - IOutExact(TMidpoint);
ErrorRalston = IOutRalston - IOutExact(TRalston);

figure %plot graphs
plot(THeun, ErrorHeun, 'b'); 
hold on;
plot(TMidpoint, ErrorMidpoint, 'r');
plot(TRalston, ErrorRalston, 'g');
legend('ErrorHeun', 'ErrorMidpoint', 'ErrorRalston') %label
title('Error Functions')%set title
xlabel('Time /s')%set y,x-axis
ylabel('Current/Amp')
%---------error analysis for Heun 
figure
loglog(THeun, abs(ErrorHeun), 'b');
hold on;
steps=500;
[THeun,IOutHeun] = heun(f, t0, tfinal, i0, steps);
ErrorHeun = IOutHeun - IOutExact(THeun);
loglog(THeun, abs(ErrorHeun), 'r');
steps=1000;
[THeun,IOutHeun] = heun(f, t0, tfinal, i0, steps);
ErrorHeun = IOutHeun - IOutExact(THeun);
loglog(THeun, abs(ErrorHeun), 'g');
legend('h=100', 'h=500', 'h=1000')
title('loglog ErrorHeun')
xlabel('log(Time/s)')
ylabel('|log(Current/Amp)|')
%---------error analysis for Midpoint 
figure
loglog(TMidpoint, abs(ErrorMidpoint), 'b');
hold on;
steps=500;
[TMidpoint,IOutMidpoint] = Midpoint(f, t0, tfinal, i0, steps);
ErrorMidpoint = IOutMidpoint - IOutExact(TMidpoint);
loglog(TMidpoint, abs(ErrorMidpoint), 'r');
steps=1000;
[TMidpoint,IOutMidpoint] = Midpoint(f, t0, tfinal, i0, steps);
ErrorMidpoint = IOutMidpoint - IOutExact(TMidpoint);
loglog(TMidpoint, abs(ErrorMidpoint), 'g');
legend('h=100', 'h=500', 'h=1000')
title('loglog ErrorMidpoint')
xlabel('log(Time/s)')
ylabel('|log(Current/Amp)|')
%---------error analysis for Ralston
figure
loglog(TRalston, abs(ErrorRalston), 'b');
hold on;
steps=500;
[TRalston,IOutRalston] = ralston(f, t0, tfinal, i0, steps);
ErrorRalston = IOutRalston - IOutExact(TRalston);
loglog(TRalston, abs(ErrorRalston), 'r');
steps=1000;
[TRalston,IOutRalston] = ralston(f, t0, tfinal, i0, steps);
ErrorRalston = IOutRalston - IOutExact(TRalston);
loglog(TRalston, abs(ErrorRalston), 'g');
legend('h=100', 'h=500', 'h=1000')
title('loglog ErrorRalston')
xlabel('log(Time/s)')
ylabel('|log(Current/Amp)|')    