clc;
clear;
close all;

% LTE-Advanced Single Component Carrier

BW1 = 20;          % Component carrier bandwidth (MHz)
SE = 4;            % Spectral efficiency (bits/s/Hz)
Ncc = 1;           % Number of component carriers

% Aggregated bandwidth
BWagg = BW1 * Ncc;

% Estimated throughput (Mbps)
Throughput = BWagg * SE;

% Display results
disp('Single Component Carrier');
disp(['Bandwidth = ', num2str(BWagg), ' MHz']);
disp(['Estimated Throughput = ', num2str(Throughput), ' Mbps']);

% Plot throughput
figure;
bar(Ncc, Throughput);
grid on;
xlabel('Number of Component Carriers');
ylabel('Estimated Throughput (Mbps)');
title('LTE-Advanced Single Carrier Throughput');