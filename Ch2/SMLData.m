% Saba Ramezani
% SML
% Define variables
Automobile = [322331; 273558; 327771; 259789; 235687; 198754; 211915; 232401; 212351; 223070; 245675; 242814; 217474; 192113; 190607; 190208; 215730; 194327; 198270; 227130; 206958; 195287; 197863; 230286; 247493; 265256; 246419; 317316; 317671; 301216; 310713; 449258; 559073; 281787; 206843; 93248.5];
Chemical = [158259; 120431; 131399; 123401; 112398; 104007; 105178; 110060; 114843; 120451; 120153; 115681; 99552.9; 93658.7; 95548.6; 106262; 113897; 102219; 111104; 89138; 75804; 70963.3; 73504.6; 81658.8; 72647.7; 68691.5; 89577.5; 84362.3; 89336.5; 95106.2; 92811.9; 104633; 67720; 54541.6; 40550.9; 30317.9];
Metal = [1493790; 1123400; 1179240; 1005970; 960546; 906039; 964892; 1011800; 1025970; 1134770; 1181170; 1156320; 1085630; 1048910; 1033940; 1062270; 1102850; 1122190; 1076260; 1179780; 998686; 903488; 892082; 884934; 995908; 887953; 763739; 1071680; 951086; 933639; 1233410; 1089210; 1375380; 825692; 600425; 427499];
RealEstate = [10322.6; 8436.7; 9024.8; 7295; 6675; 6107.6; 6340.9; 6420.3; 6683.6; 7116.3; 7670.9; 6825.4; 6038; 5471.3; 5829.7; 6599.7; 7632.1; 7917.5; 8750.3; 9735.2; 9209.4; 9112.9; 9200.1; 9965.5; 10254.6; 10838.6; 12093.9; 13196.4; 13110.3; 15313; 16328.4; 19925.1; 15873.6; 11395.4; 8889.3; 6220.5];
Cement = [17767.4; 12600.4; 12961.7; 11286.6; 10432.9; 9476.9; 9679.5; 9979.7; 10225.3; 11138.3; 10500.5; 9448.9; 7923.7; 7021.4; 7184.6; 7426.5; 8136.4; 8861.9; 9756.8; 11405.8; 10933.9; 9488.2; 10313.6; 11267.8; 11380.4; 11288.4; 10004.4; 9843.9; 8838.1; 9251.9; 9755.1; 13135.2; 13958.8; 12160.3; 8821.7; 7091.7];
MonthlyTotalIndex = [1960457.4; 1533366.5; 1689144.1; 1496200.8; 1408597.9; 1308960; 1355240.9; 1424490.9; 1471898.2; 1539632.2; 1579686.7; 1512219.1; 1367250.3; 1282190.8; 1279393.9; 1318359.7; 1386935.3; 1436357.1; 1386451; 1515548.6; 1311306; 1168664.7; 1154844.7; 1219589.9; 1307707.1; 1238357.4; 1150718; 1439124; 1345301.4; 1412354.7; 1595160.1; 1757229.2; 1916194.1; 1270627.1; 986759.2; 690037];

% Save variables into the .mat file for the first time
save('FiveIndustriesMonthlyIndices.mat', 'Automobile', 'Chemical', 'Metal', 'RealEstate', 'Cement', 'MonthlyTotalIndex');

% Read Excel file
filename = 'All.xlsx';
data = readtable(filename);

% Save data to .mat file
save('FiveIndustriesMonthlyIndices.mat', 'data');

% Load .mat file
load('FiveIndustriesMonthlyIndices.mat')

% Define industry names
Names = {'Automobile', 'Chemical', 'Metal', 'RealEstate', 'Cement'};

k = length(Names);
m_r = zeros(k,1);
sigma_r = zeros(k,1);
beta_r = zeros(k,1);
E_r = zeros(k,1);

% Assuming a risk-free rate (for example, 0.01 or 1% annually)
rf = 0.38;

% Convert MonthlyTotalIndex to returns
r_m = diff(log(MonthlyTotalIndex));
m_rm = mean(r_m);
sigma_rm = std(r_m);

for i = 1:k
    % Convert industry data to returns
    r_tmp = diff(log(eval(Names{i})));
    
    m_r(i,1) = mean(r_tmp);
    sigma_r(i,1) = std(r_tmp);
    c = cov(r_tmp, r_m);
    beta_r(i,1) = c(1,2)/c(2,2);
    E_r(i,1) = rf + (m_rm - rf) * beta_r(i,1);
end

% ... your code

plot(beta_r, E_r, 'ko');
hold on;
plot(beta_r, m_r, '*r');
for j = 1:k
    text(beta_r(j,1), m_r(j,1), ['\leftarrow' Names{j}]);
end

% Define the beta range
beta_range = 0:0.1:2;

% Calculate SML
SML = rf + (m_rm - rf) * beta_range;

% Plot SML
plot(beta_range, SML, 'b-');

legend('Expected return','Actual return', 'SML', 'Location', 'northwest')

result = [m_r, E_r, beta_r, sigma_r; m_rm, m_rm, 1, sigma_rm];
