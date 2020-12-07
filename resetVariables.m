function [X_initial,P_initial,X_previous,P_previous,X_predicted_current,P_predicted_current,Qk,Rk,Y_measured,Y_Predicted, Kalman_Gain, X_updated_estimation, P_updated] = resetVariables(Q,R)
%RESETVARIABLES Summary of this function goes here
%   Detailed explanation goes here
% Initial Estimation
X_initial (1:20,1) = 0; 

% Initial error in the estimation
P_initial = eye(20,20);

% Previous known state 
X_previous =X_initial;

% Previous error in the estimation
P_previous= P_initial; 

% Estimation of current state
X_predicted_current=X_initial; 

% Error in estimation of current state
P_predicted_current=P_initial; 

% Uncertainties in error of estimation of state
%Qk=eye(20)*2; % Gives better estimation
Qk = Q;

% Uncertainties in measurement of state
%Rk =eye(20)*1;
Rk = R;

% Measurement Input - from panmodel
Y_measured = 0; 

% Predicted Output
Y_Predicted = 0;

% Kalman Gain
%Kalman_Gain = zeros(20,20);
Kalman_Gain =0;

% Updated estimation of current state using kalman gain
X_updated_estimation = X_initial;

% Updated error in the estimation using kalman gain
P_updated = P_initial;

% For plotting

days(1:100,1)=0;
Yk(1:100,1)=0;
Predicted_Yk(1:100,1)=0; 
Updated_new_infections(1:100,1) =0; % x_hat_plus_day1

end

