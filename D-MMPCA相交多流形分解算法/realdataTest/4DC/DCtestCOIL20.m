% This code checks to see that you have the required packages
% in order to test DC

clear;
clear;
load('COIL20Croped.mat');
X=COILcrop';
acc=[];
for xh=1:20
tic;
disp('Running D-C.for COIL20..');
d=3;k=3;
[y,sX] = DC_meng(X,d,k);
toc

%计算分类精度
labels(sX{1})=1;
labels(sX{2})=2;
labels(sX{3})=3;
labels(sX{4})=4;
labels(sX{5})=5;

  accuracy_score = accuracy(labels', true_lables1)
 acc(xh)=accuracy_score
end;
Max=max(acc)
Avg=sum(acc)/20