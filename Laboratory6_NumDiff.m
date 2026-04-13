%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Numerical Methods                   %
%  Engr. Mary Christianne Edjan        %
%                                      %
%  Numerical Differentiation           %
%  Octave Code                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Given
t = 4:0.2:8;
x = [-5.87 -4.23 -2.55 -0.89 0.67 2.09 3.31 4.31 5.06 5.55 5.78 5.77 5.52 5.08 4.46 3.72 2.88 2.00 1.10 0.23 -0.59];

%Main Code
%Velocity
n = length(t);
dx(1) = (x(2)-x(1))/(t(2)-t(1));
for i = 2:n-1
    dx(i) = (x(i+1)-x(i-1))./(t(i+1)-t(i-1));
end
dx(n) = (x(n)-x(n-1))/(t(n)-t(n-1));

vel(1:n)=dx(1:n);

%Acceleration
n = length(t);
dx2(1) = (vel(2)-vel(1))/(t(2)-t(1));
for i = 2:n-1
    dx2(i) = (vel(i+1)-vel(i-1))./(t(i+1)-t(i-1));
end
dx2(n) = (vel(n)-vel(n-1))/(t(n)-t(n-1));

acc(1:n)=dx2(1:n);

subplot(3,1,1)
plot(t,x)
ylabel('Distance')
subplot(3,1,2)
plot(t,vel)
ylabel('Velocity')
subplot(3,1,3)
plot(t,acc)
ylabel('Acceleration')
xlabel('Time')
