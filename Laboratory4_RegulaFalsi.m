%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Numerical Methods                   %
%  Engr. Mary Christianne Edjan        %
%                                      %
%  Open Method                         %
%  False Position Method               %
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
imax = 30; 
err = 0.001;
Fa = F(a); 
Fb = F(b);

%Main Code
if Fa*Fb > 0                                                            %Stop the program if the function has the same sign at points a and b
  fprintf('Error:The function has the same sign at points a and b. ')
else
  %Display Header
  fprintf('iteration         a                 b               (xNS)       Solution f(xNS)          Error\n')
  
for i = 1:imax
  xNS = ((a*Fb)-(b*Fa))/(Fb-Fa);                                        %Calculate the numerical solution of the iteration, xNS
  erro = (b - a)/b;                                                     %Calculate the current estimated error.
  FxNS = F(xNS);                                                        %Calculate the value of f(xNS) ofthe iteration
  %Display Iteration results
  fprintf('%3i       %11.6f        %11.6f        %11.6f       %11.6f       %11.6f\n', i, a, b, xNS , FxNS , erro)

if FxNS == 0
  fprintf ('An exact solution x =%11.6f was found' ,xNS)                %Stop the program if the true solution, f(x) = 0, is found
break
end

if erro < err                                                            %Stop the iterations if the estimated error of the iteration is 
  xNS                                                                   % smaller than the desired estimated error. Display final solution
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
