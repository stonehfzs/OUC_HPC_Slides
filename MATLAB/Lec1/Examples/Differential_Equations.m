% Main script
tspan = [0 30];
y0 = [1; 0];  % Initial position and velocity

[t, y] = ode45(@oscillator, tspan, y0);

% Plot the results
figure;
plot(t, y(:,1), 'b-', 'LineWidth', 1.5)
xlabel('Time')
ylabel('Displacement')
title('Damped Harmonic Oscillator')
grid on

% Damped harmonic oscillator function
function dydt = oscillator(t, y)
    b = 0.3;  % Damping coefficient
    k = 1.0;  % Spring constant
    dydt = zeros(2,1);
    dydt(1) = y(2);
    dydt(2) = -k*y(1) - b*y(2);
end

% A simple mass-spring-damper system with the 2nd order ODE