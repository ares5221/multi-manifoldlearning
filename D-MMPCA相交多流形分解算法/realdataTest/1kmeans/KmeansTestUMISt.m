function [ output_args ] = testKmeans( input_args )
%TESTKMEANS Summary of this function goes here
%   Detailed explanation goes here
clear;
load('UMist8.mat');
%����kmeans��X���࣬�õ���IDX���Ƿ�����  ���ͨ��accuracy�ļ�������ྫȷ������������
%�������ʱ����Data dimension does not match dimension of centres�����ر�matlab���´򿪼���
X=X6;
acc=[];
for xh=1:20
tic;
[IDX,C]=kmeans(X',8);
toc
IDX=IDX';
%�۳�������
for j=1:8
    d=0;
    for i=1:241
        if (IDX(:,i)==j)
           d=d+1;
           PP(j,d)=i;     
        end;       
    end;
end;
%����kmeans�ֽ��ķ���ͼ����X1X2���漴��
% [m,n,b]=find(PP(1,:));
% X1=X(:,b);
% [m,n,bb]=find(PP(2,:));
% X2=X(:,bb);
% [m,n,bbb]=find(PP(3,:));
% X3=X(:,bbb);
% figure;      hold on;        
% hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
% set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
% hold on;        
% hin=scatter3(X2(1,:),X2(2,:),X2(3,:),50,'filled'); 
% set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
% hold on;        
% hin=scatter3(X3(1,:),X3(2,:),X3(3,:),50,'filled'); 
% set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
% view(-60,10)

%������ྫ��nmi.m accuracy.m hungarian.m
  accuracy_score = accuracy(IDX', true_lable)
  acc(xh)=accuracy_score
end;
Max=max(acc)
Avg=sum(acc)/20
end

