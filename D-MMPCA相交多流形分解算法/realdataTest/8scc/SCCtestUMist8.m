function [ output_args ] = testKmeans( input_args )
%   kmanifolds����three liner plant
clear;
load('UMist8.mat');
X=X6';
d=3;
K=8;
%����SCC��X���࣬�õ���IDX���Ƿ�����
%�������ʱ����Data dimension does not match dimension of centres�����ر�matlab���´򿪼���
disp('Running SCC...')
tic;
[sampleLabels,averageL2Error] = scc(X,d,K);
toc

%������ྫ��nmi.m accuracy.m hungarian.m

  accuracy_score = accuracy(sampleLabels, true_lable)
  
end

