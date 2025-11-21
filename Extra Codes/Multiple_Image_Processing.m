clc; clear; close all;

files = {'road1.jpg', 'road2.jpg', 'road3.jpg'};

for k = 1 : numel(files)
    imgPath = files{k};
    fprintf('Processing: %s\n', imgPath);
    processRoad(imgPath);   
    pause(1.0);             
end
