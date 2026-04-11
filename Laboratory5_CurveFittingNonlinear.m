%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Numerical Methods                           %
%  Engr. Mary Christianne Edjan                %
%                                              %
%  Nonlinear Equation by writing               %
%    the equation in a Linear form             %
%  Curve Fitting and Interpolation             %
%  Octave Code                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

# Given
texp= 2:2:30; 
vexp=[9.7 8.1 6.6 5.1 4.4 3.7 2.8 2.4 2.0 1.6 1.4 1.1 0.85 0.69 0.6];

# Main Code
vexpLOG=log(vexp);
R=5E6;

x = texp;
y = vexpLOG;
nx=length(x);
ny=length(y);

if nx != ny 				              # Check if the vectors x and y have the same number of elements.
disp('ERROR: The number of elements in x must be the same as in y.')
a1='Error';				                # If yes, Octave displays error message and the constants are not calculated
a0='Error';
else
Sx=sum(x);				                # Calculate the summation terms
Sy=sum(y);			                  # Calculate the summation terms
Sxy=sum(x.*y);				            # Calculate the summation terms
Sxx=sum(x.^2);				            # Calculate the summation terms
a1=(nx*Sxy-Sx*Sy)/(nx*Sxx-Sx^2);	# Calculate the coefficients
a0=(Sxx*Sy-Sxy*Sx)/(nx*Sxx-Sx^2);	# Calculate the coefficients
end

b = exp(a0)
C = -1/(R*a1)

# Plot
t = 0:0.5:30;
v = b*exp(a1*t);
plot(texp,vexp,'ro','markersize',12)
hold on
plot(t,v,'k','linewidth',2)
xlabel('Time(s) ','fontsize',20)
ylabel('VT(V)' ,'fontsize',20)


