x = [0 1 3 4 6 7 9 10];
f = [8 6 5.5 1.5 1.1 1 0.9 0.9];

% Construct A
A = [];
for i = 1:length(x)
    for j = 1:length(x)
        a = 1;
        for k = 1:j-1
            a = a * (x(i)-x(k));
        end
        A(i,j) = a;
    end
end

% Solving the linear equation system
w =A\f.';

% Plug weights into polynomial and calculate the values
x1 = linspace(0,10,200);
y1 = [];
for k = 1:length(x1)
    X = [];
    for i = 1:length(x)
        b = 1;
        yj = 0;
        for j = 1:i-1
            b = b * (x1(k)-x(j));
            yj = yj + w(j)*b;
        end
        X = [X b];
    end
    yk = X*w;
    y1 = [y1 yk];
end

% Plot the interpolating polynomal with sample points
scatter(x,f,'r*');
hold on;
plot(x1,y1);