function [ output_args ] = testKmeans( input_args )
%TESTKMEANS Summary of this function goes here
%   Detailed explanation goes here
clear;
load('X1500.mat');
%运行kmeans对X分类，得到的IDX就是分类结果
%如果运行时出现Data dimension does not match dimension of centres报错，关闭matlab重新打开即可
tic;
[IDX,C]=kmeans(X',2);
toc
IDX=IDX';
%聚成了两类
for j=1:2
    d=0;
    for i=1:1500 
        if (IDX(:,i)==j)
           disp (i);
           d=d+1;
           PP(j,d)=i;     
        end;       
    end;
end;
%画出kmeans分解后的分类图，将X1X2保存即可
b=find(PP(1,:));
X1=X(:,b);
figure;      hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
bb=setdiff(1:1500,b);
X2=X(:,bb);
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
view(-10,10)
toc

%计算分类精度nmi.m accuracy.m hungarian.m
  accuracy_score = accuracy(IDX', true_labels)
end

