tic;
% Pick sample points
t = linspace(-1,1,21);
y = 1./(1+25.*t.^2);

% Construct A
A = [];
for i = 1:length(t)
    for j = 1:length(t)
        a = 1;
        for k = 1:j-1
            a = a * (t(i)-t(k));
        end
        A(i,j) = a;
    end
end

% Solving the linear equation system
starttime = toc;
w = A\y.';
endtime = toc;

% Plug weights into polynomial and calculate the values
x = linspace(-1,1,200);
y1 = [];
for k = 1:length(x)
    X = [];
    for i = 1:length(t)
        b = 1;
        yj = 0;
        for j = 1:i-1
            b = b * (x(k)-t(j));
            yj = yj + w(j)*b;
        end
        X = [X b];
    end
    yk = X*w;
    y1 = [y1 yk];
end
fprintf('Cost time: %f sec.', endtime-starttime)

% Plot the interpolating polynomal with Runge's Function
y2 = 1./(1+25.*x.^2);

scatter(t,y,'r*');
hold on;
plot(x,y1,x,y2);