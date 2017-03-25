% This code checks to see that you have the required packages
% in order to run kmanifolds
clear;
addpath ('C:\Program Files\MATLAB\R2011b\toolbox\netlab3_3');
fprintf('Checking for IsomapII...');
isoCheck = exist('L2_distance') & exist('dijkstra');
if (isoCheck)
   fprintf(' OK\n');
else
   error('Isomap not correctly installed');
end

fprintf('Checking for Netlab...');
netCheck = exist('rbftrain');
if (netCheck)
   fprintf(' OK\n');
else
   error('Netlab not correctly installed');
end

disp('Constructing spiral example...');
% P = makeSpiral(500, .02, 4);
load('X1500.mat');
P=X;
disp('Running k-Manifolds...')
tic;
[idx,assn] = kmanifolds(P, [3 3]);
toc
X1=X(:,idx{1});
X2=X(:,idx{2});