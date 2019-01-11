clear ; close all; clc
filename = 'Biomechanical_Data_column_2C_weka.csv';
formatSpec = '%f%f%f%f%f%f%C';
Data2 = readtable(filename,'Delimiter',',', ...
    'Format',formatSpec);
fprintf('Decision tree For Data2\n\n');
%Take Data2 and split it into randomly selected 210 training instances and remaining 100 as test instance
[trainInd,valInd,testInd] = dividerand(310,210,0,100);
train_Data2 = Data2(trainInd,:);
test_Data2  = Data2(testInd,:);

pred = train_Data2(:,1:6);
pred = table2array(pred);
label = train_Data2(:,7);
label = table2array(label);

%Create decision trees using the training set and the “minimum records per leaf node” values of 5, 10, 15, 20, and 25. 
tree_Node5 = fitctree(pred,label,'MinLeafSize',5);
tree_Node10= fitctree(pred,label,'MinLeafSize',10);
tree_Node15= fitctree(pred,label,'MinLeafSize',15);
tree_Node20= fitctree(pred,label,'MinLeafSize',20);
tree_Node25= fitctree(pred,label,'MinLeafSize',25);

%Show the tree for the value 25. Comment on what you notice about the five trees.
view(tree_Node25,'Mode','graph');
test_pred = test_Data2(:,1:6);
test_pred = table2array(test_pred);


tree = {tree_Node5 tree_Node10 tree_Node15 tree_Node20 tree_Node25};
%For each tree compute and report the accuracy, precision, and recall values. Comment on the comparison of these values and show these values on a plot.
for i = 1:5
    fprintf('For Decision tree with minimum records per leaf = %d \n',i * 5);
    test_predict = predict(tree{i},test_pred);
    test_label = test_Data2(:,7);
    test_label = table2array(test_label);

    idx1 = (test_label == 'Normal');
    idx2 = (test_label == 'Abnormal');

    p = length(test_label(idx1));
    n = length(test_label(idx2));
    N = p+n;
    tp = sum(test_label(idx1)==test_predict(idx1));
    tn = sum(test_label(idx2)==test_predict(idx2));
    fp = n-tn;
    fn = p-tp;
    accuracy = (tp+tn)/N;
    acc(i) = accuracy;
    precision = tp/(tp+fp);
    prec(i) = precision;
    recall = tp/p;
    rec(i) = recall;
    fprintf('accuracy =  %f.... \t precision = %f.... \t recall = %f\n\n',accuracy,precision,recall);
end
x=[5 10 15 20 25];
plot(x,acc,'g',x,prec,'b',x,rec,'c')
xlabel('minimum records per leaf');
ylabel('Accuracy/Precision/Recall values');
legend('accuracy','precision','recall');
title('Plot for Data2');

%Now limit yourself to the case of 10 minimum records per leaf node. 
%Repeat the tree learning exercise five times by randomly choosing different sets of 210 training instances.
%Report the accuracy, precision, and recall values for each run and also their averages and standard deviations

fprintf('For Decision tree with 10 minimum records per leaf\n');
for i = 1:5
    fprintf('For %d random run\n',i);
    [trainInd,valInd,testInd] = dividerand(310,210,0,100);
    train_Data2 = Data2(trainInd,:);
    test_Data2  = Data2(testInd,:);
    pred = train_Data2(:,1:6);
    pred = table2array(pred);
    label = train_Data2(:,7);
    label = table2array(label);
    tree_Node10= fitctree(pred,label,'MinLeafSize',10);

    test_pred = test_Data2(:,1:6);
    test_pred = table2array(test_pred);
    test_predict = predict(tree_Node10,test_pred);
    test_label = test_Data2(:,7);
    test_label = table2array(test_label);

    idx1 = (test_label == 'Normal');
    idx2 = (test_label == 'Abnormal');
    p = length(test_label(idx1));
    n = length(test_label(idx2));
    N = p+n;
    tp = sum(test_label(idx1)==test_predict(idx1));
    tn = sum(test_label(idx2)==test_predict(idx2));
    fp = n-tn;
    fn = p-tp;
    accuracy = (tp+tn)/N;
    acc(i) = accuracy;
    precision = tp/(tp+fp);
    prec(i) = precision;
    recall = tp/p;
    rec(i) = recall;
    fprintf('accuracy =  %f \t precision = %f \t recall = %f\n\n',accuracy,precision,recall);
end

%averages and standard deviations
fprintf('Average and standard Daviation calculation\n')
fprintf('average of accuracy =  %f \t average of precision = %f \t average of recall = %f\n', mean(acc),mean(prec),mean(recall));
fprintf('std of accuracy =  %f \t     std of precision = %f \t     std ofrecall = %f\n\n',std(acc),std(prec),std(rec));



%Repeat the same tasks as done in Question-1 above for Data3

fprintf('\n\nDecision tree For Data3 \n\n');
filename = 'BiomechanicalData_column_3C_weka.csv';
formatSpec = '%f%f%f%f%f%f%C';
Data3 = readtable(filename,'Delimiter',',', ...
    'Format',formatSpec);

%Take Data2 and split it into randomly selected 210 training instances and remaining 100 as test instance
[trainInd,valInd,testInd] = dividerand(310,210,0,100);
train_Data3 = Data3(trainInd,:);
test_Data3  = Data3(testInd,:);

pred = train_Data3(:,1:6);
pred = table2array(pred);
label = train_Data3(:,7);
label = table2array(label);

%Create decision trees using the training set and the “minimum records per leaf node” values of 5, 10, 15, 20, and 25. 
tree_Node5 = fitctree(pred,label,'MinLeafSize',5);
tree_Node10= fitctree(pred,label,'MinLeafSize',10);
tree_Node15= fitctree(pred,label,'MinLeafSize',15);
tree_Node20= fitctree(pred,label,'MinLeafSize',20);
tree_Node25= fitctree(pred,label,'MinLeafSize',25);

%Show the tree for the value 25. Comment on what you notice about the five trees.
view(tree_Node25,'Mode','graph')
test_pred = test_Data3(:,1:6);
test_pred = table2array(test_pred);


tree = {tree_Node5 tree_Node10 tree_Node15 tree_Node20 tree_Node25};
%For each tree compute and report the accuracy, precision, and recall values. Comment on the comparison of these values and show these values on a plot.
for i = 1:5
    fprintf('For Decision tree with minimum records per leaf = %d\n',i*5);
    test_predict = predict(tree{i},test_pred);
    test_label = test_Data3(:,7);
    test_label = table2array(test_label);

    idx1 = (test_label == 'Hernia');
    idx2 = (test_label == 'Spondylolisthesis');
    idx3 = (test_label == 'Normal');

    H = length(test_label(idx1));
    S = length(test_label(idx2));
    Nr = length(test_label(idx3));
    N = H + S + Nr;
    th = sum(test_label(idx1)==test_predict(idx1));
    ts = sum(test_label(idx2)==test_predict(idx2));
    tn = sum(test_label(idx3)==test_predict(idx3));
    fpH = S + Nr - ts - tn;
    fpS = H + Nr - th - tn;
    fpN = S + H - ts - th;
    accuracy = (th + ts + tn)/ N;
    acc(i) = accuracy;
    precision_Hernia = th/(th+fpH);
    prec(i)=  precision_Hernia;
    precision_Spondy = ts/(ts+fpS);
    precision_Normal = tn/(tn+fpN);
    
    recall_Hernia = th/H;
    rec(i)= recall_Hernia;
    recall_Spondy = ts/S;
    recall_Normal = tn/Nr;

    fprintf('For Hernia class,           accuracy =  %f \t precision = %f \t recall = %f\n',accuracy,precision_Hernia,recall_Hernia);
    fprintf('For Spondylolistesis class, accuracy =  %f \t precision = %f \t recall = %f\n',accuracy,precision_Spondy,recall_Spondy);
    fprintf('For Normal class,           accuracy =  %f \t precision = %f \t recall = %f\n\n',accuracy,precision_Normal,recall_Normal);
end

figure(2);
x=[5 10 15 20 25];
plot(x,acc,'g',x,prec,'b',x,rec,'c')
xlabel('minimum records per leaf');
ylabel('Accuracy/Precision/Recall values for Hernia');
legend('accuracy','precision','recall');
title('Plot for Data3');


%Now limit yourself to the case of 10 minimum records per leaf node. 
%Repeat the tree learning exercise five times by randomly choosing different sets of 210 training instances.
%Report the accuracy, precision, and recall values for each run and also their averages and standard deviations

fprintf('For Decision tree with 10 minimum records per leaf\n');
for i = 1:5
    fprintf('For %d random run\n',i);
    [trainInd,valInd,testInd] = dividerand(310,210,0,100);
    train_Data3 = Data3(trainInd,:);
    test_Data3  = Data3(testInd,:);
    pred = train_Data3(:,1:6);
    pred = table2array(pred);
    label = train_Data3(:,7);
    label = table2array(label);
    tree_Node10= fitctree(pred,label,'MinLeafSize',10);

    test_pred = test_Data3(:,1:6);
    test_pred = table2array(test_pred);
    test_predict = predict(tree_Node10,test_pred);
    test_label = test_Data3(:,7);
    test_label = table2array(test_label);

    idx1 = (test_label == 'Hernia');
    idx2 = (test_label == 'Spondylolisthesis');
    idx3 = (test_label == 'Normal');
    
    H = length(test_label(idx1));
    S = length(test_label(idx2));
    Nr = length(test_label(idx3));
    N = H + S + Nr;
    th = sum(test_label(idx1)==test_predict(idx1));
    ts = sum(test_label(idx2)==test_predict(idx2));
    tn = sum(test_label(idx3)==test_predict(idx3));
    fpH = S + Nr - ts - tn;
    fpS = H + Nr - th - tn;
    fpN = S + H - ts - th;
    accuracy = (th + ts + tn)/ N;
    acc(i) = accuracy;
    precision_Hernia = th/(th+fpH);
    prec(i)= precision_Hernia; 
    precision_Spondy = ts/(ts+fpS);
    prec_S(i) = precision_Spondy;
    precision_Normal = tn/(tn+fpN);
    prec_N(i) = precision_Normal;
    
    recall_Hernia = th/H;
    rec(i)= recall_Hernia;
    recall_Spondy = ts/S;
    rec_S(i) = recall_Spondy;
    recall_Normal = tn/Nr;
    rec_N(i) = recall_Normal;
   
    fprintf('For Hernia class,           accuracy =  %f \t precision = %f \t recall = %f\n',accuracy,precision_Hernia,recall_Hernia);
    fprintf('For Spondylolistesis class, accuracy =  %f \t precision = %f \t recall = %f\n',accuracy,precision_Spondy,recall_Spondy);
    fprintf('For Normal class,           accuracy =  %f \t precision = %f \t recall = %f\n\n',accuracy,precision_Normal,recall_Normal);
end

%averages and standard deviations
fprintf('Average and standard Daviation calculation(precision and Recall for Hernia class)\n')
fprintf('average of accuracy =  %f \t average of precision = %f \t average of recall = %f\n', mean(acc),mean(prec),mean(rec));
fprintf('std of accuracy =  %f \t     std of precision = %f \t     std ofrecall = %f\n\n',std(acc),std(prec),std(rec));
fprintf('Average and standard Daviation calculation(precision and Recall for Spondylolisthesis class)\n')
fprintf('average of accuracy =  %f \t average of precision = %f \t average of recall = %f\n', mean(acc),mean(prec_S),mean(rec_S));
fprintf('std of accuracy =  %f \t     std of precision = %f \t     std ofrecall = %f\n\n',std(acc),std(prec_S),std(rec_S));
fprintf('Average and standard Daviation calculation(precision and Recall for Normal class)\n')
fprintf('average of accuracy =  %f \t average of precision = %f \t average of recall = %f\n', mean(acc),mean(prec_N),mean(rec_N));
fprintf('std of accuracy =  %f \t     std of precision = %f \t     std ofrecall = %f\n\n',std(acc),std(prec_N),std(rec_N));


%Take Data2 for this question. 
%Partition each column into four sets of equal widths of values. Assign these intervals as values 0, 1, 2, and 3 and replace each value by its corresponding interval value. 

Data = table2array(Data2(:,1:6));
binSize = floor(size(Data,1)/4);
c = (0:binSize:308);
c(1) = 1;

% partitioning 1st coloumn 
col_1 = sort(Data(:,1));
edges1 = col_1(c);
edges1(size(edges1,1)) = max(col_1);
col_1 = discretize(sort(Data(:,1)),edges1,[0,1,2,3]);

% partitioning 2nd coloumn 
col_2 = sort(Data(:,2));
edges2 = col_2(c);
edges2(size(edges2,1)) = max(col_2);
col_2 = discretize(sort(Data(:,2)),edges2,[0,1,2,3]);

% partitioning 3rd coloumn 
col_3 = sort(Data(:,3));
edges3 = col_3(c);
edges3(size(edges3,1)) = max(col_3);
col_3 = discretize(sort(Data(:,3)),edges3,[0,1,2,3]);

% partitioning 4th coloumn 
col_4 = sort(Data(:,4));
edges4 = col_4(c);
edges4(size(edges4,1)) = max(col_4);
col_4 = discretize(sort(Data(:,4)),edges4,[0,1,2,3]);

% partitioning 5th coloumn 
col_5 = sort(Data(:,5));
edges5 = col_5(c);
edges5(size(edges5,1)) = max(col_5);
col_5 = discretize(sort(Data(:,5)),edges5,[0,1,2,3]);

% partitioning 6th coloumn 
col_6 = sort(Data(:,6));
edges6 = col_6(c);
edges6(size(edges6,1)) = max(col_6);
col_6 = discretize(sort(Data(:,6)),edges6,[0,1,2,3]);


edges = [edges1 edges2 edges3 edges4 edges5 edges6];
Header = Data2.Properties.VariableNames;
for j = 1:6
    fprintf('Boundaries for - %s\n',Header{j});
    for i = 1:4
        fprintf('%f - %f : %d \n',edges(i,j),edges(i + 1,j),i-1);
    end
end

new_Data = [col_1 col_2 col_3 col_4 col_5 col_6 ];
label = sort(table2array(Data2(:,7)));
fprintf('\nFor Decision tree with 10 minimum records per leaf\n');

for i = 1:5
    fprintf('For %d random run\n',i);
    [trainInd,valInd,testInd] = dividerand(310,210,0,100);
    train_Data2 = new_Data(trainInd,:);
    test_Data2  = new_Data(testInd,:);
    pred = train_Data2;
    train_label = label(trainInd,:);
    tree_Node10= fitctree(pred,train_label,'MinLeafSize',10);

    test_pred = test_Data2;
    test_predict = predict(tree_Node10,test_pred);
    test_label = label(testInd,:);

    idx1 = (test_label == 'Normal');
    idx2 = (test_label == 'Abnormal');
    p = length(test_label(idx1));
    n = length(test_label(idx2));
    N = p+n;
    tp = sum(test_label(idx1)==test_predict(idx1));
    tn = sum(test_label(idx2)==test_predict(idx2));
    fp = n-tn;
    fn = p-tp;
    accuracy = (tp+tn)/N;
    acc(i) = accuracy;
    precision = tp/(tp+fp);
    prec(i) = precision;
    recall = tp/p;
    rec(i) = recall;
    fprintf('accuracy =  %f \t precision = %f \t recall = %f\n\n',accuracy,precision,recall);
end
view(tree_Node10,'Mode','graph')
%averages and standard deviations
fprintf('Average and standard Daviation calculation for transformed data\n')
fprintf('average of accuracy =  %f \t average of precision = %f \t average of recall = %f\n', mean(acc),mean(prec),mean(recall));
fprintf('std of accuracy =  %f \t     std of precision = %f \t     std ofrecall = %f\n\n',std(acc),std(prec),std(rec));

