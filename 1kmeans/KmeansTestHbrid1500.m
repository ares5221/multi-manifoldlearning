function [ output_args ] = testKmeans( input_args )
%TESTKMEANS Summary of this function goes here
%   Detailed explanation goes here
clear;
load('X1500.mat');
%����kmeans��X���࣬�õ���IDX���Ƿ�����
%�������ʱ����Data dimension does not match dimension of centres�����ر�matlab���´򿪼���
tic;
[IDX,C]=kmeans(X',2);
toc
IDX=IDX';
%�۳�������
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
%����kmeans�ֽ��ķ���ͼ����X1X2���漴��
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

%������ྫ��nmi.m accuracy.m hungarian.m
  accuracy_score = accuracy(IDX', true_labels)
end

