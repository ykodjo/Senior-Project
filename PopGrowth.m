%% In this Code takes Number of seats, Speed, Frequency, Growth rate over 50 years
%The Output is The Total Train Needed (TrN).  

% Number of Train Needed for Operation
% To do: System capacity from year 1 to Year 50 with 5% growth in ridership
% every year. Train capacity train 350 and 500 seats. the Number of
% trains needed to operate 
%Charts 
% Number of trains needed under alternative capacity Assumptions 400 seats with population increase of 5% a year for 50 years. 

%% Variable to Change
q = 500; % Number of seats. We should simulate this with various seats numbers 300:50:500
s = 155; % Speed of travel in mph. As speed increase, the travel time decrease. But with 155 mph it is at 1.5 hours now. 
r = 0.03; %Growth rate or Population Growth 
c = 0.01;

L = 0.70; % Load Factor in percentage
d = 221; % Distance D.C to N.Y in mile
b = 0.25; % Boarding and Train Preparation Time in hours or 15 min
o = 18; % Train Operations from 6a.m to 12a.m = 18 hours
t = 2:1:50
popsize(1:50) = 20000 % Initial Conditions == From Java Simulation, read from csv files potentially 
for time = t % Defining the start and end of the loop
    popsize(t) = popsize(t-1) * (1+r); % To be repeated
end % Closing loop 
%
%ridership(1:50) = 200

%
qe = q*L % Effective Seat Occupation with load factor 
TT = (d/s) % Travel time between DC to NY in hours 
F = (popsize(t)/qe)/o % Frequency of services per hour. Total number of daily services per direction. 
T = (1./F)*60 % put a constraint >= 15 min. Period = Service Time in minutes This should be less dans 20 minutes for a realistic service time

tau = ((2*b)+(2*TT)) % Total Travel Time with return and boarding time
TrN = tau*(popsize(t)/(o*qe))
bar(t,TrN)




