%CISC 859 Digit Recognizer Project 
%Rachael House, 10090143

function DigitRecognizer()
numTrain = 80;
numTest = 20; 
fileIO(numTrain);
end

function fileIO(numData)
%Open files with digits from MNIST

%Read digits to matrices 
dig0 = fopen('data0','r');
Data0 = fread(dig0,[28 28],'uchar');
Data0 = 1 - Data0;
for i = 2:numData
    [image] = fread(dig0,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    Data0 = [Data0;image];
end
fclose(dig0);

dig1 = fopen('data1','r');
Data1 = fread(dig1,[28 28],'uchar');
Data1 = 1 - Data1;
for i = 2:numData
    [image] = fread(dig1,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    Data1 = [Data1;image];
end
fclose(dig1);

dig2 = fopen('data2','r');
Data2 = fread(dig2,[28 28],'uchar');
Data2 = 1 - Data2;
for i = 2:numData
    [image] = fread(dig2,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    Data2 = [Data2;image];
end
fclose(dig2);

dig3 = fopen('data3','r');
Data3 = fread(dig3,[28 28],'uchar');
Data3 = 1 - Data3;
for i = 2:numData
    [image] = fread(dig3,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    Data3 = [Data3;image];
end
fclose(dig3);

dig4 = fopen('data4','r');
Data4 = fread(dig4,[28 28],'uchar');
Data4 = 1 - Data4;
for i = 2:numData
    [image] = fread(dig4,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    Data4 = [Data4;image];
end
fclose(dig4);

dig5 = fopen('data5','r');
Data5 = fread(dig5,[28 28],'uchar');
Data5 = 1 - Data5;
for i = 2:numData
    [image] = fread(dig5,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    Data5 = [Data5;image];
end
fclose(dig5);

dig6 = fopen('data6','r');
Data6 = fread(dig6,[28 28],'uchar');
Data6 = 1 - Data6;
for i = 2:numData
    [image] = fread(dig6,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    Data6 = [Data6;image];
end
fclose(dig6);

dig7 = fopen('data7','r');
Data7 = fread(dig7,[28 28],'uchar');
Data7 = 1 - Data7;
for i = 2:numData
    [image] = fread(dig7,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    Data7 = [Data7;image];
end
fclose(dig7);

dig8 = fopen('data8','r');
Data8 = fread(dig8,[28 28],'uchar');
Data8 = 1 - Data8;
for i = 2:numData
    [image] = fread(dig8,[28 28],'uchar');
    %image = 1 - image;
    Data8 = [Data8;image];
end
fclose(dig8);

dig9 = fopen('data9','r');
Data9 = fread(dig9,[28 28],'uchar');
Data9 = 1 - Data9;
for i = 2:numData
    [image] = fread(dig9,[28 28],'uchar');
    image = 1 - image; %Image modification (creating negative)
    Data9 = [Data9;image];
end
fclose(dig9);

Data = [Data0; Data1; Data2; Data3; Data4;
        Data5; Data6; Data7; Data8; Data9];
%display image 
i =1;
image = Data9(1 + i*28:28+i*28,:);
image = imrotate(image,270);
image = fliplr(image);
image = 1 - image;
imshow(image)
figure()
image = imrotate(image,270);
image = fliplr(image);

image1 = Data5(1 + i*28:28+i*28,:);
image1 = imrotate(image1,270);
image1 = fliplr(image1);



conImage = Connectivety(image);

imshow(image);

blackness = BlacknessRatio(image);

BoundingBox(image);

aspectratio = AspectRatio(image);

holes = NumberHoles(image);

sym = Symmetry(image)


loc = HoleLocation(image);

%bottom = BottomBlacknessRatio(image)
%bwconncomp is a built in matlab function that can be used to find the
%connected components in a binary image 


%ConnectedData = zeros(length(Data));
%for i = 1:length(Data)
 %   ConnectedData(i) =  bwconncomp(Data(i:i*28,:));
%end 
%ConnectedData(1).NumObjects

end 

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
%this may not be right, assuming the whole image is the bounding box 
image = 1 - image;
conImage = Connectivety(image);
boxStruct = regionprops(conImage, 'BoundingBox');
box(1) = round(boxStruct.BoundingBox(1));
box(2) = round(boxStruct.BoundingBox(2));
box(3) = round(boxStruct.BoundingBox(3));
box(4) = round(boxStruct.BoundingBox(4));
rectangle('Position',[boxStruct.BoundingBox(1),boxStruct.BoundingBox(2),boxStruct.BoundingBox(3),boxStruct.BoundingBox(4)],...
'EdgeColor','r','LineWidth',2 )
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
figure;
imshow(imageFlip);
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

function lineCount = NumberofLines(image)
BW = edge(image,'canny');
[H,T,R] = hough(BW);
P  = houghpeaks(H);
lines = houghlines(BW,T,R,P);

%lineCount = sum(lines)

end


function holeloc = HoleLocation(image)
topImage = image(1:14,1:28);
bottomImage = image(14:28,1:28);
Tholes = NumberHoles(topImage);
Bholes = NumberHoles(bottomImage) * -1;
NumberHoles(image);
holeloc = Tholes + Bholes;
end

function topRatio = TopBlacknessRatio(image)
topRatio = BlacknessRatio(image(1:14,1:28));
end

function bottomRatio = BottomBlacknessRatio(image)
bottomImage = image(14:28,1:28);
bottomRatio = BlacknessRatio(bottomImage);
end


