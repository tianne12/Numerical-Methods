%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Numerical Methods                           %
%  Engr. Mary Christianne Edjan                %
%                                              %
%  Cubic Spline Interpolation                  %
%  Curve Fitting and Interpolation             %
%  Octave Code                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

% Given
x = [8 11 15 18];
y = [5 9 10 8];
Xint = 12.7;

% Main Code
n = length(x);
for i = 2:n
  if Xint < x(i)
    break
  end
end

Yint=(Xint-x(i))*y(i-1)/(x(i-1)-x(i))+(Xint-x(i-1))*y(i)/(x(i)-x(i-1))

% Plot
plot(x,y,'ro','markersize',9)
hold on
plot(x,y,'k','linewidth',2)
xlabel('x','fontsize',20)
ylabel('y ','fontsize',20)


