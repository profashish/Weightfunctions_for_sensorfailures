clc;clear all;close all;
%% healthy array
a = ones(6,6);% 6*6 URA or planar array in which all elements are healthy
w = xcorr2(a);% weight function of 2D array
%% faulty array
a1 = [1 1 1 0 1 1; 0 1 1 1 1 0; ones(1,6); 1 0 0 1 1 1; ones(1,6); 1 1 1 0 1 1]; %Faulty URA as per Table I
w1=xcorr2(a1);% weight function of faulty array
wh_0 = max(w,[],'all'); %w(0,0) in healthy array
wf_0 = max(w1,[],'all'); %w(0,0) in faulty array
n_f = wh_0-wf_0; %number of failed sensors
%% plot such that maximum weight comes at (0, 0) in line with ACF properties
m_x=-5:5;
m_y=-5:5;
stem3(m_x,m_y,w,'r--'); % To plot weight function such that peak is at (0,0)
hold on
stem3(m_x,m_y,w1,'bs','MarkerFaceColor','b');
xlabel('$m_x$','Interpreter','latex')
ylabel('$m_y$','Interpreter','latex')
zlabel('$w(m_x, m_y)$','Interpreter','latex')
title({['Number of failed sensors = ',int2str((n_f))]},'FontSize',9)
legend('Healthy URA','Faulty URA','float')
grid on
grid minor
%Kindly rotate the plot in 3D to get the desired view as plotted in Fig. 8