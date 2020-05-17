%--------------------------------------------------------------------------
% SGN-34006 3D and Virtual Reality
% Calibration of Kinect V2
% 
% Calibration object info.:
%   - Square dimensions: 40 x 40 mm
%   - Number of inner squares: 4 (vertical) by 6 (horizontal)
%
%--------------------------------------------------------------------------
clc; clear; close all;
addpath('./TOOLBOX_calib');

%% Run calibration for each camera sensor
calib_gui;

%% Run stereo calibration
stereo_gui;

%% Save calibration parameters and undistorted images (e.g., *_rect.bmp) in 
% a file called KinectData.mat 

% Write the name of your undistorted images:
nameColorImage = 'color_23_rect.bmp';
nameDepthImage = 'depth_23_rect.bmp';

SaveParametersStruct(nameColorImage, nameDepthImage);