tic;
% Pick sample points
t = linspace(-1,1,11);
y = 1./(1+25.*t.^2);

% Construct A
A = [];
for i = 1:11
    for j = 1:11
        A(i,j) = t(i)^(j-1);
    end
end

% Solving the linear equation system
starttime = toc;
w = A\y.';
endtime = toc;

% Plug weights into polynomial and calculate the values
x = linspace(-1,1,200);
y1 = [];
for i = 1:200
    p = p1(10,w,x(i));
    y1 = [y1 p];
end
fprintf('Cost time: %f sec.', endtime-starttime)

% Plot the interpolating polynomal with Runge's Function
y2 = 1./(1+25.*x.^2);

scatter(t,y,'r*');
hold on;
plot(x,y1,x,y2);