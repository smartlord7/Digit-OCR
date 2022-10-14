function [] = trainClassifier()
    p = getTrainInputData();
    [nRows, nCols] = size(p);
    t = getClassifierTargetData(nCols / OCRConst.N_CLASSES);
    logFile = fopen(OCRConst.PATH_LOG_FILE, "w");
    delete(OCRConst.PATH_CLASSIFIER_NN_DIR + ".*")
    
    for seed=OCRConst.SEED
        for nLayers=OCRConst.N_CLASSIFIER_LAYERS
            if nLayers == 1
                trainClassifierInner(seed, nLayers, 0, p, t, logFile);
            else
                for nHiddenNodes=OCRConst.N_CLASSIFIER_HIDDEN_NEURONS
                    trainClassifierInner(seed, nLayers, 0, p, t, logFile);
                end
            end
        end
    end
end