%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Numerical Methods                   %
%  Engr. Mary Christianne Edjan        %
%                                      %
%  Open Method                         %
%  Fixed Point Iteration Method        %
%  Octave Code                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all


%initial condition
Xest = 1;

%setting of parameters
Err = 0.0001;
imax = 60;
format long

%display header
fprintf ('  i       Xi        Xi+1      Error \n')

%main code
for i = 1:imax
    
%f(x)
Xi = sqrt(cos(Xest)/0.8);

%calculation of error
Error = abs((Xi - Xest)/Xest);

%display answer
fprintf ('%3i     %.6f   %.6f  %.6f \n', i, Xest, Xi, Error)

%when to stop the iteration
if abs((Xi - Xest)/Xest) < Err
Xs = Xi
break
end
i = i;
Xest = Xi;
end

%iteration limit
if i == imax
fprintf('Solution was not cbtained in %i iterations. \n',imax)
Xs = ('No answer ');
end 



