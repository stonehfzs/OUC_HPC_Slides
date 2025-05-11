% Regression analysis example
% Generate sample data
x = linspace(0, 10, 50)';
y = 3*x + 2 + 5*randn(size(x));  % Linear model with noise

% Standard regression approach
X = [ones(length(x), 1), x];  % Design matrix with intercept
beta = (X'*X)\X'*y;  % OLS estimator
y_fit = X*beta;

% Calculate R-squared
R_squared = 1 - sum((y-y_fit).^2)/sum((y-mean(y)).^2);

% Plot results
plot(x, y, 'o', x, y_fit, '-r')
xlabel('x'), ylabel('y')
title(sprintf('Linear Regression: y = %.2f + %.2f*x, R-squared = %.3f', beta(1), beta(2), R_squared))
legend('Data', 'Fitted Model')

% Alternative using built-in function
mdl = fitlm(x, y);
disp(mdl)

% Find the linear regression model: