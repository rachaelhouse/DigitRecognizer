function ExtractFeaturesDecisionTree()

trainingSize = 600;
testingSize= 200;
tic
[trainingFeatures, trainingLabels, testingFeatures, testingLabels, trainingFeaturesMine, testingFeaturesMine] =  GetTrainingData(trainingSize, testingSize);
toc
%treesClassifer = TreeBagger(75,trainingFeatures,trainingLabels,'OOBPrediction','On','Method','classification');
tic
treesClassifer = fitctree(trainingFeatures, trainingLabels);
toc
%view(treesClassifer.Trees{1},'Mode', 'graph')
% bagError = oobError(treesClassifer);
% figure()
% plot(bagError)
% xlabel 'Number of grown trees';
% ylabel 'Out-of-bag classification error';
% title 'Hog Feature Set';
tic
predictions = predict(treesClassifer, testingFeatures);
toc
count = 0;
correct = 0;
for i=1:length(predictions)
    count = count + 1;
    if predictions(i) == testingLabels(i)
        correct = correct  +1;
    end
end
size(testingFeatures(1,:))
correct
count
precentCorrect = (correct/count)*100
        
end