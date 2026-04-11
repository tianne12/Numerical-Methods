%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Numerical Methods                   %
%  Engr. Mary Christianne Edjan        %
%                                      %
%  Open Method                         %
%  Secant Method                       %
%  Octave Code                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
%F = @ (x) 8 - 4.5*(x - sin(x))
F = @ (x) x-(2*(e^(-x)));
%initial condition
Xa = 0;
Xb = 1;

%setting of parameters
Err = 0.0001;
imax = 10;
format long
    
%Main Code
for i = 1:imax

%f(xb)
yXb = F(Xb);

%f(xa)
yXa = F(Xa);

%equation for xNS
Xi = Xb - yXb*(Xa-Xb) /(yXa -yXb);

%calculation of error
if abs((Xi - Xb) /Xb) < Err
Error = abs((Xi - Xb) /Xb)
Xs = Xi
break
end
i = i
Xa = Xb
Xb = Xi
end

%iteration limit
if i == imax
fprintf('Solution was not obtained in %i iterations.\n' ,imax)
Xs = ('No answer') ;
end





