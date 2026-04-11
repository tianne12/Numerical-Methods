%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Numerical Solution for CE Problems  %
%  EngMath501                          %
%  Engr. Mary Christianne Edjan        %
%                                      %
%  Bracketing Method                   %
%  Bisection Method                    %
%  Octave Code                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

%f(x)
F = @ (x) x-2*(exp(-x));

%initial condition
a = 0; 
b = 1; 

%setting of parameters
imax = 20; 
tol = 0.001;
Fa = F(a); 
Fb = F(b);

%Main Code
if Fa*Fb > 0                                                            %Stop the program if the function has the same sign at points a and b
  fprintf('Error:The function has the same sign at points a and b. ')
else
  %Display Header
  fprintf('iteration         a                 b               (xNS)       Solution f(xNS)       Tolerance\n')
  
for i = 1:imax
  xNS = (a + b)/2;                                                      %Calculate the numerical solution of the iteration, xNS
  toli = (b - a)/2;                                                     %Calculate the current tolerance.
  FxNS = F(xNS);                                                        %Calculate the value of f(xNS) of the iteration
  %Display Iteration results
  fprintf('%3i       %11.6f        %11.6f        %11.6f       %11.6f       %11.6f\n', i, a, b, xNS , FxNS , toli)

if FxNS == 0
  fprintf ('An exact solution x =%11.6f was found' ,xNS)                %Stop the program if the true solution, f(x) = 0, is found
break
end

if toli < tol                                                           %Stop the iterations if the tolerance of the iteration is 
  xNS                                                                   % smaller than the desired tolerance. Display final solution
  break
end
if i == imax                                                            %Stop the iterations if the solution was not obtained and 
  fprintf('Solution was not obtained in %i iteraticns',imax)            % the number of the iteration reaches imax
break
end
if F(a)*FxNS < 0                                                        %Determine whether the true solution is between a and xNS, or between xNS and b,
  b = xNS;                                                              % and select a and b for the next iteration
else
  a = xNS;
end
end
end
