classdef OCRConst
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Constant)
        N_FILTER_INPUTS = 256;
        N_FILTER_LAYERS = 1;
        N_FILTER_OUTPUTS = 256;
        FILTER_WEIGHT_INIT_MIN = 0;
        FILTER_WEIGHT_INIT_MAX = 1;
        ASSOCIATIVE_FILTER_TRAIN_FUNCTION = 'traingda';
        PERCEPTRON_FILTER_TRAIN_FUNCTION = 'trainc';
        PERCEPTRON_FILTER_ADAPT_FUNCTION = 'learnp';
        N_CLASSIFIER_INPUTS = 256;
        FILTER_TARGET_DATA_PATH = 'PerfectArial.mat';
        FILTER_TARGET_DATA_PROP = 'Perfect';
        INPUT_DATA_PATH = 'P.mat';
        INPUT_DATA_PROP = 'P';
    end
end
