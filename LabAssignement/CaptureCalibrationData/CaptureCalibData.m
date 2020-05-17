%--------------------------------------------------------------------------
% SGN-34006 3D and Virtual Reality
% Grab frames from Kinect V2 and rename files for calibration purposes
%--------------------------------------------------------------------------
%% Program parameters
numMaxCalibImgs = 10;       %Maximum number of images to be captured
automaticCapture = false;   %Automatic or manual capture mode
delayBetweenEachShot = 5;   %Delay between each shot (in seconds) - used in automatic mode 
overwriteFiles = false;     %Overwrite calibration image files?
%% Grab frames from Kinect 
KinectV2GrabFrames (numMaxCalibImgs, ...
                    automaticCapture, ...
                    delayBetweenEachShot);
%% Rename files and delete temp files
RenameFiles(overwriteFiles);