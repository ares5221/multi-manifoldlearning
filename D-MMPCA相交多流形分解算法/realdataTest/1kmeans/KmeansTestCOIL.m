function [ output_args ] = testKmeans( input_args )
%TESTKMEANS Summary of this function goes here
%   Detailed explanation goes here
clear;
load('COIL20Croped.mat');
%运行kmeans对X分类，得到的IDX就是分类结果  最后通过accuracy文件计算分类精确度匈牙利方法
%如果运行时出现Data dimension does not match dimension of centres报错，关闭matlab重新打开即可
X=COILcrop';
acc=[];
for xh=1:20
tic;
[IDX,C]=kmeans(X',5);
toc
IDX=IDX';
%聚成了三类
for j=1:8
    d=0;
    for i=1:360
        if (IDX(:,i)==j)
           d=d+1;
           PP(j,d)=i;     
        end;       
    end;
end;
%画出kmeans分解后的分类图，将X1X2保存即可
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

%计算分类精度nmi.m accuracy.m hungarian.m
  accuracy_score = accuracy(IDX', true_lables1)
  acc(xh)=accuracy_score
end;
Max=max(acc)
Avg=sum(acc)/20
end

