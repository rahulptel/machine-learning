clear all 
close all
clc

x1=csvread('x.csv');
y1=csvread('y.csv');
yh=0;
alpha=1;
% theta=[1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0];
theta = zeros([1,17]);
itr=0;
error = 1;
while (itr<100) & (error>0.01)
    for kk=3:3
        xa=x1(kk,:);
        ya=y1(kk);
        xa=[1,xa];
        z=xa*theta';
        yh=1.0/(1.0+exp(-1.0*z));
        err(kk) = 0.5*((ya-yh)^2);
        dtheta(kk,:)=alpha*(ya-yh)*yh*(1-yh)*xa;
    end
    dlt = mean(dtheta);
    theta = theta - dlt; 
    error = mean(err);
    itr=itr+1;
end
% 
% for kk=1:618
%         xa=x1(kk, :);
%         ya=y1(kk);
%         xa=[1,xa];
%         z=xa*theta';
%         yh(kk)=1.0/(1.0+exp(-1.0*z));
% end