%% Program to find difference set, difference co-array, and weight function just by using the sensor positions in the sparse array. 
%% No need of noting down 1s and 0s and then using the auto-correlation function
clc;clear all;close all;
%% Program to find DCA and weight function plot automatically. Just enter the array configuration i.e., sensor positions
a = [0:1:13]; %Declare the physical array. This works for ULAs and SLAs alike.
N = numel(a); % N denotes the number of sensors in the array
%% Following part of the code is to get the difference set, DCA, and weight function. 
x = a - a.'; % This commands generates a N*N matrix. ith column of x denotes a(i)-a. For example, 1st column is 0 - {0, 2, 5, 8, 9}
d = reshape(x,[1 N*N]); % This gives the difference set as a row vector of size 1*N^2. Note that this contains repeated spatial lags as per definition.
dca = unique(sort(d)); %This gives the DCA of the linear array. The difference set is sorted and duplicates are removed.
w = histc(d,dca); % This function computes the number of times each entry occurs in d i.e., it gives the weight function
%% Same thing for faulty array
a1 = [0, 1, 3, 4, 6, 7, 8, 9, 10, 12, 13]; 
N1 = numel(a1); 
%% Following part of the code is to get the difference set, DCA, and weight function. 
x1 = a1 - a1.'; % This commands generates a N*N matrix. ith column of x denotes a(i)-a. For example, 1st column is 0 - {0, 2, 5, 8, 9}
d1 = reshape(x1,[1 N1*N1]); % This gives the difference set as a row vector of size 1*N^2. Note that this contains repeated spatial lags as per definition.
dca1 = unique(sort(d1)); %This gives the DCA of the linear array. The difference set is sorted and duplicates are removed.
w1 = histc(d1,dca1);
n_f=max(w)-max(w1)
%% Plotting commands
stem(dca,w,'r--','LineWidth',1.5); %This plots the weight function against spatial lags
hold on
stem(dca1,w1,'bs-','LineWidth',1.5);
title({['Number of failed sensors F = ',int2str((n_f))]},'FontSize',9)
legend('Healthy array','Faulty array')
xlabel('Spatial lags');
ylabel('Weights');
% set(gca,'Xtick',[-10:10]);
grid on
grid minor

