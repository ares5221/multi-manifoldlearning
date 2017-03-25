function [ output_args ] = testKmeans( input_args )
%   kmanifolds测试three liner plant
clear;
load('COIL20Croped.mat');
X=COILcrop;
d=3;
K=5;

%运行SCC对X分类，得到的IDX就是分类结果
%如果运行时出现Data dimension does not match dimension of centres报错，关闭matlab重新打开即可
disp('Running SCC...')
tic;
[sampleLabels,averageL2Error] = scc(X,d,K);
toc

%计算分类精度nmi.m accuracy.m hungarian.m

  accuracy_score = accuracy(sampleLabels, true_lables1)
  
end

