%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Numerical Methods                           %
%  Engr. Mary Christianne Edjan                %
%                                              %
%  Linear Interpolation (Lagrange)             %
%  Curve Fitting and Interpolation             %
%  Octave Code                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

% Given
x = [1 2 4 5 7];
y = [52 5 -5 -40 10] ;
Xint = 3;

% Main Code
n = length(x) ;
for i =1:n
L(i) =1;
  for j = 1:n
   if j != i
    L(i)= L(i)*(Xint-x(j))/(x(i)-x(j));
    endif
  endfor
endfor

Yint = sum(y.*L)
  
% Plot
plot(x,y,'ro','markersize',9)
hold on
plot(x,y,'k','linewidth',2)
xlabel('x','fontsize',20)
ylabel('y','fontsize',20)

