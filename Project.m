head(student_mat)
summary(student_mat)

student_mat.PassFail = student_mat.G3 >= 10;
Y = double(student_mat.PassFail);   
X = removevars(student_mat, {'G3','PassFail'});

varNames = X.Properties.VariableNames;
for i = 1:length(varNames)
    if iscategorical(X.(varNames{i})) || iscell(X.(varNames{i})) || isstring(X.(varNames{i}))
        % convert to string first
        temp = string(X.(varNames{i}));
        % manual encoding
        [~,~,idx] = unique(temp);
        X.(varNames{i}) = idx;
    end
end

X = table2array(X);
Y = double(student_mat.G3 >= 10);
k = 5;
YPred_knn = zeros(size(YTest));

for i = 1:size(XTest,1)
    dist = sqrt(sum((XTrain - XTest(i,:)).^2, 2));
    [~, idxSort] = sort(dist);
    YPred_knn(i) = mode(YTrain(idxSort(1:k)));
end

acc_knn = mean(YPred_knn == YTest);
disp(['KNN Accuracy: ', num2str(acc_knn)]);

g2_index = find(strcmp(varNames,'G2'));

YPred_tree = XTest(:,g2_index) >= 10;
acc_tree = mean(YPred_tree == YTest);

disp(['Decision Rule Accuracy: ', num2str(acc_tree)]);

w = rand(size(XTrain,2),1);
b = 0;

YPred_svm = XTest*w + b >= mean(XTrain*w);

acc_svm = mean(YPred_svm == YTest);
disp(['Linear Model Accuracy: ', num2str(acc_svm)]);

numTrees = 20;
preds = zeros(length(YTest), numTrees);

for t = 1:numTrees
    feat = randi(size(XTrain,2));
    threshold = median(XTrain(:,feat));
    preds(:,t) = XTest(:,feat) >= threshold;
end

YPred_rf = mode(preds,2);

acc_rf = mean(YPred_rf == YTest);
disp(['Random Forest Accuracy: ', num2str(acc_rf)]);

Model = {'KNN'; 'Decision Rule'; 'Linear Model'; 'Random Forest'};
Accuracy = [acc_knn; acc_tree; acc_svm; acc_rf];

table(Model, Accuracy)

bar(Accuracy)
set(gca,'XTickLabel',Model)
ylabel('Accuracy')
title('Model Comparison (No Toolbox)')

corrVals = zeros(1,size(XTrain,2));
for i = 1:size(XTrain,2)

    x = XTrain(:,i);
    y = YTrain;

    x = x - mean(x);
    y = y - mean(y);

    numerator = sum(x .* y);
    denominator = sqrt(sum(x.^2) * sum(y.^2));
    corrVals(i) = abs(numerator / denominator);
end
[~, idx] = sort(corrVals,'descend');
topFeatures = idx(1:10);

XTrain = XTrain(:,topFeatures);
XTest = XTest(:,topFeatures);