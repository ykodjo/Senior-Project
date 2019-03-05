
% Number of Train Needed for Operation
%% Variable to Change
q = 500; % Number of seats. We should simulate this with various seats numbers 300:50:500
s = 155; % Speed of travel in mph. As speed increase, the travel time decrease. But with 155 mph it is at 1.5 hours now. 
F = 4; % (p/qe)/o % Frequency of services per hour. Total number of daily services per direction.
%% Fix Variables
L = 0.70; % Load Factor in percentage
d = 221; % Distance D.C to N.Y in mile
b = 0.25; % Boarding and Train Preparation Time in hours or 15 min
o = 18; % Train Operations from 6a.m to 12a.m = 18 hours
%% Calculations 
qe = q*L % Effective Seat Occupation with load factor. This will change as the number of seats changes. 
TT = (d/s) % Travel time between DC to NY in hours  
T = (1/F)*60 % Period = Service Time in minutes This should be between 15-20 minutes to reflect a realistic service time between trains
tau = ((2*b)+(2*TT)) % Total Travel Time with return and boarding time
Capacity = 2*F*o*qe % Capacity of Train based on Frequency of service (known). This is x2 for both service.
TrainsNeeded = tau*(Capacity/(o*qe))
