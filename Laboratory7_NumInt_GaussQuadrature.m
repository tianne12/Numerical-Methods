format short
clear all;
clc
f = @(x) (sin (x)).^2;
a = input('Enter lower limit a:');
b = input('Enter upper limit b:');
G = input('How many interval (2-6)?');
Ft = @(t) f(((b-a)*t + (b+a))/2);

if G==2
    w1 = 1; w2 = 1;
    t1 = -1/sqrt(3); t2 = 1/sqrt(3);
    G2 = ((b-a)/2)*(w1*Ft(t1) + w2*Ft(t2));
    printf('The value of integration is %f \n', G2);
    
elseif G==3
    w1 = 5/9;  w2 = 8/9; w3 = 5/9;
    t1 = -sqrt(3/5); w2 = 0; w3 = sqrt(3/5);
    G3 = ((b-a)/2)*(w1*Ft(t1) + w2*Ft(t2) + w3*Ft(t3));
    printf('The value of integration is %f \n', G3);
    
elseif G==4
    w1 = 0.3478548;  w2 = 0.6521452; w3 = 0.6521452; w4 = 0.3478548;
    t1 = -0.86113631; t2 = -0.33998104; t3 = 0.33998104; t4 = 0.86113631;
    G4 = ((b-a)/2)*(w1*Ft(t1) + w2*Ft(t2) + w3*Ft(t3) + w4*Ft(t4));
    printf('The value of integration is %f \n', G4);
    
elseif G==5
    w1 = 0.2369269;  w2 = 0.4786287; w3 = 0.568889; w4 = 0.4786287; w5 = 0.2369269;
    t1 = -0.90617985; t2 = -0.53846931; t3 = 0; t4 = 0.53846931; t5 = 0.90617985;
    G5 = ((b-a)/2)*(w1*Ft(t1) + w2*Ft(t2) + w3*Ft(t3) + w4*Ft(t4) + w5*Ft(t5));
    printf('The value of integration is %f \n', G5);
    
elseif G==6
    w1 = 0.1713245;  w2 = 0.3607616; w3 = 0.4679139; w4 = 0.4679139; w5 = 0.3607616; w6 = 0.1713245;
    t1 = -0.93246951; t2 = -0.66120938; t3 = -0.23861919; t4 = 0.23861919; t5 = 0.66120938; t6 = 0.93246951;
    G6 = ((b-a)/2)*(w1*Ft(t1) + w2*Ft(t2) + w3*Ft(t3) + w4*Ft(t4) + w5*Ft(t5) + w6*Ft(t6));
    printf('The value of integration is %f \n', G6);
    
else
    printf('Formula not available');
endif
