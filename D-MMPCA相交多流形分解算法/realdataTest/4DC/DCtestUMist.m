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
%����UMist��DC���������У�k������СΪ3
d=3;k=3;
[y,sX] = DC_meng(X,d,k);
toc

%������ྫ��
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