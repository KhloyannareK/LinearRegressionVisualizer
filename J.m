
function J = J(X, y, theta0, theta1)
   theta = [theta0 ; theta1];
   J = X * theta;
   J = (J - y) .^ 2;
   J = sum(J) / (2*length(X(:,1)));
end
