function [theta, J_history, theta0s, theta1s] = gradient(X, y, theta, alpha, num_iters)

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, num_iters);
theta0s = zeros(num_iters, 1);
theta1s = zeros(num_iters, 1);
X = [ones(m,1), X];

for iter = 1:num_iters,

    h = X*theta;
    error_v = h - y;
    change = (X' * error_v)*alpha/m;
    theta = theta - change;

    % Save the cost J in every iteration    
    %J_history(iter) = J(X, y, theta(1), theta(2));
    theta0s(iter) = theta(1);
    theta1s(iter) = theta(2);

end

theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);
J_vals = zeros(length(theta0_vals), length(theta1_vals));
for i = 1:length(theta0_vals),
	for j = 1:length(theta1_vals),
		J_vals(i,j) = J(X,y,theta0_vals(i), theta1_vals(j));
	end
end

J_vals = J_vals';
figure;
axis([ -10 -1 4 10 0 800 ]);
plt = plot3(theta0_vals, theta1_vals, J_vals);
set(gcf, 'Position', get(0, 'Screensize'));
xlabel('\theta_0'); ylabel('\theta_1');
legend("Cost Function (J)");
hold on;

pause(2);
for i = 1:10:num_iters,
    p = plot3(theta0s(i), theta1s(i), J(X,y,theta0s(i), theta1s(i)), 'markersize', 15, 'marker', 'x', 'color', 'b');
    pause(0.1);
    delete(p);
end

delete(plt);
plt = contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20));
set(gcf, 'Position', get(0, 'Screensize'));
xlabel('\theta_0'); ylabel('\theta_1');
hold on;

p = plot(theta0s(1), theta1s(1),'markersize', 15, 'marker', 'x', 'color', 'b');
pause(2); delete(p);
for i = 1:10:num_iters,
    p = plot(theta0s(i), theta1s(i), 'markersize', 15, 'marker', 'x', 'color', 'b');
    pause(0.1);
    delete(p);
end

close all;


pause(2);

figure;
pl = plot(X,y, 'bx', 'markersize', 10, 'marker', 'x');
%set(gcf, 'Position', get(0, 'Screensize'));
axis([5 25 -5 30]);
hold on;
xlabel('Feature Values in 10.000s');
ylabel('Output Data in 10.000s');
title('Linear Regression with one variable');

t = [0 40];
for i = 1:10:num_iters,
    plt = plot(t,theta0s(i) + theta1s(i)*t,'r');
    s1 = ["h_{\theta}(x)  = " num2str(theta0s(i)) " + " num2str(theta1s(i)) "*x"];
    legend(s1);
    pause(0.1);
    delete(plt);
end

plt = plot(t, theta0s(num_iters) + theta1s(num_iters) * t, 'b');
pause(3);
close all;







%51 = text(5, 19, 800, "theta0 = ", "fontsize", 20);
%t2 = text(5, 17, 800, "theta1 = ", "fontsize", 20);
%s1 = ["theta0 = " num2str(10*theta0s(i))];
%s2 = ["theta1 = " num2str(10*theta1s(i))];
%t1 = text(5, 19, 800, s1, "fontsize", 20);
%t2 = text(5, 17, 800, s2, "fontsize", 20);

%text(5, 26,800,"m - count of training examples", "fontsize", 20);
%pause(1);
%text(5, 24,800, "Cost function: J(theta0, theta1) = (1/2m) * Sigma_{i=1}^m(h(x^i) - y^i)^2", "fontsize", 20);
%pause(1);
%text(5, 22,800, "J(theta0, theta1) = (1/2m) * Sigma_{i=1}^m(theta0 + theta1*x^i - y^i)^2", "fontsize", 20);
%pause(1);
%text(5, 19,800, "----\nRunning Gradient Descent to minimize J cost function...", "fontsize", 20);
%pause(1);
%text(5, 19,800, "theta0 = 1\ntheta1 = 1\n", "fontsize", 20);

end
