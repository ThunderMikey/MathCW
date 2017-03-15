vin_step = @(t) 5 * heaviside(t); %input for step signal

range = 0.2; %setting max of range
h = 0.0001; % setting step size

N = range / h; %setting size of array

out_step = zeros(N, 2); %set up arrays
out_step(1,:) = [500*10^-9 0]; %initialising arrays 

R = 280; %setting given value of resistance
C = 4*10^-6; %setting given value of capacitance
L = 0.6; %setting given value of inductance
vin = vin_step; %setting vin for first test

%coupled equations
funcq = @(t,x, y) y; 
funcqp = @(t,y,yp) (vin(t)-R*yp-y/C)/L;

t = 0: h: range - h; %going from t = 0 to just 1 step below the range

for i = 2: N %starting from 2 as values at 1 already initialised, matlab starts from index 1
    
    %calling RK4second.m
    [out_step(i,1), out_step(i, 2)] = RK4second(t(i), out_step(i-1,1), out_step(i-1, 2), funcq, funcqp, h); 
end

out_step(:,2) = out_step(:,2) *R;


% producing the figure for the step signal test

figure;
plot(t, out_step(:,2), '-ok');
hold on;
fplot(vin_step, [0 range], '-or');
hold off;
grid;
title('Step Signal');
xlabel('Time [s]');
ylabel('Output Voltage [V]');
lgd = legend('Output Voltage', 'Step Signal');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
legend('boxoff');

vin_decay = @(t) 5 * exp(-((t^2)/(3*10^-6))); %input for impulsive signal with decay, exp function built in matlab
out_decay = zeros(N, 2); %set up arrays
out_decay(1,:) = [500*10^-9 0]; %initialising arrays 

vin = vin_decay; %setting vin for impulsive signal test


%coupled equations
funcqdecay = @(t, x, y) y;
funcqpdecay = @(t,y,yp) (vin(t)-R*yp-y/C)/L;
for i = 2: N
  
    [out_decay(i,1), out_decay(i, 2)] = RK4second(t(i), out_decay(i-1,1), out_decay(i-1, 2), funcqdecay, funcqpdecay, h);

end

out_decay(:,2) = out_decay(:,2) * R;

% producing the figure for the impulsive signal test

figure;
plot(t, out_decay(:,2), '-ok');
hold on;
fplot(vin_decay, [0 range], '-or');
hold off
grid;
title('Impulsive Signal with Decay');
xlabel('Time [s]');
ylabel('Output Voltage [V]');
lgd = legend('Output Voltage', 'Impulsive Signal');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
legend('boxoff');
 
vin_5square = @(t) 5 * square(2*pi*t*5); %input for square wave with 5 Hz , square function built in matlab
out_5square = zeros(N, 2); %set up arrays
out_5square(1,:) = [500*10^-9 0]; %initialising arrays 

vin = vin_5square; %setting vin for square signal test

%coupled equations
funcq5square = @(t, x, y) y;
funcqp5square = @(t,y,yp) (vin(t)-R*yp-y/C)/L;
for i = 2: N
  
    [out_5square(i,1), out_5square(i, 2)] = RK4second(t(i), out_5square(i-1,1), out_5square(i-1, 2), funcq5square, funcqp5square, h);

end

out_5square(:,2) = out_5square(:,2) * R;

% producing the figure for the square signal test(5Hz)

figure;
plot(t, out_5square(:,2), '-ok');
hold on;
fplot(vin_5square, [0 range], '-or');
hold off;
grid;
title('Square Wave 5 Hz');
xlabel('Time [s]');
ylabel('Output Voltage [V]');
lgd = legend('Output Voltage', 'Square Wave');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
legend('boxoff');

vin_110square = @(t) 5 * square(2*pi*t*110); %input for square wave with 110 Hz
out_110square = zeros(N, 2); %set up arrays
out_110square(1,:) = [500*10^-9 0]; %initialising arrays 


vin = vin_110square;  %setting vin for square signal test

%coupled equations
funcq110square = @(t, x, y) y;
funcqp110square = @(t,y,yp) (vin(t)-R*yp-y/C)/L;
for i = 2: N
  
    [out_110square(i,1), out_110square(i, 2)] = RK4second(t(i), out_110square(i-1,1), out_110square(i-1, 2), funcq110square, funcqp110square, h);

end

out_110square(:,2) = out_110square(:,2) * R;

% producing the figure for the square signal test(110 Hz)

figure;
plot(t, out_110square(:,2), '-ok');
hold on;
fplot(vin_110square, [0 range], '-or');
hold off;
grid;
title('Square Wave 110 Hz');
xlabel('Time [s]');
ylabel('Output Voltage [V]');
lgd = legend('Output Voltage', 'Square Wave');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
legend('boxoff');

vin_500square = @(t) 5 * square(2*pi*t*500); %input for square wave with 500 Hz
out_500square = zeros(N, 2); %set up arrays
out_500square(1,:) = [500*10^-9 0]; %initialising arrays 

vin = vin_500square;  %setting vin for square signal test

%coupled equations
funcq1 = @(t, x, y) y;
funcqp1 = @(t,y,yp) (vin(t)-R*yp-y/C)/L;
for i = 2: N
  
    [out_500square(i,1), out_500square(i, 2)] = RK4second(t(i), out_500square(i-1,1), out_500square(i-1, 2), funcq1, funcqp1, h);

end

out_500square(:,2) = out_500square(:,2) * R;


% producing the figure for the square signal test(500Hz)

figure;
plot(t, out_500square(:,2), '-ok');
hold on;
fplot(vin_500square, [0 range], '-or');
hold off;
grid;
title('Square Wave 500 Hz');
xlabel('Time [s]');
ylabel('Output Voltage [V]');
lgd = legend('Output Voltage', 'Square Wave');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
legend('boxoff');

vin_5sin = @(t) 5 * sin(2*pi*t*5); %input for sine wave with 5Hz, sine function built in matlab
out_5sin = zeros(N, 2); %set up arrays
out_5sin(1,:) = [500*10^-9 0]; %initialising arrays 


vin = vin_5sin;  %setting vin for sine wave test

%coupled equations
funcq5sin = @(t, x, y) y;
funcqp5sin = @(t,y,yp) (vin(t)-R*yp-y/C)/L;
for i = 2: N
  
    [out_5sin(i,1), out_5sin(i, 2)] = RK4second(t(i), out_5sin(i-1,1), out_5sin(i-1, 2), funcq5sin, funcqp5sin, h);

end

out_5sin(:,2) = out_5sin(:,2) * R;

% producing the figure for the sine wave test(5Hz)

figure;
plot(t, out_5sin(:,2), '-ok');
hold on;
fplot(vin_5sin, [0 range], '-or');
hold off;
grid;
title('Sine Wave 5 Hz');
xlabel('Time [s]');
ylabel('Output Voltage [V]');
lgd = legend('Output Voltage', 'Sine Wave');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
legend('boxoff');

vin_110sin = @(t) 5 * sin(2*pi*t*110); %input for sine wave with 110Hz
out_110sin = zeros(N, 2); %set up arrays
out_110sin(1,:) = [500*10^-9 0]; %initialising arrays 


vin = vin_110sin; %setting vin for sine wave test

%coupled equations
funcq110sin = @(t, x, y) y;
funcqp110sin = @(t,y,yp) (vin(t)-R*yp-y/C)/L;
for i = 2: N
  
    [out_110sin(i,1), out_110sin(i, 2)] = RK4second(t(i), out_110sin(i-1,1), out_110sin(i-1, 2), funcq110sin, funcqp110sin, h);

end

out_110sin(:,2) = out_110sin(:,2) * R;

% producing the figure for the sine wave test(110Hz)

figure;
plot(t, out_110sin(:,2), '-ok');
hold on;
fplot(vin_110sin, [0 range], '-or');
hold off;
grid;
title('Sine Wave 110 Hz');
xlabel('Time [s]');
ylabel('Output Voltage [V]');
lgd = legend('Output Voltage', 'Sine Wave');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
legend('boxoff');

vin_500sin = @(t) 5 * sin(2*pi*t*500); %input for sine wave with 500Hz
out_500sin = zeros(N, 2); %set up arrays
out_500sin(1,:) = [500*10^-9 0]; %initialising arrays 


vin = vin_500sin; %setting vin for sine wave test

%coupled equations
funcq500sin = @(t, x, y) y;
funcqp500sin = @(t,y,yp) (vin(t)-R*yp-y/C)/L;
for i = 2: N
  
    [out_500sin(i,1), out_500sin(i, 2)] = RK4second(t(i), out_500sin(i-1,1), out_500sin(i-1, 2), funcq500sin, funcqp500sin, h);

end

out_500sin(:,2) = out_500sin(:,2) * R;

% producing the figure for the sine wave test(500Hz)

figure;
plot(t, out_500sin(:,2), '-ok');
hold on;
fplot(vin_500sin, [0 range], '-or');
hold off;
grid;
title('Sine Wave 500 Hz');
xlabel('Time [s]');
ylabel('Output Voltage [V]');
lgd = legend('Output Voltage', 'Sine Wave');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
legend('boxoff');

