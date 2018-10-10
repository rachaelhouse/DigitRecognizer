function [trainingFeatures, trainingLabels, testingFeatures, testingLabels, trainingFeaturesMine,testingFeaturesMine] =  GetTrainingData(trainingSize, testingSize)
trainingFeaturesMine = 0;
testingFeaturesMine = 0;
SampleSize = trainingSize + testingSize;
cellSize = [4 4];
dig0 = fopen('data0','r');
dig1 = fopen('data1','r');
dig2 = fopen('data2','r');
dig3 = fopen('data3','r');
dig4 = fopen('data4','r');
dig5 = fopen('data5','r');
dig6 = fopen('data6','r');
dig7 = fopen('data7','r');
dig8 = fopen('data8','r');
dig9 = fopen('data9','r');
k = 0;
for i = 1:SampleSize
    [image] = fread(dig0,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    image = imrotate(image,270);
    image = fliplr(image);
    image = imbinarize(image);
        
    if i <= trainingSize
        [trainingFeatures(i, :),vis] = extractHOGFeatures(image, 'CellSize', cellSize);
        trainingLabels(i,1) = 0;
    else
        k = k + 1;
        testingFeatures(k, :) = extractHOGFeatures(image, 'CellSize', cellSize);
        testingLabels(k,1) = 0;
    end
    
end

fclose(dig0);

for i = (SampleSize+1):(SampleSize*2)
    [image] = fread(dig1,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    image = imrotate(image,270);
    image = fliplr(image);
    image = imbinarize(image);
    if i <= SampleSize*2 - testingSize
        [trainingFeatures(i, :),vis] = extractHOGFeatures(image, 'CellSize', cellSize);
        trainingLabels(i,1) = 1;
    else
        k = k + 1;
        testingFeatures(k, :) = extractHOGFeatures(image, 'CellSize', cellSize);
        testingLabels(k) = 1;
    end
end
fclose(dig1);

for i = (SampleSize*2 + 1):(SampleSize*3)
    [image] = fread(dig2,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    image = imrotate(image,270);
    image = fliplr(image);
    image = imbinarize(image);
    if i <= SampleSize*3 - testingSize
        [trainingFeatures(i, :),vis] = extractHOGFeatures(image, 'CellSize', cellSize);
        trainingLabels(i,1) = 2;
    else
        k = k + 1;
        testingFeatures(k, :) = extractHOGFeatures(image, 'CellSize', cellSize);
        testingLabels(k) = 2;
    end
end
fclose(dig2);

for i = (SampleSize*3 + 1):(SampleSize*4)
    [image] = fread(dig3,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    image = imrotate(image,270);
    image = fliplr(image);
    image = imbinarize(image);
    if i <= SampleSize*4 - testingSize
        [trainingFeatures(i, :),vis] = extractHOGFeatures(image, 'CellSize', cellSize);
        trainingLabels(i,1) = 3;
    else
        k = k + 1;
        testingFeatures(k, :) = extractHOGFeatures(image, 'CellSize', cellSize);
        testingLabels(k) = 3;
    end
end
fclose(dig3);

for i = (SampleSize*4 + 1):(SampleSize*5)
    [image] = fread(dig4,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    image = imrotate(image,270);
    image = fliplr(image);
    image = imbinarize(image);
    if i <= SampleSize*5 - testingSize
        [trainingFeatures(i, :),vis] = extractHOGFeatures(image, 'CellSize', cellSize);
        trainingLabels(i) = 4;
    else
        k = k + 1;
        testingFeatures(k, :) = extractHOGFeatures(image, 'CellSize', cellSize);
        testingLabels(k) = 4;
    end
end
fclose(dig4);

for i = (SampleSize*5 + 1):(SampleSize*6)
    [image] = fread(dig5,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    image = imrotate(image,270);
    image = fliplr(image);
    image = imbinarize(image);
    if i <= SampleSize*6 - testingSize
        [trainingFeatures(i, :),vis] = extractHOGFeatures(image, 'CellSize', cellSize);
        trainingLabels(i) = 5;
    else
        k = k + 1;
        testingFeatures(k, :) = extractHOGFeatures(image, 'CellSize', cellSize);
        testingLabels(k) = 5;
    end
end
fclose(dig5);

for i = (SampleSize*6 + 1):(SampleSize*7)
    [image] = fread(dig6,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    image = imrotate(image,270);
    image = fliplr(image);
    image = imbinarize(image);
    if i <= SampleSize*7 - testingSize
        [trainingFeatures(i, :),vis] = extractHOGFeatures(image, 'CellSize', cellSize);
        trainingLabels(i) = 6;
    else
        k = k + 1;
        testingFeatures(k, :) = extractHOGFeatures(image, 'CellSize', cellSize);
        testingLabels(k) = 6;
    end
end
fclose(dig6);

for i = (SampleSize*7 + 1):(SampleSize*8)
    [image] = fread(dig7,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    image = imrotate(image,270);
    image = fliplr(image);
    image = imbinarize(image);
    if i <= SampleSize*8 - testingSize
        [trainingFeatures(i, :),vis] = extractHOGFeatures(image, 'CellSize', cellSize);
        trainingLabels(i) = 7;
    else
        k = k + 1;
        testingFeatures(k, :) = extractHOGFeatures(image, 'CellSize', cellSize);
        testingLabels(k) = 7;
    end
end
fclose(dig7);

for i = (SampleSize*8 + 1):(SampleSize*9)
    [image] = fread(dig8,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    image = imrotate(image,270);
    image = fliplr(image);
    image = imbinarize(image);
    if i <= SampleSize*9 - testingSize
        [trainingFeatures(i, :),vis] = extractHOGFeatures(image, 'CellSize', cellSize);
        trainingLabels(i) = 8;
    else
        k = k + 1;
        testingFeatures(k, :) = extractHOGFeatures(image, 'CellSize', cellSize);
        testingLabels(k) = 8;
    end
end
fclose(dig8);

for i = (SampleSize*9 + 1):(SampleSize*10)
    [image] = fread(dig9,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    image = imrotate(image,270);
    image = fliplr(image);
    image = imbinarize(image);
    if i <= SampleSize*10 - testingSize
        [trainingFeatures(i, :),vis] = extractHOGFeatures(image, 'CellSize', cellSize);
        trainingLabels(i) = 9;
    else
        k = k + 1;
        testingFeatures(k, :) = extractHOGFeatures(image, 'CellSize', cellSize);
        testingLabels(k) = 9;
    end
end
fclose(dig9);
end


