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
 