function [days,Yk,Predicted_Yk,Updated_new_infections] = kalmanFilter(Fk,Hk,X_initial, P_initial,Q,R)
% Note: This kalman filter takes measurements from the panmodel given. 

% Uncertainties in error of estimation of state
Qk = Q;

% Uncertainties in measurement of state
Rk = R;

% Updated estimation of current state using kalman gain
X_updated_estimation = X_initial;

% Updated error in the estimation using kalman gain
P_updated = P_initial;

% For plotting
days(1:100,1)=0;
Yk(1:100,1)=0;
Predicted_Yk(1:100,1)=0; 
Updated_new_infections(1:100,1) =0; % x_hat_plus_day1

for k=1:100
    % Calculate Predicted New State and Predicted Error in the estimation
    % of the true state
    X_predicted_current = Fk*X_updated_estimation;
    P_predicted_current = Fk*P_updated*Fk' + Qk;
    
    
    % Predicted Output of the Model
    Y_Predicted = X_predicted_current(14,1)*0.5 + X_predicted_current(15,1)*0.5;
    
    
    % Get New Data Point - i.e. measured number of infections 
    Y_measured = panmodel;
    
    % Calculat Kalman gain using Error in measured value and the predicted new state
    Kalman_Gain = (P_predicted_current*Hk')/(Hk*P_predicted_current*Hk' + Rk);
    
    % Update Prediction of the New State based on Kalman gain 
    X_updated_estimation = X_predicted_current + Kalman_Gain*(Y_measured - Y_Predicted);
    
    % Update Error in current estimation of the true state - will be used
    % in the next iteration of Kalman filter
    P_updated = (eye(20)-Kalman_Gain*Hk)*P_predicted_current;
    
    days(k) = k;
    Yk(k) = Y_measured;
    Predicted_Yk(k) = Y_Predicted;
    Updated_new_infections(k)=X_updated_estimation(1,1);
        
end

 
end

