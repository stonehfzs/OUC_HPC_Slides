% Linear Programming Example - Production optimization
f = [-40; -30];  % Objective: maximize 40*x1 + 30*x2
A = [1, 2; 3, 1];  % Constraint coefficients
b = [80; 75];  % Resource limitations
lb = [0; 0];  % Non-negativity constraints

% Solve the linear program
[x, fval] = linprog(f, A, b, [], [], lb, []);

fprintf('Optimal solution: x1 = %.2f, x2 = %.2f\n', x(1), x(2));
fprintf('Maximum profit: $%.2f\n', -fval);  % Negate to get maximum

% Plot feasible region
x1 = 0:1:30;
plot(x1, (80-x1)/2, 'r', x1, 75-3*x1, 'b', x(1), x(2), 'go', 'MarkerSize', 10)
legend('Resource 1', 'Resource 2', 'Optimal Point')
xlabel('x1'), ylabel('x2'), title('Linear Programming Optimization')

% A production optimization problem using linear programming