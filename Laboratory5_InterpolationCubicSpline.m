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
X = [8 11 15 18 22];
Y = [5 9 10 8 7];
Xint = 8:0.1:22;

function Yint=CubicSplines(x,y,xint)
% Main Code
n=length(x); interval=1;
if n ~= length(y)
  disp('ERROR: x and y do not have the same number of points');
  stop
end
% calculate h_i
for i = 1:n-1
  h(i) = x(i+1)-x(i);
end
%Start Thomas Algorithm
for i=2:n-2
  b(i)=h(i);
end
b(1)=0;
for i=1:n-3
  a(i)=h(i+1);
end
a(n-2)=0;
for i=1:n-2
  d(i)=2*(h(i)+h(i+1)); r(i)=6*(((y(i+2)-y(i+1))/h(i+1))-((y(i+1)-y(i))/h(i)));
end
A=zeros(n-2,n-2);
for i=2:n-3
  A(i,i)=d(i); A(i,i+1)=a(i); A(i,i-1)=b(i);
end
A(1,2)=a(1); A(1,1)=d(1); A(n-2,n-3)=b(n-2); A(n-2,n-2)=d(n-2);
a(1)=a(1)/d(1);
r(1)=r(1)/d(1);
for i=2:n-3
  denom=d(i)-b(i)*a(i-1);
    if(denom==0), error('zero in denominator'), end
  a(i)=a(i)/denom;
  r(i)=(r(i)-b(i)*r(i-1))/denom;
end
r(n-2)=(r(n-2)-b(n-2)*r(n-3))/(d(n-2)-b(n-2)*a(n-3));
ans(n-2)=r(n-2);
for i=n-3:-1:1
  ans(i) = r(i) - a(i)*ans(i+1);
end
acoeff(1)=0; acoeff(n)=0;
for i=2:n-1
  acoeff(i)=ans(i-1);
end
for j=1:n-1
   if xint >= x(j) & xint <= x(j+1)
    interval=j;
   end
end
i=interval;
YintA=(acoeff(i)*((x(i+1)-xint)^3)/6/h(i));
YintB=(acoeff(i+1)*((xint-x(i))^3)/6/h(i));
YintC=((y(i)/h(i))-(acoeff(i)*h(i)/6))*(x(i+1)-xint);
YintD=((y(i+1)/h(i))-(acoeff(i+1)*h(i)/6))*(xint-x(i));
Yint=YintA+YintB+YintC+YintD

endfunction
 
 N=length(Xint);
 
 for i = 1:N;
 yint(i) = CubicSplines(X,Y,Xint(i));
 end
 
% Plot
plot(Xint,yint,'k','linewidth',2)
hold on
plot(X,Y,'ro','markersize',9)

xlabel('x','fontsize',20)
ylabel('y ','fontsize',20)
hold off
