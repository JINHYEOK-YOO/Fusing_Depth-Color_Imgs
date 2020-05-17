% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 364.126403671187916 ; 365.126067090499703 ];

%-- Principal point:
cc = [ 255.500000000000000 ; 211.500000000000000 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.098999258183661 ; -0.220584793751968 ; 0.004141688977604 ; 0.001590817140272 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 2.623478617333947 ; 2.812554482648014 ];

%-- Principal point uncertainty:
cc_error = [ 0.000000000000000 ; 0.000000000000000 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.022035248496656 ; 0.051528753275483 ; 0.001429908587118 ; 0.001202756230677 ; 0.000000000000000 ];

%-- Image size:
nx = 512;
ny = 424;


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
omc_1 = [ 2.018325e+00 ; 2.012358e+00 ; -4.552769e-01 ];
Tc_1  = [ -8.820863e+01 ; -7.235667e+01 ; 4.631636e+02 ];
omc_error_1 = [ 5.947923e-03 ; 5.869989e-03 ; 1.063271e-02 ];
Tc_error_1  = [ 2.436511e-01 ; 3.507492e-01 ; 3.422382e+00 ];

%-- Image #2:
omc_2 = [ -2.108040e+00 ; -2.026371e+00 ; 6.344549e-01 ];
Tc_2  = [ -8.044695e+01 ; -7.769307e+01 ; 4.466668e+02 ];
omc_error_2 = [ 5.075865e-03 ; 5.343754e-03 ; 1.014267e-02 ];
Tc_error_2  = [ 3.681768e-01 ; 2.926601e-01 ; 3.018036e+00 ];

%-- Image #3:
omc_3 = [ 1.800486e+00 ; 1.853449e+00 ; 2.644547e-01 ];
Tc_3  = [ -1.302914e+02 ; -1.014271e+02 ; 3.171265e+02 ];
omc_error_3 = [ 3.288397e-03 ; 4.463176e-03 ; 7.180070e-03 ];
Tc_error_3  = [ 4.262830e-01 ; 2.050285e-01 ; 2.881360e+00 ];

%-- Image #4:
omc_4 = [ NaN ; NaN ; NaN ];
Tc_4  = [ NaN ; NaN ; NaN ];
omc_error_4 = [ NaN ; NaN ; NaN ];
Tc_error_4  = [ NaN ; NaN ; NaN ];

%-- Image #5:
omc_5 = [ 3.656941e-03 ; 2.969142e+00 ; -5.446749e-01 ];
Tc_5  = [ 2.635944e+01 ; -1.748714e+02 ; 4.720608e+02 ];
omc_error_5 = [ 2.576991e-03 ; 6.865184e-03 ; 1.062626e-02 ];
Tc_error_5  = [ 3.364078e-01 ; 4.691571e-01 ; 3.391892e+00 ];

%-- Image #6:
omc_6 = [ -1.244157e-02 ; -2.856634e+00 ; 4.787862e-01 ];
Tc_6  = [ 9.226818e+01 ; -1.834218e+02 ; 4.366262e+02 ];
omc_error_6 = [ 2.403902e-03 ; 6.433936e-03 ; 1.002494e-02 ];
Tc_error_6  = [ 2.841572e-01 ; 3.792294e-01 ; 3.553047e+00 ];

%-- Image #7:
omc_7 = [ NaN ; NaN ; NaN ];
Tc_7  = [ NaN ; NaN ; NaN ];
omc_error_7 = [ NaN ; NaN ; NaN ];
Tc_error_7  = [ NaN ; NaN ; NaN ];

%-- Image #8:
omc_8 = [ 1.933863e+00 ; 1.927671e+00 ; -5.559365e-01 ];
Tc_8  = [ -5.989683e+01 ; -7.630682e+01 ; 4.098282e+02 ];
omc_error_8 = [ 4.301526e-03 ; 4.208762e-03 ; 7.134622e-03 ];
Tc_error_8  = [ 2.424843e-01 ; 3.136011e-01 ; 2.874263e+00 ];

%-- Image #9:
omc_9 = [ -2.001462e+00 ; -1.981684e+00 ; 9.444297e-01 ];
Tc_9  = [ -6.896833e+01 ; -7.820653e+01 ; 4.370897e+02 ];
omc_error_9 = [ 3.741584e-03 ; 3.796864e-03 ; 6.444399e-03 ];
Tc_error_9  = [ 3.668019e-01 ; 3.013812e-01 ; 2.612058e+00 ];

%-- Image #10:
omc_10 = [ 2.592605e+00 ; 1.602842e+00 ; -2.391625e-01 ];
Tc_10  = [ -9.319091e+00 ; -8.019366e+01 ; 4.663746e+02 ];
omc_error_10 = [ 9.203825e-03 ; 5.028210e-03 ; 1.600857e-02 ];
Tc_error_10  = [ 3.867277e-01 ; 3.251283e-01 ; 3.956896e+00 ];

%-- Image #11:
omc_11 = [ -1.945591e+00 ; -1.884728e+00 ; -4.431615e-01 ];
Tc_11  = [ -1.239246e+02 ; -7.455539e+01 ; 2.453521e+02 ];
omc_error_11 = [ 3.229395e-03 ; 3.398038e-03 ; 5.931465e-03 ];
Tc_error_11  = [ 1.763168e-01 ; 2.890527e-01 ; 2.102609e+00 ];

