clear all;clc

t = [0 1 3 4 6 7 9 10];
f = [8 6 5.5 1.5 1.1 1 0.9 0.9];
df = [-2 -0.35 -0.67 -0.6 -0.04 -0.08 0 0];

scatter(t,f,'r*');
hold on;

% Calculate the step
h = [];
for i = 1:length(t)-1
	h = [h t(i+1)-t(i)];
end

for j = 1:length(t)-1
    % Construct the b of a linear equation system Ax=b
    y(1) = f(j+1)-f(j)-df(j)*h(j);
    y(2) = df(j+1)-df(j);
    
    % Construct A for the remained coefficients
    A = [h(j)^2 h(j)^3; 2*h(j) 3*h(j)^2];
    
    % Solve the linear equation system
    w = A\y.';
    
    % Plot the interpolating polynomial on the interval [t_j, t_j+1]
    x = linspace(t(j),t(j+1),100);
    p = f(j) + df(j).*(x-t(j)) + w(1).*(x-t(j)).^2 + w(2).*(x-t(j)).^3;
    plot(x,p);
end

