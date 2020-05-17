%--------------------------------------------------------------------------
% SGN-34006 3D and Virtual Reality
%
%
% Your implementation should run by executing this m-file ("run LW2.m"), 
% but feel free to create additional files for your own functions
% Make sure it runs without errors after unzipping

% Fill out the information below

% Group members: Elodie Charitat, Romain Husson, Jinhyeok Yoo
% Additional tasks completed (5, 6, 7, 8):

% Fill in your implementation at the assigned slots. You can use the 
% existing drawing scripts or draw your own figures. 
% To give an impression of the scope of each task, 
% the number of lines of code in the reference implementation is given
% This is highly subjective depending on coding style, and should not
% be considered as a requirement. Use as much code as you need, but if you
% start having 10 times the lines, you may consider that there might be an
% easier way to do it.
%--------------------------------------------------------------------------

load synthdata

%% [synthdata] Task 1: Plotting global point cloud (8 lines of code)
% Back projection from PMD image plane to global space 

% Open a distance map, and a 2D color frame, and show them
figure;
subplot(1,2,1), imshow(Depth,[8,21]), title('distance map from the depth camera');
subplot(1,2,2), imshow(Image), title('2D color frame from the center camera');

% List all coordinates
%       u1  u2
% X = [ v1  v2  ...  ]
%       m1  m2 
% and adjust the center to (0,0)
% and compute the global (x,y,z)-coordinates for each pixel
% using these equation z = m*f / sqrt(u1^2+v1^2+f^2), (x,y) = (u,v)*z / f
Df = Dparam.f/Dparam.pixelsize;  % matches with the pixel units
for i = 1:size(Depth,1)
    for j = 1:size(Depth,2)
        pixel = (i-1)*size(Depth,2)+j;  % current pixel
        X(:,pixel) = [j-Dparam.cx; i-Dparam.cy; Depth(i,j)];
        X(3,pixel) = X(3,pixel)*Df / sqrt(X(1,pixel)^2 + X(2,pixel)^2 + Df^2);
        X(1:2,pixel) = X(1:2,pixel).*X(3,pixel)./Df;
    end
end

% Plotting
figure; hold on;
scatter3(X(1, :), X(2, :), X(3, :), 10, X(3, :));
scatter3(0, 0, 0, 500, 'rx')
title('Task 1: Point cloud in global (x,y,z) space');
set(gca,'YDir','reverse');
set(gca,'ZDir','reverse');
axis equal
drawnow;

%% [synthdata] Task 2: Projection to color camera image plane (5 lines of code)

% Matches with the pixel units
Cfx = Cparam.fx/Cparam.pixelsize;
Cfy = Cparam.fy/Cparam.pixelsize;

for i=1:numel(Depth)
    Xrt(:,i) = R*X(:,i) + T;
    u_colorcam(i) = Cfx*Xrt(1,i)/Xrt(3,i) + Cparam.cx;
    v_colorcam(i) = Cfy*Xrt(2,i)/Xrt(3,i) + Cparam.cy;
    z_colorcam(i) = Xrt(3,i);
end

% Plotting
figure; axis equal
imshow(Image, []); hold on; %#ok<*NODEF>

% Only drawing the objects in front to check alignment
objectmask = z_colorcam<13;
sc = scatter(u_colorcam(objectmask), v_colorcam(objectmask), 10, z_colorcam(objectmask), 'filled');
sc.MarkerEdgeAlpha = 0.1;
sc.MarkerFaceAlpha = 0.1;
title( 'Task 2: Global depth points projected on image plane of the color camera');
drawnow;

%% [synthdata] Task 3: Resampling projected data (3 lines of code)

F = scatteredInterpolant(double(u_colorcam'),double(v_colorcam'),double(z_colorcam'),'nearest');

dimImg = size(Image);
[xq,yq] = meshgrid(1:dimImg(2), 1:dimImg(1));

z_colorcam_reg = F(xq,yq);

% Plotting
figure;
subplot( 131); imshow( Image, []); title('Task 3: Original color image')
subplot( 132); imshow( z_colorcam_reg, []); title('Task 3: Resampled depth image');
subplot( 133); imshowpair( Image, z_colorcam_reg); title('Task 3: Resampled depth on original color')

%% [synthdata] Task 4: Visualizing combined depth/color data

% Well, actually, this one is just plotting so you're done already
figure; 
surf(z_colorcam_reg, double(Image), 'EdgeColor', 'none')
set(gca,'ZDir','reverse');
set(gca,'YDir','reverse');
title( 'Task 4: 3D mesh generated from resampled depth')
drawnow;

%%

clear

load KinectData

%% [KinectData] Task 1: Plotting global point cloud (8 lines of code)
% Back projection from PMD image plane to global space 
Depth = im2single(Depth);
Image = im2single(Image);

% Open a distance map, and a 2D color frame, and show them
figure;
subplot(1,2,1), imshow(Depth), title('distance map from the depth camera');
subplot(1,2,2), imshow(Image), title('2D color frame from the center camera');


% List all coordirnates
%       u1  u2
% X = [ v1  v2  ...  ]
%       z1  z2 
% and adjust the center to (0,0)
% and compute the global (x,y,z)-coordinates for each pixel
% using these equation z = m*f / sqrt(u1^2+v1^2+f^2), (x,y) = (u,v)*z / f
for i = 1:size(Depth,1)
    for j = 1:size(Depth,2)
        pixel = (i-1)*size(Depth,2)+j;  % current pixel
        X(:,pixel) = [j-Dparam.cx; i-Dparam.cy; Depth(i,j)];
        X(1,pixel) = X(1,pixel).*X(3,pixel)./Dparam.fx;
        X(2,pixel) = X(2,pixel).*X(3,pixel)./Dparam.fy;
    end
end

% Plotting
figure; hold on;
scatter3(X(1, :), X(2, :), X(3, :), 10, X(3, :));
scatter3(0, 0, 0, 500, 'rx')
title('Task 1: Point cloud in global (x,y,z) space');
set(gca,'YDir','reverse');
set(gca,'ZDir','reverse');
axis equal
drawnow;

%% [KinectData] Task 2: Projection to color camera image plane (5 lines of code)

for i=1:numel(Depth)
    Xrt(:,i) = R*X(:,i) + T;
    u_colorcam(i) = Cparam.fx*Xrt(1,i)/Xrt(3,i) + Cparam.cx;
    v_colorcam(i) = Cparam.fy*Xrt(2,i)/Xrt(3,i) + Cparam.cy;
    z_colorcam(i) = Xrt(3,i);
end

% Plotting
figure; axis equal
imshow(Image, []); hold on; %#ok<*NODEF>

% Only drawing the objects in front to check alignment
objectmask = z_colorcam<1;
sc = scatter(u_colorcam(objectmask), v_colorcam(objectmask), 10, z_colorcam(objectmask), 'filled');
sc.MarkerEdgeAlpha = 0.1;
sc.MarkerFaceAlpha = 0.1;
title( 'Task 2: Global depth points projected on image plane of the color camera');
drawnow;

%% [KinectData] Task 3: Resampling projected data (3 lines of code)


F = scatteredInterpolant(double(u_colorcam'),double(v_colorcam'),double(z_colorcam'),'nearest');

dimImg = size(Image);
[xq,yq] = meshgrid(1:dimImg(2), 1:dimImg(1));

z_colorcam_reg = F(xq,yq);


% Plotting
figure;
subplot( 131); imshow( Image, []); title('Task 3: Original color image')
subplot( 132); imshow( z_colorcam_reg, []); title('Task 3: Resampled depth image');
subplot( 133); imshowpair( Image, z_colorcam_reg); title('Task 3: Resampled depth on original color')

%% [KinectData] Task 4: Visualizing combined depth/color data

% Well, actually, this one is just plotting so you're done already
figure; 
surf(z_colorcam_reg, double(Image), 'EdgeColor', 'none')
set(gca,'ZDir','reverse');
set(gca,'YDir','reverse');
title( 'Task 4: 3D mesh generated from resampled depth')
drawnow;
