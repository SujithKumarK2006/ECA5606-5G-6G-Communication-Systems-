clc;
clear;
close all;

% LTE-Advanced Carrier Aggregation

BWcc = 20;              % MHz per component carrier
SE = 4;                 % Spectral efficiency (bits/s/Hz)

CC = [1 2 3];           % Number of component carriers

% Aggregated bandwidth
AggBW = BWcc .* CC;     % MHz

% Estimated throughput
Throughput = AggBW .* SE;   % Mbps

% Display results
disp('CC   Aggregated BW (MHz)   Estimated Throughput (Mbps)');
disp([CC' AggBW' Throughput']);

% Plot throughput
figure;
bar(CC, Throughput);
grid on;

xlabel('Number of Aggregated Component Carriers');
ylabel('Estimated Throughput (Mbps)');
title('LTE-Advanced Carrier Aggregation Throughput');