% Lotka-Volterra predator-prey system
function dydt = predator_prey(t, y)
    % Model parameters
    alpha = 1.1;  % Prey growth rate
    beta = 0.4;   % Prey death rate due to predation
    delta = 0.1;  % Predator growth rate from consuming prey
    gamma = 0.4;  % Predator death rate
    
    dydt = zeros(2,1);
    dydt(1) = alpha*y(1) - beta*y(1)*y(2);  % Prey population change
    dydt(2) = delta*y(1)*y(2) - gamma*y(2); % Predator population change
end

% Main script
tspan = [0 50];
y0 = [20; 5];  % Initial populations [prey; predator]
[t, y] = ode45(@predator_prey, tspan, y0);

% Plot the dynamics
subplot(2,1,1)
plot(t, y(:,1), 'g-', t, y(:,2), 'r-')
title('Population Dynamics Over Time')
legend('Prey', 'Predator')
xlabel('Time'), ylabel('Population')

subplot(2,1,2)
plot(y(:,1), y(:,2))
title('Phase Space Plot')
xlabel('Prey Population'), ylabel('Predator Population')

% The Lotka-Volterra model