%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Numerical Methods                           %
%  Engr. Mary Christianne Edjan                %
%                                              %
%  Linear Least Squares Regression             %
%  Curve Fitting and Interpolation             %
%  Octave Code                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

# Given
x=0:10:100;
y=[0.94 0.96 1.0 1.05 1.07 1.09 1.14 1.17 1.21 1.24 1.28];

# Main Code
nx=length(x);
ny=length(y);

if nx != ny 				             # Check if the vectors x and y have the same number of elements.
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

# Plot
Tplot=[-300 100];
pplot=a1*Tplot+a0;
plot(x,y,'*r','markersize',12)
hold on
plot(Tplot,pplot, 'k','linewidth',2)
xlabel('Temperature (C) ','fontsize',20)
ylabel('Pressure (atm)' ,'fontsize',20)
T0=-0.9336/0.0034

