%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Numerical Methods                           %
%  Engr. Mary Christianne Edjan                %
%                                              %
%  Polynomial Regression                       %
%  Curve Fitting and Interpolation             %
%  Octave Code                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

# Given
x = 0:0.4:6;
y=[0 3 4.5 5.8 5.9 5.8 6.2 7.4 9.6 15.6 20.7 26.7 31.1 35.6 39.3 41.5];

n=length(x);                                % n is the number od data points
m=4;                                        % m is the order of the polynomial

for i=1:2*m
xsum(i)=sum(x.^(i));                        % Define a vector with the summation terms           
end

% Beginning of Step 3
% Assign the first row of the matrix [a] and the first element of the column vector [b]
a(1,1)=n;
b(1,1)=sum(y);

for j= 2: m + 1
a(1,j)= xsum(j-1);
end

% Create rows 2 through 5 of the matrix [a] and elements 2 through 5 of the column vector [b]
for i = 2: m + 1
	for j = 1: m + 1
		a(i ,j) = xsum (j + i - 2);
	end
	 b(i,1)= sum(x.^(i - 1).*y);
end

% Step 4
p = (a\b)'                                % Solve the system [a][p]=[b] 
for i = 1:m + 1
Pcoef(i)= p(m + 2 - i) ;                  % Create a new vector fo the coefficients of the polynomial
end

epsilon = 0:0.1:6;                        % Define a vector of strain to be used for plotting
stressfit = polyval(Pcoef,epsilon);       % Stress calculated by the polynomial

% Plot
plot(x,y,'ro','markersize',9)
hold on
plot(epsilon,stressfit,'k','linewidth',2)
xlabel('Strain','fontsize',20)
ylabel('Stress (MPa) ','fontsize',20)
