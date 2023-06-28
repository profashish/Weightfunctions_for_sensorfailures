%% Program to convert sparse notations
clc; clear all; close all;
%% convert sparse arrays from {1, 4, (1, 6)^2, 1^4} format to actual sensor positions
a = [1 1 4 4 4 3 ]; %Array configuration given in the IES format
%The above represents 8-element MISC array. Use your own array here.
n = length(a)+1; % number of sensors is n
b = zeros(1,n);% actual positions of physical sensors. All initialized to zero
for i=2:n
    b(i)=b(i-1)+a(i-1); %{a,b,c,d} config has sensors at {0, a, a+b, a+b+c, a+b+c+d+e}
end
disp('The physical sensors are at:');
b % display the actual sensor positions