
%% This is my code: The Input are Ticket_price, 
%Ridership, Number of Years, Capital and Operating Cost
%The Output are:
%The Break-even, Annual Equivalent, Profit 
%% High-Speed Rail and Maglev Break Even-point 

Ticket_Price = 200 

Rider_Ship = 10000000 % 5M, 8M, 10M of ridership will be used under different sensitivity Analysis. 

n = (1:1:50); % Number of Years Life-Cycle 

i = 0.05; % The interest Rate will be at 3%, 4%, and 5%.

Capital_CostH = 17000000000; % The Capital Cost of building HSR is constant at $17 Billion 
Operating_CostH = 570000000; % The Operating Cost of building HSR is constant at $570 Million

Capital_CostM = 31000000000;
Operating_CostM = 460000000;

%% High-Speed Rail: 1st System 
Annual_EquivalentH = (Ticket_Price * Rider_Ship) - (Operating_CostH);   % Each Year Revenue of the System: Constant 
AnnualE_CostH = Capital_CostH * (i*(1+i).^n)./((1+i).^n - 1); % Amortization of paying off the Capital cost debt over time with fix interest. 
ProfitH = Annual_EquivalentH - AnnualE_CostH; % This is profit, The revenue minus Cost

idH = find(AnnualE_CostH - Annual_EquivalentH < eps, 1); % This is an Elipse formula showing the break-even point on the graph. 
pxH = n(idH);
pyH = AnnualE_CostH(idH);
%% Maglev: 2nd System
Annual_EquivalentM = (Ticket_Price * Rider_Ship) - (Operating_CostM);  % Each Year Revenue of the System 
AnnualE_CostM = Capital_CostM * (i*(1+i).^n)./((1+i).^n - 1); % Amortization of paying off the Capital cost debt over time with fix interest. 
ProfitM = Annual_EquivalentM - AnnualE_CostM; % This is profit, The revenue minus Cost

idM = find(AnnualE_CostM - Annual_EquivalentM < eps, 1); % This is an Elipse formula showing the break-even point on the graph. 
pxM = n(idM);
pyM = AnnualE_CostH(idM);
%% chart High-Speed Rail
figure(1)

hold on
aH = AnnualE_CostH;
plot(n, aH,'LineWidth',2, 'color', 'b');

hold on
yH = Annual_EquivalentH;
plot(n, yH*ones(size(aH)),'LineWidth',2, 'color', 'r');

hold on
pH = ProfitH;
plot(n, pH,'LineWidth',2, 'color', 'g');

hold on
plot(n, aH, n, yH, pxH, pyH, 'ro', 'MarkerSize', 18, 'color', 'm');
grid on;

hold on 
line(xlim(), [0,0], 'LineWidth', 2, 'Color', 'k'); % Line showing the x-Axis for positive and negative return

hold on
title('High-Speed Rail Break-Even Graph and Profit')
LD = legend('AnnualCost = Amortization','AnnualEquivalent = Revenue','Profit', 'Break-Even Point'); %Verified first
LD.FontSize = 15;

%txt1 = ['Plotted Data:', "Ticket Price is:", num2str(Ticket_Price), "RiderShip is: ",  num2str(Rider_Ship), "Interest i is: ", num2str(i)];
%text(pi,0,txt1,'FontSize',10, 'color', 'black');

xlabel('Years');
ylabel('Cost in Million');
hold off

%% Chart Maglev
figure(2)

hold on
aM = AnnualE_CostM;
plot(n, aM, 'LineWidth',2, 'color', 'b');

hold on
yM = Annual_EquivalentM;
plot(n, yM*ones(size(aM)),'LineWidth',2, 'color', 'r');

hold on
pM = ProfitM;
plot(n, pM,'LineWidth',2, 'color', 'g');

hold on
plot(n, aM, n, yM, pxM, pyM, 'ro', 'MarkerSize', 18, 'color', 'm');
grid on;

hold on
line(xlim(), [0,0], 'LineWidth', 2, 'Color', 'k'); % Line showing the x-Axis for positive and negative return

hold on
title('Maglev Break-Even Graph')
LD = legend('AnnualCost = Amortization','AnnualEquivalent = Revenue','Profit', 'Break-Even Point');
LD.FontSize = 15;
%txt = ['Plotted Data:', "Ticket Price is:", num2str(Ticket_Price), "RiderShip is: ",  num2str(Rider_Ship), "Interest i is: ", num2str(i)];
%text(40,-0.05,txt,'FontSize',14, 'color', 'black');

xlabel('Years');
ylabel('Cost in Million');
hold off;
