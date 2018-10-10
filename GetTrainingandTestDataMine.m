function [ trainingLabels, testingLabels, trainingFeatures,testingFeatures] =  GetTrainingandTestDataMine(trainingSize, testingSize)

SampleSize = trainingSize + testingSize;

% trainingFeatures = zeros(trainingSize*10,8);
% testingFeatures = zeros(testingSize*10, 8);
% trainingLabels = zeros(trainingSize*10,1);
% testingLabels = zeros(testingSize*10, 1);

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
    
    %My features
    blackness = BlacknessRatio(image);
    aspectratio = AspectRatio(image);
    holes = NumberHoles(image);
    sym = Symmetry(image);
    loc = HoleLocation(image);
    cent =  centroid(image);
    or = Orrentation(image);
    
    if i <= trainingSize
        
        trainingLabels(i,1) = 0;
        trainingFeatures(i,1) = blackness;
        trainingFeatures(i,2) = aspectratio;
        trainingFeatures(i,3) = holes;
        trainingFeatures(i,4) = sym; 
        trainingFeatures(i,5) = loc;
        trainingFeatures(i,6) = cent;
        trainingFeatures(i,7) = or;
    else
        k = k + 1;
        testingFeatures(k,1) = blackness;
        testingFeatures(k,2) = aspectratio;
        testingFeatures(k,3) = holes;
        testingFeatures(k,4) = sym; 
        testingFeatures(k,5) = loc;
        testingFeatures(k,6) = cent;
        testingFeatures(k,7) = or;
        testingLabels(k,1) = 0;
    end
    
end

fclose(dig0);

for i = (SampleSize+1):(SampleSize*2)
    [image] = fread(dig1,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    
    %My features
    blackness = BlacknessRatio(image);
    aspectratio = AspectRatio(image);
    holes = NumberHoles(image);
    sym = Symmetry(image);
    loc = HoleLocation(image);
    cent =  centroid(image);
    or = Orrentation(image);
    
    if i <= SampleSize*2 - testingSize
        trainingFeatures(i,1) = blackness;
        trainingFeatures(i,2) = aspectratio;
        trainingFeatures(i,3) = holes;
        trainingFeatures(i,4) = sym; 
        trainingFeatures(i,5) = loc;
        trainingFeatures(i,6) = cent;
        trainingFeatures(i,7) = or;
        trainingLabels(i,1) = 1;
    else
        k = k + 1;
        testingFeatures(k,1) = blackness;
        testingFeatures(k,2) = aspectratio;
        testingFeatures(k,3) = holes;
        testingFeatures(k,4) = sym; 
        testingFeatures(k,5) = loc;
        testingFeatures(k,6) = cent;
        testingFeatures(k,7) = or;
        testingLabels(k) = 1;
    end
end
fclose(dig1);

for i = (SampleSize*2 + 1):(SampleSize*3)
    [image] = fread(dig2,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    
    %My features
    blackness = BlacknessRatio(image);
    aspectratio = AspectRatio(image);
    holes = NumberHoles(image);
    sym = Symmetry(image);
    loc = HoleLocation(image);
    cent =  centroid(image);
    or = Orrentation(image);
    
    if i <= SampleSize*3 - testingSize
        trainingFeatures(i,1) = blackness;
        trainingFeatures(i,2) = aspectratio;
        trainingFeatures(i,3) = holes;
        trainingFeatures(i,4) = sym; 
        trainingFeatures(i,5) = loc;
        trainingFeatures(i,6) = cent;
        trainingFeatures(i,7) = or;
        trainingLabels(i,1) = 2;
    else
        k = k + 1;
        testingFeatures(k,1) = blackness;
        testingFeatures(k,2) = aspectratio;
        testingFeatures(k,3) = holes;
        testingFeatures(k,4) = sym; 
        testingFeatures(k,5) = loc;
        testingFeatures(k,6) = cent;
        testingFeatures(k,7) = or;
        testingLabels(k) = 2;
    end
end
fclose(dig2);

for i = (SampleSize*3 + 1):(SampleSize*4)
    [image] = fread(dig3,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    %My features
    blackness = BlacknessRatio(image);
    aspectratio = AspectRatio(image);
    holes = NumberHoles(image);
    sym = Symmetry(image);
    loc = HoleLocation(image);
    cent =  centroid(image);
    or = Orrentation(image);
    
    if i <= SampleSize*4 - testingSize
        trainingFeatures(i,1) = blackness;
        trainingFeatures(i,2) = aspectratio;
        trainingFeatures(i,3) = holes;
        trainingFeatures(i,4) = sym; 
        trainingFeatures(i,5) = loc;
        trainingFeatures(i,6) = cent;
        trainingFeatures(i,7) = or;
        trainingLabels(i,1) = 3;
    else
        k = k + 1;
        testingFeatures(k,1) = blackness;
        testingFeatures(k,2) = aspectratio;
        testingFeatures(k,3) = holes;
        testingFeatures(k,4) = sym; 
        testingFeatures(k,5) = loc;
        testingFeatures(k,6) = cent;
        testingFeatures(k,7) = or;
        testingLabels(k) = 3;
    end
end
fclose(dig3);

for i = (SampleSize*4 + 1):(SampleSize*5)
    [image] = fread(dig4,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    %My features
    blackness = BlacknessRatio(image);
    aspectratio = AspectRatio(image);
    holes = NumberHoles(image);
    sym = Symmetry(image);
    loc = HoleLocation(image);
    cent =  centroid(image);
    or = Orrentation(image);
    
    if i <= SampleSize*5 - testingSize
        trainingFeatures(i,1) = blackness;
        trainingFeatures(i,2) = aspectratio;
        trainingFeatures(i,3) = holes;
        trainingFeatures(i,4) = sym; 
        trainingFeatures(i,5) = loc;
        trainingFeatures(i,6) = cent;
        trainingFeatures(i,7) = or;
        trainingLabels(i,1) = 4;
    else
        k = k + 1;
        testingFeatures(k,1) = blackness;
        testingFeatures(k,2) = aspectratio;
        testingFeatures(k,3) = holes;
        testingFeatures(k,4) = sym; 
        testingFeatures(k,5) = loc;
        testingFeatures(k,6) = cent;
        testingFeatures(k,7) = or;
        testingLabels(k) = 4;
    end
end
fclose(dig4);

for i = (SampleSize*5 + 1):(SampleSize*6)
    [image] = fread(dig5,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
   %My features
    blackness = BlacknessRatio(image);
    aspectratio = AspectRatio(image);
    holes = NumberHoles(image);
    sym = Symmetry(image);
    loc = HoleLocation(image);
    cent =  centroid(image);
    or = Orrentation(image);
    
    if i <= SampleSize*6 - testingSize
        trainingFeatures(i,1) = blackness;
        trainingFeatures(i,2) = aspectratio;
        trainingFeatures(i,3) = holes;
        trainingFeatures(i,4) = sym; 
        trainingFeatures(i,5) = loc;
        trainingFeatures(i,6) = cent;
        trainingFeatures(i,7) = or;
        trainingLabels(i,1) = 5;
    else
        k = k + 1;
        testingFeatures(k,1) = blackness;
        testingFeatures(k,2) = aspectratio;
        testingFeatures(k,3) = holes;
        testingFeatures(k,4) = sym; 
        testingFeatures(k,5) = loc;
        testingFeatures(k,6) = cent;
        testingFeatures(k,7) = or;
        testingLabels(k) = 5;
    end
end
fclose(dig5);

for i = (SampleSize*6 + 1):(SampleSize*7)
    [image] = fread(dig6,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    %My features
    blackness = BlacknessRatio(image);
    aspectratio = AspectRatio(image);
    holes = NumberHoles(image);
    sym = Symmetry(image);
    loc = HoleLocation(image);
    cent =  centroid(image);
    or = Orrentation(image);
    
    if i <= SampleSize*7 - testingSize
        trainingFeatures(i,1) = blackness;
        trainingFeatures(i,2) = aspectratio;
        trainingFeatures(i,3) = holes;
        trainingFeatures(i,4) = sym; 
        trainingFeatures(i,5) = loc;
        trainingFeatures(i,6) = cent;
        trainingFeatures(i,7) = or;
        trainingLabels(i,1) = 6;
    else
        k = k + 1;
        testingFeatures(k,1) = blackness;
        testingFeatures(k,2) = aspectratio;
        testingFeatures(k,3) = holes;
        testingFeatures(k,4) = sym; 
        testingFeatures(k,5) = loc;
        testingFeatures(k,6) = cent;
        testingFeatures(k,7) = or;
        testingLabels(k) = 6;
    end
end
fclose(dig6);

for i = (SampleSize*7 + 1):(SampleSize*8)
    [image] = fread(dig7,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    %My features
    blackness = BlacknessRatio(image);
    aspectratio = AspectRatio(image);
    holes = NumberHoles(image);
    sym = Symmetry(image);
    loc = HoleLocation(image);
    cent =  centroid(image);
    or = Orrentation(image);

    
    if i <= SampleSize*8 - testingSize
        trainingFeatures(i,1) = blackness;
        trainingFeatures(i,2) = aspectratio;
        trainingFeatures(i,3) = holes;
        trainingFeatures(i,4) = sym; 
        trainingFeatures(i,5) = loc;
        trainingFeatures(i,6) = cent;
        trainingFeatures(i,7) = or;
        trainingLabels(i,1) = 7;
    else
        k = k + 1;
        testingFeatures(k,1) = blackness;
        testingFeatures(k,2) = aspectratio;
        testingFeatures(k,3) = holes;
        testingFeatures(k,4) = sym; 
        testingFeatures(k,5) = loc;
        testingFeatures(k,6) = cent;
        testingFeatures(k,7) = or;
        testingLabels(k) = 7;
    end
end
fclose(dig7);

for i = (SampleSize*8 + 1):(SampleSize*9)
    [image] = fread(dig8,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    %My features
    blackness = BlacknessRatio(image);
    aspectratio = AspectRatio(image);
    holes = NumberHoles(image);
    sym = Symmetry(image);
    loc = HoleLocation(image);
    cent =  centroid(image);
    or = Orrentation(image);
    
    if i <= SampleSize*9 - testingSize
        trainingFeatures(i,1) = blackness;
        trainingFeatures(i,2) = aspectratio;
        trainingFeatures(i,3) = holes;
        trainingFeatures(i,4) = sym; 
        trainingFeatures(i,5) = loc;
        trainingFeatures(i,6) = cent;
        trainingFeatures(i,7) = or;
        trainingLabels(i,1) = 8;
    else
        k = k + 1;
        testingFeatures(k,1) = blackness;
        testingFeatures(k,2) = aspectratio;
        testingFeatures(k,3) = holes;
        testingFeatures(k,4) = sym; 
        testingFeatures(k,5) = loc;
        testingFeatures(k,6) = cent;
        testingFeatures(k,7) = or;

        testingLabels(k) = 8;
    end
end
fclose(dig8);

for i = (SampleSize*9 + 1):(SampleSize*10)
    [image] = fread(dig9,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    %My features
    blackness = BlacknessRatio(image);
    aspectratio = AspectRatio(image);
    holes = NumberHoles(image);
    sym = Symmetry(image);
    loc = HoleLocation(image);
    cent =  centroid(image);
    or = Orrentation(image);
   
    
    if i <= SampleSize*10 - testingSize
        trainingFeatures(i,1) = blackness;
        trainingFeatures(i,2) = aspectratio;
        trainingFeatures(i,3) = holes;
        trainingFeatures(i,4) = sym; 
        trainingFeatures(i,5) = loc;
        trainingFeatures(i,6) = cent;
        trainingFeatures(i,7) = or;
        trainingLabels(i,1) = 9;
    else
        k = k + 1;
        testingFeatures(k,1) = blackness;
        testingFeatures(k,2) = aspectratio;
        testingFeatures(k,3) = holes;
        testingFeatures(k,4) = sym; 
        testingFeatures(k,5) = loc;
        testingFeatures(k,6) = cent;
        testingFeatures(k,7) = or;
        testingLabels(k) = 9;
    end
end
fclose(dig9);
end



%My features
function binaryM = Connectivety(image)
binaryM = bwlabel(image);
end

function Bratio = BlacknessRatio(image)
box = BoundingBox(image);
image = image(box(1):box(3),box(2):box(4));
image = 1 - image;
Bratio = nnz(image)/((box(3)-box(1))*(box(4)-box(2)));
end

function box = BoundingBox(image)
image = 1 - image;
conImage = Connectivety(image);
boxStruct = regionprops(conImage, 'BoundingBox');
boxS = [boxStruct.BoundingBox];

box(1) =  round(boxS(1,1));
box(2) = round(boxS(1,2));
box(3) = round(boxS(1,3));
box(4) = round(boxS(1,4));
box(3) = min(28,(box(3) + box(1)));
box(4) = min(28,(box(4) + box(2)));
end

function cent =  centroid(image)
    image = 1 - image;
    conImage = Connectivety(image);
    cen = regionprops(conImage, 'centroid');
    cent = mean(mean(cat(1, cen.Centroid)));
    
end

function Aratio = AspectRatio(image)
box = BoundingBox(image);
Aratio = (box(3) - box(1) + 1) / (box(4) - box (2) + 1);
end

function holes = NumberHoles(image)
image = 1 - image;
conImage = Connectivety(image);
eul = bweuler(conImage,8);
holes = -1*(eul-1);
if holes < 0
    holes = 0;
end
end

function sym = Symmetry(image)
sym = 0;
count = 0;
box = BoundingBox(image);
imageFlip = imrotate(image, 180);
for i =box(1):box(3)
    for j = box(2):box(4)
        count = count + 1;
        if image(i,j) == imageFlip(i,j)
            sym = sym + 1;
        end
    end
end
sym = sym/count;
end

function holeloc = HoleLocation(image)
topImage = image(1:14,1:28);
bottomImage = image(14:28,1:28);
Tholes = NumberHoles(topImage);
Bholes = NumberHoles(bottomImage) * -1;
NumberHoles(image);
holeloc = Tholes + Bholes;
end

function orr = Orrentation(image)
image = 1 - image;
conImage = Connectivety(image);
or = regionprops(conImage, 'Orientation');
orr = mean(mean(cat(1, or.Orientation)));


end



