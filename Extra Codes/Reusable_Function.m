function processRoad(imgPath)

I = imread(imgPath);
I_rgb = I;

if size(I,3)==3
    Igray = rgb2gray(I);
else
    Igray = I;
end

Igray = im2double(Igray);
Igray = imadjust(Igray);
Iblur = imgaussfilt(Igray, 2);

BW = edge(Iblur,'canny');

[rows,cols] = size(BW);
mask = false(rows, cols);
mask(round(rows*0.55):rows, :) = true;
BW = BW & mask;

[H,T,R] = hough(BW);
P = houghpeaks(H, 7);
lines = houghlines(BW, T, R, P);

figure;
subplot(1,2,1);
imshow(BW);
title('Road Feature Map');

subplot(1,2,2);
imshow(I_rgb);
title('Lane Markings');
hold on;
for i = 1:length(lines)
    p1 = lines(i).point1;
    p2 = lines(i).point2;
    dx = p2(1) - p1(1);
    dy = p2(2) - p1(2);
    slope = dy / (dx + eps);
    if abs(slope) > 0.4
        plot([p1(1) p2(1)], [p1(2) p2(2)], 'y', 'LineWidth', 3);
    end
end
hold off;
end
