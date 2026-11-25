clear;
clc;
close all;

%% Representative Bands and Link Budget Assumptions

freqGHz = [0.7 3.5 28];
freqMHz = freqGHz * 1000;

bandName = ["Sub-1 GHz";
            "Mid-band";
            "mmWave"];

txPowerdBm = 30;
gtDbi = 0;
grDbi = 0;

distanceKm = logspace(log10(0.1), log10(2), 200);
distanceAtPointKm = 0.5;

%% Free-Space Path Loss (FSPL)
% FSPL = 32.44 + 20log10(fMHz) + 20log10(dKm)

fspl = @(fMHz, dKm) 32.44 + 20*log10(fMHz) + 20*log10(dKm);

lossAtPoint = fspl(freqMHz, distanceAtPointKm);
rxAtPoint = txPowerdBm + gtDbi + grDbi - lossAtPoint;

%% Link Budget Table

linkTable = table(bandName, freqGHz(:), lossAtPoint(:), rxAtPoint(:), ...
    'VariableNames', {'Band', 'Frequency_GHz', ...
    'FSPL_dB', 'EstimatedRx_dBm'});

disp(linkTable);

%% Plot Path Loss and Received Power

figure;
tiledlayout(1,2);

% Path Loss
nexttile;
hold on;
grid on;

for k = 1:numel(freqMHz)
    plot(distanceKm, fspl(freqMHz(k), distanceKm), 'LineWidth', 1.5);
end

set(gca,'XScale','log');
xlabel('Distance (km)');
ylabel('Path Loss (dB)');
title('Free-Space Path Loss');
legend(bandName,'Location','northwest');

% Received Power
nexttile;
hold on;
grid on;

for k = 1:numel(freqMHz)
    rx = txPowerdBm + gtDbi + grDbi - fspl(freqMHz(k), distanceKm);
    plot(distanceKm, rx, 'LineWidth', 1.5);
end

set(gca,'XScale','log');
xlabel('Distance (km)');
ylabel('Estimated Received Power (dBm)');
title('Illustrative Received Power');
legend(bandName,'Location','southwest');

%% Co-Channel Reuse Analysis

cellRadiusKm = 0.5;
reuseN = [1 3 7 12];
pathLossExponent = 3.5;

reuseDistance = sqrt(3 * reuseN) * cellRadiusKm;
sirLinear = (reuseDistance / cellRadiusKm).^pathLossExponent / 6;
sirDb = 10 * log10(sirLinear);

reuseTable = table(reuseN(:), reuseDistance(:), sirDb(:), ...
    'VariableNames', {'ReuseClusterN', ...
    'ApproxInterfererDistance_km', ...
    'ApproxSIR_dB'});

disp(reuseTable);

%% Plot SIR vs Reuse Cluster Size

figure;
plot(reuseN, sirDb, 'o-', 'LineWidth', 1.5);
grid on;

xlabel('Reuse Cluster Size (N)');
ylabel('Approximate SIR (dB)');
title('Simplified Co-Channel SIR vs Reuse Cluster Size');

%% Display Received Power at Selected Distance

fprintf('At %.2f km, estimated received powers are:\n', distanceAtPointKm);

resultTable = table(bandName, rxAtPoint(:), ...
    'VariableNames', {'Band', 'Rx_dBm'});

disp(resultTable);