
% S = 'Tasks U1 U2 U3 U4 U5 U6';
% 
% 
% 
% src_strname = {'A','B','C'};
% tgt_strname = {'A','B','C'};
% Data1=load("C:\Users\ming\Desktop\Experiment\1\main\Single-machine Diagnosis\U1800_f600_feature.mat");
% Data2=load("C:\Users\ming\Desktop\Experiment\1\main\Single-machine Diagnosis\U1800_0_feature.mat");
% Data3=load("C:\Users\ming\Desktop\Experiment\1\main\Single-machine Diagnosis\U1800_600_feature.mat");
% 
% label1=load("C:\Users\ming\Desktop\Experiment\1\main\Single-machine Diagnosis\label.mat");
% 
% src_str ={Data1.U1800_f600_feature,Data2.U1800_0_feature,Data3.U1800_600_feature};
% slabel_str={label1.label,label1.label,label1.label};
% tgt_str ={Data1.U1800_f600_feature,Data2.U1800_0_feature,Data3.U1800_600_feature};
% tlabel_str={label1.label,label1.label,label1.label};




%% Tasks P1 P2 P3 P4 P5 P6
% S = 'Tasks P1 P2 P3 P4 P5 P6';
% src_strname = {'0','1','2','3','4','5'};
% tgt_strname =  {'0','1','2','3','4','5'};
% Data1=load("C:\Users\ming\Desktop\Experiment\1\PDA\0-1\C_0_7_feature.mat");
% Data2=load("C:\Users\ming\Desktop\Experiment\1\PDA\0-1\C_1_4_feature.mat");
% Data3=load("C:\Users\ming\Desktop\Experiment\1\PDA\0-2\C_0_5_feature.mat");
% Data4=load("C:\Users\ming\Desktop\Experiment\1\PDA\0-2\C_2_3_feature.mat");
% Data5=load("C:\Users\ming\Desktop\Experiment\1\PDA\1-0\C_1_10_feature.mat");
% Data6=load("C:\Users\ming\Desktop\Experiment\1\PDA\1-0\C_0_5_feature.mat");
% Data7=load("C:\Users\ming\Desktop\Experiment\1\PDA\1-2\C_1_8_feature.mat");
% Data8=load("C:\Users\ming\Desktop\Experiment\1\PDA\1-2\C_2_7_feature.mat");
% Data9=load("C:\Users\ming\Desktop\Experiment\1\PDA\2-0\C_2_7_feature.mat");
% Data10=load("C:\Users\ming\Desktop\Experiment\1\PDA\2-0\C_0_6_feature.mat");
% Data11=load("C:\Users\ming\Desktop\Experiment\1\PDA\2-1\C_2_10_feature.mat");
% Data12=load("C:\Users\ming\Desktop\Experiment\1\PDA\2-1\C_1_7_feature.mat");
% 
% label1=load("C:\Users\ming\Desktop\Experiment\1\PDA\0-1\label_7.mat");
% label2=load("C:\Users\ming\Desktop\Experiment\1\PDA\0-1\label_4.mat");
% label3=load("C:\Users\ming\Desktop\Experiment\1\PDA\0-2\label_5.mat");
% label4=load("C:\Users\ming\Desktop\Experiment\1\PDA\0-2\label_3.mat");
% label5=load("C:\Users\ming\Desktop\Experiment\1\PDA\1-0\label_10.mat");
% label6=load("C:\Users\ming\Desktop\Experiment\1\PDA\1-0\C_0_5_label.mat"); 
% label7=load("C:\Users\ming\Desktop\Experiment\1\PDA\1-2\C_1_8_label.mat"); 
% label8=load("C:\Users\ming\Desktop\Experiment\1\PDA\1-2\C_2_7_label.mat");
% label9=load("C:\Users\ming\Desktop\Experiment\1\PDA\2-0\C_2_7_label.mat"); 
% label10=load("C:\Users\ming\Desktop\Experiment\1\PDA\2-0\C_0_6_label.mat"); 
% label11=load("C:\Users\ming\Desktop\Experiment\1\PDA\1-0\label_10.mat"); 
% label12=load("C:\Users\ming\Desktop\Experiment\1\PDA\2-1\C_1_7_label.mat"); 
% 
% src_str ={Data1.feature,Data3.C_00_5_feature,Data5.C_1_10_feature,Data7.C_1_8_feature,Data9.C_2_7_feature,Data11.C_2_10_feature};
% slabel_str={label1.label_7,label3.label_5,label5.label_10,label7.C_1_8_label,label9.C_2_7_label,label11.label_10};
% tgt_str ={Data2.feature,Data4.C_2_3_feature,Data6.C_0_5_feature,Data8.C_2_7_feature,Data10.C_0_6_feature,Data12.C_1_7_feature};
% tlabel_str={label2.label_4,label4.label_3,label6.C_0_5_label,label8.C_2_7_label,label10.C_0_6_label,label12.C_1_7_label};
%% P8 P10 P12
% S = 'Tasks P8 P10 P12'; 
% src_strname = {'D','E','F'};
% tgt_strname =  {'C','C','C'};
% Data1 = load("C:\Users\ming\Desktop\Experiment\1\Cross2\K_1800_f600_feature.mat");
% label1 = load("C:\Users\ming\Desktop\Experiment\1\Cross2\label.mat");
% Data2 = load("C:\Users\ming\Desktop\Experiment\1\Cross2\K_1800_600_feature.mat");
% Data3 = load("C:\Users\ming\Desktop\Experiment\1\Cross2\C_1750_0_feature.mat");
% label2 = load("C:\Users\ming\Desktop\Experiment\1\Cross2\C_1750_0_label.mat");
% Data4 = load("C:\Users\ming\Desktop\Experiment\1\Cross2\C_1750_1_feature.mat");
% Data5 = load("C:\Users\ming\Desktop\Experiment\1\Cross2\C_1750_2_feature.mat");
% 
% src_str ={Data3.C_1750_0_feature,Data4.C_1750_1_feature,Data5.C_1750_2_feature};
% slabel_str={label2.C_1750_0_label,label2.C_1750_0_label,label2.C_1750_0_label};
% tgt_str ={Data2.K_1800_600_feature,Data2.K_1800_600_feature,Data2.K_1800_600_feature};
% tlabel_str={label1.label,label1.label,label1.label}; 

%%
for i_sam = 1:length(tgt_str)
    src = src_str{i_sam};
    tgt = tgt_str{i_sam};
end
list_acc = [];
for i = 1 :length(src_str)
   for j = 1 : length(tgt_str)
        if i ~= j
            continue;
        end
        data1 = src_str{i};
        data2 = tgt_str{j};
        fprintf('%s - %s ',src_strname{i},tgt_strname{j});

        data1 = src_str{i};
        fts = data1(1:end,1:end);
        fts = fts ./ repmat(sum(fts,2),1,size(fts,2)); 
        Xs = zscore(fts, 1);
        Ys = slabel_str{i};
        
        
        data2 = tgt_str{j};
        fts = data2(1:end,1:end);
        fts = fts ./ repmat(sum(fts,2),1,size(fts,2)); 
        Xt = zscore(fts, 1);
        Yt =tlabel_str{j};
     
        options.lambda=10;
        options.p=1;
        options.eta=0.001;
        options.rho=100;
        options.T=10;

        
        [Acc1, ~] = DMA(Xs',Ys,Xt',Yt,options);
        fprintf('%2.2f\n',Acc1*100); 
        list_acc = [list_acc;Acc1*100];

   end
end
disp(S)
%mean(list_acc)
