%returning the next x and y values, taking in input initial time, x and y values and the two coupled equations along with the step size

function [x1, y1] = RK4second(t0, x0, y0, funcq, funcqp, h) 

x1 = x0;
y1 =y0; 

K_1 = h * funcq(y0); 
S_1 = h * funcqp(t0, x0, y0);
K_2 = h * funcq(y0 + (S_1)/3);
S_2 = h * funcqp(t0 + h/3, x0 + (K_1)/3, y0 + (S_1)/3);
K_3 = h * funcq(y0 - (S_1)/3 + S_2);
S_3 = h * funcqp(t0 + (2 * h)/3, x0 - (K_1)/3 + (K_2), y0 - (S_1)/3 + S_2);
K_4 = h * funcq(y0 + S_1 - S_2 + S_3);
S_4 = h * funcqp(t0 + h, x0 + K_1 - K_2 + K_3, y0 + S_1 - S_2 + S_3);

%similar to normal runge kutta but the two middle values have weighting of
%3/8  and outer ones have 1/8 as opposed to 1/6, 1/3, 1/3, 1/6
x1 = x1 + ((K_1 + 3 * K_2 + 3 * K_3 + K_4)/8);
y1 = y1 + ((S_1 + 3 * S_2 + 3 * S_3 + S_4)/8);
    
    