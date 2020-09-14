% initialisation
clear ; close all; clc

% Loading data
fprintf("Loading data...\n");
data = load("ex1data1.txt");

% 1) Plotting Data
fprintf("Plotting Training Set\n");
X = data(:,1); X = X .+ 0.5;
y = data(:,2); y = y .+ 0.5;
figure;
pl = plot(X,y, 'bx', 'markersize', 10, 'marker', 'x');
set(gcf, 'Position', get(0, 'Screensize'));
axis([5 25 -5 30]);
hold on;
xlabel('Feature Values in 10.000s');
ylabel('Output Data in 10.000s');
title('Linear Regression with one variable');
t_  = text(10,25, "Training Set", "fontsize", 30);

pause(4);
delete(t_);

% 2) plotting possible linear functions
fprintf("Plotting possible linear function\n");
t = [0 40];
plt = plot(t, 2*t+1,'r');
set(gcf, 'Position', get(0, 'Screensize'));
l = legend('Training Set', "hypothesis function: \n h_{theta}(x) = theta0 + theta1 * x\n(theta0, theta1 - ?)\n");
set (l, "fontsize", 16);
text(10,25, "Some random possible hypothesis functions: h_{theta}(x) = theta0 + theta1*x", "fontsize", 30);
pause(3);
delete(plt);
%

plt = plot(t,1.2*t-1,'r');
pause(1);
delete(plt);
%

plt = plot(t,t,'r');
pause(1);
delete(plt);
%

plt = plot(t,1.1*t - 10,'r');
pause(1);
delete(plt);
%

plt = plot(t,1.1*t-6,'r');
pause(1);
delete(plt);
%


plt = plot(t,1.18*t - 3,'r');
pause(1);
delete(plt);
%

plt = plot(t,1.23*t - 4.2,'b');
l = legend('Training Set', "hypothesis function: \n h_{theta}(x) = theta0 + theta1 * x\n(theta0, theta1 - ?)\n");
set (l, "fontsize", 16);
pause(3);

clear t; clear t_; clear l; delete(pl); delete(plt); close all;



% 3)  Defining J function
theta = gradient(X, y, [-1 ; -10], 0.01, 5000);
theta


















