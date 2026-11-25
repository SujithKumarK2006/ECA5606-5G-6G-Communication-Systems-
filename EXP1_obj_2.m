clear;
clc;
close all;

%% Evolution of Mobile Communication Generations

generation = ["1G"; "2G"; "2G"; "3G"; "4G"; "5G"];

system = ["AMPS";
    "GSM";
    "IS-95";
    "UMTS";
    "LTE";
    "5G NR"];

accessMethod = ["FDMA";
    "TDMA";
    "CDMA";
    "WCDMA";
    "OFDMA";
    "OFDMA-based"];

keyIdea = ["Separate frequency channels";
    "Separate time slots";
    "Code-based user separation";
    "Wideband code-based access";
    "Orthogonal frequency resources";
    "Flexible OFDM-based radio access"];

%% Create and Display Table
evolutionTable = table(generation, system, accessMethod, keyIdea, ...
    'VariableNames', {'Generation', 'System', 'AccessMethod', 'KeyIdea'});

disp('Evolution of Mobile Communication Systems');
disp(evolutionTable);