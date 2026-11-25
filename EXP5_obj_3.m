clc;
clear;
close all;

% Throughput vs Component Carrier Bandwidth

BW = [5 10 15 20];      % Carrier bandwidths (MHz)
SE = 4;                 % Spectral efficiency (bits/s/Hz)

% Estimated throughput
TP = BW .* SE;          % Mbps

% Display results
disp('Bandwidth (MHz)   Throughput (Mbps)');
disp([BW' TP']);

% Plot throughput
figure;
plot(BW, TP, 'o-', 'LineWidth', 2);
grid on;

xlabel('Carrier Bandwidth (MHz)');
ylabel('Estimated Throughput (Mbps)');
title('Throughput vs Component Carrier Bandwidth');