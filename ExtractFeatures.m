function ExtractFeatures()
tic
trainingSize = 800;
testingSize= 200;
tic
[trainingFeatures, trainingLabels, testingFeatures, testingLabels, trainingFeaturesMine, testingFeaturesMine] =  GetTrainingData(trainingSize, testingSize);
toc
tic
treesClassifer = TreeBagger(75,trainingFeatures,trainingLabels,'OOBPrediction','On','Method','classification');
toc
%view(treesClassifer.Trees{1},'Mode', 'graph')
bagError = oobError(treesClassifer);
figure()
plot(bagError)
xlabel 'Number of grown trees';
ylabel 'Out-of-bag classification error';
title 'Hog Feature Set';
tic
predictions = predict(treesClassifer, testingFeatures);
toc
count = 0;
correct = 0;
for i=1:length(predictions)
    count = count + 1;
    if str2double(predictions{i}) == testingLabels(i)
        correct = correct  +1;
    end
end
size(testingFeatures(1,:))
correct
count
precentCorrect = (correct/count)*100
toc        

end