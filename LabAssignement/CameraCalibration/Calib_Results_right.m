% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1062.327623052666695 ; 1066.520922340278730 ];

%-- Principal point:
cc = [ 959.500000000000000 ; 539.500000000000000 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.036606159409845 ; -0.036716911475859 ; 0.003569157100939 ; -0.005799521946247 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 2.911244990758250 ; 3.045551323415279 ];

%-- Principal point uncertainty:
cc_error = [ 0.000000000000000 ; 0.000000000000000 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.006096874500748 ; 0.010554228304751 ; 0.000533072246267 ; 0.000519863119361 ; 0.000000000000000 ];

%-- Image size:
nx = 1920;
ny = 1080;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 11;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 0;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.012403e+00 ; 2.029144e+00 ; -4.837722e-01 ];
Tc_1  = [ -1.284539e+02 ; -7.267131e+01 ; 4.660062e+02 ];
omc_error_1 = [ 2.041005e-03 ; 2.160449e-03 ; 3.731738e-03 ];
Tc_error_1  = [ 9.118598e-02 ; 1.333024e-01 ; 1.242160e+00 ];

%-- Image #2:
omc_2 = [ -2.083602e+00 ; -2.021113e+00 ; 6.536314e-01 ];
Tc_2  = [ -1.210633e+02 ; -7.808191e+01 ; 4.489453e+02 ];
omc_error_2 = [ 1.613649e-03 ; 1.617785e-03 ; 3.025809e-03 ];
Tc_error_2  = [ 1.389633e-01 ; 1.077139e-01 ; 1.099055e+00 ];

%-- Image #3:
omc_3 = [ 1.802808e+00 ; 1.875282e+00 ; 2.436523e-01 ];
Tc_3  = [ -1.737603e+02 ; -1.022726e+02 ; 3.205221e+02 ];
omc_error_3 = [ 1.336667e-03 ; 1.954486e-03 ; 3.017715e-03 ];
Tc_error_3  = [ 1.855025e-01 ; 8.001739e-02 ; 1.033817e+00 ];

%-- Image #4:
omc_4 = [ NaN ; NaN ; NaN ];
Tc_4  = [ NaN ; NaN ; NaN ];
omc_error_4 = [ NaN ; NaN ; NaN ];
Tc_error_4  = [ NaN ; NaN ; NaN ];

%-- Image #5:
omc_5 = [ -1.422250e-02 ; 2.985786e+00 ; -5.455575e-01 ];
Tc_5  = [ -1.295023e+01 ; -1.744853e+02 ; 4.724744e+02 ];
omc_error_5 = [ 1.014307e-03 ; 2.511156e-03 ; 3.690917e-03 ];
Tc_error_5  = [ 1.354680e-01 ; 1.556784e-01 ; 1.232110e+00 ];

%-- Image #6:
omc_6 = [ 3.299074e-03 ; -2.833682e+00 ; 4.761819e-01 ];
Tc_6  = [ 5.221203e+01 ; -1.825978e+02 ; 4.350191e+02 ];
omc_error_6 = [ 8.973989e-04 ; 2.129167e-03 ; 3.173543e-03 ];
Tc_error_6  = [ 1.010273e-01 ; 1.168572e-01 ; 1.268026e+00 ];

%-- Image #7:
omc_7 = [ NaN ; NaN ; NaN ];
Tc_7  = [ NaN ; NaN ; NaN ];
omc_error_7 = [ NaN ; NaN ; NaN ];
Tc_error_7  = [ NaN ; NaN ; NaN ];

%-- Image #8:
omc_8 = [ 1.926439e+00 ; 1.946604e+00 ; -5.824207e-01 ];
Tc_8  = [ -1.012928e+02 ; -7.645180e+01 ; 4.119939e+02 ];
omc_error_8 = [ 1.473927e-03 ; 1.542913e-03 ; 2.552909e-03 ];
Tc_error_8  = [ 8.531940e-02 ; 1.181428e-01 ; 1.051986e+00 ];

%-- Image #9:
omc_9 = [ -1.977006e+00 ; -1.979900e+00 ; 9.651774e-01 ];
Tc_9  = [ -1.099428e+02 ; -7.854424e+01 ; 4.397279e+02 ];
omc_error_9 = [ 1.199795e-03 ; 1.191675e-03 ; 1.961473e-03 ];
Tc_error_9  = [ 1.418130e-01 ; 1.088220e-01 ; 9.653023e-01 ];

%-- Image #10:
omc_10 = [ 2.590064e+00 ; 1.620039e+00 ; -2.834208e-01 ];
Tc_10  = [ -4.914566e+01 ; -8.012493e+01 ; 4.683487e+02 ];
omc_error_10 = [ 3.343934e-03 ; 2.066434e-03 ; 5.936294e-03 ];
Tc_error_10  = [ 1.087942e-01 ; 1.169769e-01 ; 1.383207e+00 ];

%-- Image #11:
omc_11 = [ -1.935602e+00 ; -1.876595e+00 ; -4.177250e-01 ];
Tc_11  = [ -1.694395e+02 ; -7.536609e+01 ; 2.484577e+02 ];
omc_error_11 = [ 1.214750e-03 ; 1.174969e-03 ; 2.171913e-03 ];
Tc_error_11  = [ 5.997578e-02 ; 1.027257e-01 ; 8.064464e-01 ];

