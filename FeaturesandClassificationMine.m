function FeaturesandClassificationMine()
tic
trainingSize = 600;
testingSize= 200;
tic
[ trainingLabels, testingLabels, trainingFeatures,testingFeatures] =  GetTrainingandTestDataMine(trainingSize, testingSize);
toc
tic
treesClassifer = TreeBagger(75,trainingFeatures,trainingLabels,'OOBPrediction','On','Method','classification');
toc
view(treesClassifer.Trees{1},'Mode', 'graph')
bagError = oobError(treesClassifer);
figure()
plot(bagError)
xlabel 'Number of grown trees';
ylabel 'Out-of-bag classification error';
title 'My Feature Set';
tic
predictions = predict(treesClassifer, testingFeatures);
toc
count = 0;
correct = 0;
for i=1:(length(testingLabels))
    count = count + 1;
    if str2double(predictions{i}) == testingLabels(i)
        correct = correct  +1;
    end
end
correct
count
precentCorrect = (correct/count)*100
toc

end