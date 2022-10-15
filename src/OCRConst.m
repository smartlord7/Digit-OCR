classdef OCRConst
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Constant)
        PATH_UI_INPUT = "input_tmp.mat"
        PATH_LOG_FILE = "../out/log.txt";
        PATH_FILTER_NN_DIR = "../out/nn/filter/";
        PATH_CLASSIFIER_NN_DIR = "../out/nn/classifier/";
        PATH_CLASSIFIER_SEQ_NN_DIR = "../out/nn/classifier_seq/";
        PATH_CSV_FILTER_FILE = "../out/filter.csv";
        PATH_CSV_CLASSIFIER_FILE = "../out/classifier.csv";
        PATH_CSV_CLASSIFIER_SEQ_FILE = "../out/classifier_seq.csv";
        PATH_CLASSIFIER_INPUT = "../in/train_seq/";
        PROP_CLASSIFIER_INPUT = "y";
        PATH_FILTER_INPUT = "../out/filter/"
        HEADER_CSV_FILTER = "seed,activationFunction,trainFunction,trainType,maxEpochs,learnRate,tPerformance,vPerformance\n";
        HEADER_CSV_CLASSIFIER = "seed,nLayers,nHiddenNeurons,activationFunction,trainFunction,trainType,maxEpochs,learnRate,tPerformance,vPerformance\n";
        N_FILTER_INPUTS = 256;
        N_CLASSES = 10;
        N_CELLS_MPAPER = 50;
        N_ROWS_MPAPER = 5;
        N_FILTER_LAYERS = 1;
        N_FILTER_OUTPUTS = 256;
        FILTER_WEIGHT_INIT_MIN = 0;
        FILTER_WEIGHT_INIT_MAX = 1;
        CLASS_WEIGHT_INIT_MIN = 0;
        CLASS_WEIGHT_INIT_MAX = 1;
        IS_FILTER = [true false];
        TRAIN_TYPE = [true false];
        SEED = (0:1:3)
        TRAIN_F_INC = [];
        TRAIN_F_BATCH = ["traingd" "traingda" "traingdm" "trainscg"];
        ACT_F_FILTER = ["radbas", "compet", "tribas"];
        ACT_F_CLASS = ["purelin" "softmax" ;"logsig" "softmax" ; "elliotsig" "softmax"];
        EPOCHS_FILTER = 1000;
        EPOCHS_CLASS = 10000;
        EPOCHS_TRAINC = 50;
        LEARN_RATE_MIN_FILTER = 0.2
        LEARN_RATE_STEP_FILTER = 0.3;
        LEARN_RATE_MAX_FILTER = 1;
        LEARN_RATE_FILTER = (OCRConst.LEARN_RATE_MIN_FILTER:OCRConst.LEARN_RATE_STEP_FILTER:OCRConst.LEARN_RATE_MAX_FILTER);
        LEARN_RATE_MIN_CLASS = 0.2;
        LEARN_RATE_STEP_CLASS = 0.3;
        LEARN_RATE_MAX_CLASS = 1;
        LEARN_RATE_CLASS = (OCRConst.LEARN_RATE_MIN_CLASS:OCRConst.LEARN_RATE_STEP_CLASS:OCRConst.LEARN_RATE_MAX_CLASS);
        TRAIN_RATIO = 0.85;
        VALIDATION_RATIO = 0.15;
        TEST_RATIO = 0;
        N_CLASSIFIER_INPUTS = 256;
        N_CLASSIFIER_OUTPUTS = 10;
        N_CLASSIFIER_LAYERS = [1, 2];
        N_CLASSIFIER_HIDDEN_NEURONS_MIN = 10
        N_CLASSIFIER_HIDDEN_NEURONS_STEP = 40;
        N_CLASSIFIER_HIDDEN_NEURONS_MAX = 130;
        N_CLASSIFIER_HIDDEN_NEURONS = [OCRConst.N_CLASSIFIER_HIDDEN_NEURONS_MIN:OCRConst.N_CLASSIFIER_HIDDEN_NEURONS_STEP:OCRConst.N_CLASSIFIER_HIDDEN_NEURONS_MAX];
        CLASSIFIER_WEIGHT_INIT_MIN = 0;
        CLASSIFIER_WEIGHT_INIT_MAX = 1;
        CLASSIFIER_BIAS_INIT_MIN = 0;
        CLASSIFIER_BIAS_INIT_MAX = 1;
        FILTER_TARGET_DATA = "PerfectArial.mat";
        FILTER_TARGET_DATA_PROP = "Perfect";
        TRAIN_INPUT_DATA_PATH = "../in/train/";
        TRAIN_INPUT_DATA_PROP = "P";
        ARCHITECTURE_CLASSIFIER = 0;
        ARCHITECTURE_FILTER_AND_CLASSIFIER = 1
    end
end
