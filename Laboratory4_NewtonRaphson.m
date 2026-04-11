%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Numerical Methods                   %
%  Engr. Mary Christianne Edjan        %
%                                      %
%  Open Method                         %
%  Newton-Raphson Method               %
%  Octave Code                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%initial condition
Xest = 1;

%setting of parameters
Err = 0.0001;
imax = 10;
format long
    
%main code
for i = 1:imax
    
%f(x)
%F = @ (x) 8 - 4.5*(x - sin(x));
F = @ (x) x-(2*(e^(-x)));
y1 = F(Xest);

%first derivative of f(x)
pkg load symbolic  
syms x;  
ff = F(x);  
ffd = diff(ff, x);
df = function_handle(ffd);
y2= df(Xest);

%equation for xNS
Xi = Xest - y1/y2;

%calculation of error
if abs((Xi - Xest)/Xest) < Err
    Error = abs((Xi - Xest)/Xest)
    Xs = Xi
break
end
i = i
Error = abs((Xi - Xest)/Xest)
Xest = Xi
end

%iteration limit
if i == imax
fprintf('Solution was not cbtained in %i iterations. \n',imax)
Xs = ('No answer ');
end




