% Pick sample points
t = linspace(-1,1,21);
y = 1./(1+25.*t.^2);

% Calculate the interpolating polynomal
x = linspace(-1,1,200);
y1 = [];
for i = 1:length(x)
    y1 = [y1 L(t,y,x(i))];
end

% Plot the interpolating polynomal with Runge's Function
y2 = 1./(1+25.*x.^2);

scatter(t,y,'r*');
hold on;
plot(x,y1,x,y2);