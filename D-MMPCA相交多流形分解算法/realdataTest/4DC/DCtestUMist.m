% This code checks to see that you have the required packages
% in order to test DC

clear;
clear;
load('UMist8.mat');
X=X6;
acc=[];
for xh=1:20
tic;
disp('Running D-C.for UMist8..');
%对于UMist在DC方法上运行，k必须最小为3
d=3;k=3;
[y,sX] = DC_meng(X,d,k);
toc

%计算分类精度
labels(sX{1})=1;
labels(sX{2})=2;
labels(sX{3})=3;
labels(sX{4})=4;
labels(sX{5})=5;
labels(sX{6})=6;
labels(sX{7})=7;
labels(sX{8})=8;
  accuracy_score = accuracy(labels', true_lable)
 acc(xh)=accuracy_score
end;
Max=max(acc)
Avg=sum(acc)/20