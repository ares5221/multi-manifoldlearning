function [ output_args ] = testKmeans( input_args )
%TESTKMEANS Summary of this function goes here
%  
clear;
load('two_spirals.mat');
%运行kmeans对X分类，得到的IDX就是分类结果  最后通过accuracy文件计算分类精确度匈牙利方法
%如果运行时出现Data dimension does not match dimension of centres报错，关闭matlab重新打开即可
tic;
[IDX,C]=kmeans(X',2);
toc
IDX=IDX';
%聚成了2类
for j=1:2
    d=0;
    for i=1:size(IDX,2)
        if (IDX(:,i)==j)
           d=d+1;
           PP(j,d)=i;     
        end;       
    end;
end;
%画出kmeans分解后的分类图，将X1X2保存即可
[m,n,b]=find(PP(1,:));
X1=X(:,b);
[m,n,bb]=find(PP(2,:));
X2=X(:,bb);

figure;     
hold on;        
hin=scatter(X1(1,:),X1(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;

%计算分类精度nmi.m accuracy.m hungarian.m
  nmi_score = nmi(IDX', true_labels)
  accuracy_score = accuracy(IDX', true_labels)
end

