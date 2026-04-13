format short
clear all;
clc
f = @(x) (sin (x)).^2;
a = input('Enter lower limit a:');
b = input('Enter upper limit b:');
N = input('Enter number of subintervals: ');
h = (b-a)/N;
Method = input('Which Simpson Method are you going to use (1/3 or 3/8)?');


if (Method == 1/3)
    if rem(N,2) ==1
        printf('\n Please enter even number of subinterval.');
    N = input('Enter even number of subintervals: ');
    end

    k = 1:1:N-1;
    S = f(a+k.*h);
    Se = sum(S(2:2:N-1));
    So = sum(S(1:2:N-1));

    Out = (h/3).*(f(a)+4.*Se+2.*So+f(b));
    printf('The value of integration is %f \n', Out);

elseif (Method == 3/8)
    if rem(N,3) ~=0
     printf('\n Please enter a divisible of 3 number of subinterval.');
    N = input('Enter a divisible of 3 number of subintervals: ');
    end

    k = 1:1:N-1;
    S = f(a+k.*h);
    I = 3:3:N-1;
    S3 = sum(S(I));
    S(I)=[];
    So = sum(S);

    Out = (3*h/8).*(f(a)+3.*So+2.*S3+f(b));
    printf('The value of integration is %f \n', Out);

else
    printf('Close');
endif

