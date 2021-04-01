function [De,E,dY_dq]= func_compute_De_E_dY_dq(q,dq,param)
%%%%%%  func_compute_De_E_dY_dq.m
%%%%  03/30/21
%%%%
%%%%
%%%%
%Inputs
q1=q(1);
q2=q(2);
q3=q(3);
%%%%
%%%%
dq1=dq(1);
dq2=dq(2);
dq3=dq(3);
%%%%
%%%%
r=param(1);
m=param(2);
Mh=param(3);
Mt=param(4);
l=param(5);
g=param(6);
%%%%
%%%%
%%%%
%%%%
De=zeros(5,5);
De(1,1) = -(Mh*(2*r^2*cos(q2) - 2*l^2 - 7*r^2 + 4*l*r*cos(q3)))/2;
De(1,2) = -(Mh*r^2*(2*cos(q2) - 1))/4;
De(1,3) = Mh*l*(l - r*cos(q3));
De(1,4) = (Mh*(2*l*cos(q1 + q3) + r*cos(q1 + q2) - 7*r*cos(q1)))/2;
De(1,5) = (Mh*(2*l*sin(q1 + q3) + r*sin(q1 + q2) - 7*r*sin(q1)))/2;
De(2,1) = -(Mh*r^2*(2*cos(q2) - 1))/4;
De(2,2) = (Mh*r^2)/4;
De(2,3) = 0;
De(2,4) = (Mh*r*cos(q1 + q2))/2;
De(2,5) = (Mh*r*sin(q1 + q2))/2;
De(3,1) = Mh*l*(l - r*cos(q3));
De(3,2) = 0;
De(3,3) = Mh*l^2;
De(3,4) = Mh*l*cos(q1 + q3);
De(3,5) = Mh*l*sin(q1 + q3);
De(4,1) = (Mh*(2*l*cos(q1 + q3) + r*cos(q1 + q2) - 7*r*cos(q1)))/2;
De(4,2) = (Mh*r*cos(q1 + q2))/2;
De(4,3) = Mh*l*cos(q1 + q3);
De(4,4) = 4*Mh;
De(4,5) = 0;
De(5,1) = (Mh*(2*l*sin(q1 + q3) + r*sin(q1 + q2) - 7*r*sin(q1)))/2;
De(5,2) = (Mh*r*sin(q1 + q2))/2;
De(5,3) = Mh*l*sin(q1 + q3);
De(5,4) = 0;
De(5,5) = 4*Mh;
%%%%
%%%%
E=zeros(2,5);
E(1,1) = r*cos(q1 + q2) - r*cos(q1);
E(1,2) = r*cos(q1 + q2);
E(1,3) = 0;
E(1,4) = 1;
E(1,5) = 0;
E(2,1) = r*sin(q1 + q2) - r*sin(q1);
E(2,2) = r*sin(q1 + q2);
E(2,3) = 0;
E(2,4) = 0;
E(2,5) = 1;
%%%%
%%%%
dY_dq=zeros(2,3);
dY_dq(1,1) = -r*cos(q1);
dY_dq(1,2) = 0;
dY_dq(1,3) = 0;
dY_dq(2,1) = -r*sin(q1);
dY_dq(2,2) = 0;
dY_dq(2,3) = 0;
%%%%
%%%%
%%End of code