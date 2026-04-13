%function dydx = DiffEq(x,y)
dydx = @(x,y) -1.2*y + 7*exp(0.3*x);


%tspan = [0:0.5:2.0];
%yIni = 3;
[x,y] = ode45 (dydx, [0:0.5:2.5] , [3])
yExact = 70/9*exp(-0.3*x) - 43/9*exp(-1.2*x)
error = yExact-y
