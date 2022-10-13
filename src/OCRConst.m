classdef OCRConst
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Constant)
        PATH_LOG_FILE = "log.txt";
        PATH_NNETS_DIR = "../nnets";
        N_FILTER_INPUTS = 256;
        N_FILTER_LAYERS = 1;
        N_FILTER_OUTPUTS = 256;
        FILTER_WEIGHT_INIT_MIN = 0;
        FILTER_WEIGHT_INIT_MAX = 1;
        CLASS_WEIGHT_INIT_MIN = 0;
        CLASS_WEIGHT_INIT_MAX = 1;
        IS_FILTER = [true false];
        TRAIN_TYPE = [true false];
        SEED = (0:10:100)
        TRAIN_F_INC = ["learnp" "learnpn" "learngd" "learngdm" "learnh" "learnhd" "learnwh"];
        TRAIN_F_BATCH = ["traingd" "traingda" "traingdm" "trainlm" "trainscg"];
        ACT_F_FILTER = ["hardlim" "purelin" "logsig"];
        ACT_F_CLASS = ["hardlim" "purelin" "logsig"];
        EPOCHS_FILTER = (2:10:100);
        EPOCHS_CLASS = (2:10:100);
        LEARN_RATE_MIN_FILTER = 0.1
        LEARN_RATE_STEP_FILTER = 0.05;
        LEARN_RATE_MAX_FILTER = 0.7;
        LEARN_RATE_FILTER = (OCRConst.LEARN_RATE_MIN_FILTER:OCRConst.LEARN_RATE_STEP_FILTER:OCRConst.LEARN_RATE_MAX_FILTER);
        LEARN_RATE_MIN_CLASS = 0.1;
        LEARN_RATE_STEP_CLASS = 0.1;
        LEARN_RATE_MAX_CLASS = 0.5;
        LEARN_RATE_CLASS = (OCRConst.LEARN_RATE_MIN_CLASS:OCRConst.LEARN_RATE_STEP_CLASS:OCRConst.LEARN_RATE_MAX_CLASS);
        TRAIN_RATIO = 0.85;
        VALIDATION_RATIO = 0.15;
        TEST_RATIO = 0;
        N_CLASSIFIER_INPUTS = 256;
        FILTER_TARGET_DATA_PATH = "PerfectArial.mat";
        FILTER_TARGET_DATA_PROP = "Perfect";
        TRAIN_INPUT_DATA_PATH = "../input/train/";
        INPUT_DATA_PROP = "P";
    end
end
