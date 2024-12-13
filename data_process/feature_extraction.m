clc
clear 
H=load("C:\Users\ming\Desktop\CRWU凯斯西储大学轴承数据\CRWU\特征提取\C_1750_0_data.mat");
H1=load("C:\Users\ming\Desktop\CRWU凯斯西储大学轴承数据\CRWU\特征提取\C_1750_1_data.mat");
H2=load("C:\Users\ming\Desktop\CRWU凯斯西储大学轴承数据\CRWU\特征提取\C_1750_2_data.mat");
% H3=load("C:\Users\ming\Desktop\CRWU凯斯西储大学轴承数据\CRWU\特征提取\K_1800_f600_data.mat");
% H4=load("C:\Users\ming\Desktop\CRWU凯斯西储大学轴承数据\CRWU\特征提取\K_1800_0_data.mat");
% H5=load("C:\Users\ming\Desktop\CRWU凯斯西储大学轴承数据\CRWU\特征提取\K_1800_600_data.mat");

x=H.C_1750_0_data;
x1=H1.C_1750_1_data;
x2=H2.C_1750_2_data;
% x3=H3.K_1800_f600_data;
% x4=H4.K_1800_0_data;
% x5=H5.K_1800_600_data;
% x2=A.ZC_C_data;
% 
% for i=1:1155
%     x(1155+i,:)=x2(i,:);
%     x(2310+i,:)=x1(i,:);
% end



fs=12000;%采样频率
Ts=1/fs;%采样周期
L=1024;%采样点数 
t=(0:L-1)*Ts;%时间序列
STA=1; %采样起始位置
n=100; %样本个数
N=1024;%样本点数

 for j=1:n
       X(:,j)=abs(hilbert(x(j,:)));
       f=(0:N-1)/fs;
       f=f';
       time(j,:)=time_statistical_compute(X(:,j));%%%%%%%多维矩阵计算时域特征矩阵
       xfft(:,j)=fft(X(:,j),N)/N;
       y(:,j)=2*abs(xfft(:,j));
       fre(j,:)=fre_statistical_compute(f,y(:,j));%%%%%%%多维矩阵计算频域特征矩阵
       feature1(j,:)=[time(j,:),fre(j,:)];%
end
C_1750_0_feature=feature1;
% % 
for j=1:n
       X(:,j)=abs(hilbert(x1(j,:)));
       f=(0:N-1)/fs;
       f=f';
       time(j,:)=time_statistical_compute(X(:,j));%%%%%%%多维矩阵计算时域特征矩阵
       xfft(:,j)=fft(X(:,j),N)/N;
       y(:,j)=2*abs(xfft(:,j));
       fre(j,:)=fre_statistical_compute(f,y(:,j));%%%%%%%多维矩阵计算频域特征矩阵
       feature2(j,:)=[time(j,:),fre(j,:)];
end
C_1750_1_feature=feature2;
% % % 
for j=1:n
       X(:,j)=abs(hilbert(x2(j,:)));
       f=(0:N-1)/fs;
       f=f';
       time(j,:)=time_statistical_compute(X(:,j));%%%%%%%多维矩阵计算时域特征矩阵
       xfft(:,j)=fft(X(:,j),N)/N;
       y(:,j)=2*abs(xfft(:,j));
       fre(j,:)=fre_statistical_compute(f,y(:,j));%%%%%%%多维矩阵计算频域特征矩阵
       feature3(j,:)=[time(j,:),fre(j,:)];
end
C_1750_2_feature=feature3;
% % % 
% for j=1:n
%        X(:,j)=abs(hilbert(x3(j,:)));
%        f=(0:N-1)/fs;
%        f=f';
%        time(j,:)=time_statistical_compute(X(:,j));%%%%%%%多维矩阵计算时域特征矩阵
%        xfft(:,j)=fft(X(:,j),N)/N;
%        y(:,j)=2*abs(xfft(:,j));
%        fre(j,:)=fre_statistical_compute(f,y(:,j));%%%%%%%多维矩阵计算频域特征矩阵
%        feature4(j,:)=[time(j,:),fre(j,:)];
% end
% K_1800_f600_feature=feature4;
% % 
% for j=1:n
%        X(:,j)=abs(hilbert(x4(j,:)));
%        f=(0:N-1)/fs;
%        f=f';
%        time(j,:)=time_statistical_compute(X(:,j));%%%%%%%多维矩阵计算时域特征矩阵
%        xfft(:,j)=fft(X(:,j),N)/N;
%        y(:,j)=2*abs(xfft(:,j));
%        fre(j,:)=fre_statistical_compute(f,y(:,j));%%%%%%%多维矩阵计算频域特征矩阵
%        feature5(j,:)=[time(j,:),fre(j,:)];
% end
% K_1800_0_feature=feature5;
% % 
% for j=1:n
%        X(:,j)=abs(hilbert(x5(j,:)));
%        f=(0:N-1)/fs;
%        f=f';
%        time(j,:)=time_statistical_compute(X(:,j));%%%%%%%多维矩阵计算时域特征矩阵
%        xfft(:,j)=fft(X(:,j),N)/N;
%        y(:,j)=2*abs(xfft(:,j));
%        fre(j,:)=fre_statistical_compute(f,y(:,j));%%%%%%%多维矩阵计算频域特征矩阵
%        feature6(j,:)=[time(j,:),fre(j,:)];
% end
% K_1800_600_feature=feature6;

% OL_2400_0 = [B0_feature,B1_feature,B2_feature,B3_feature,B4_feature,B5_feature]';
save('C_1750_0_feature','C_1750_0_feature');
save('C_1750_1_feature','C_1750_1_feature');
save('C_1750_2_feature','C_1750_2_feature');
% save('K_1800_f600_feature','K_1800_f600_feature');
% save('K_1800_0_feature','K_1800_0_feature');
% save('K_1800_600_feature','K_1800_600_feature');