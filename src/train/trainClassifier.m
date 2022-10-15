function [] = trainClassifier(isSeq)
    p = getTrainInputData(isSeq);
    [nRows, nCols] = size(p);
    t = getClassifierTargetData(nCols / OCRConst.N_CLASSES);
    logFile = fopen(OCRConst.PATH_LOG_FILE, "w");
    csvFile = fopen(OCRConst.PATH_CSV_CLASSIFIER_FILE, "w");
    fprintf(csvFile, OCRConst.HEADER_CSV_CLASSIFIER);
    delete(OCRConst.PATH_CLASSIFIER_NN_DIR + ".*")
    delete(OCRConst.PATH_CLASSIFIER_INPUT + ".*")
    
    for seed=OCRConst.SEED
        for nLayers=OCRConst.N_CLASSIFIER_LAYERS
            if nLayers == 1
                trainClassifierInner(seed, nLayers, 0, p, t, logFile, csvFile);
            else
                for nHiddenNeurons=OCRConst.N_CLASSIFIER_HIDDEN_NEURONS
                    trainClassifierInner(seed, nLayers, nHiddenNeurons, p, t, logFile, csvFile);
                end
            end
        end
    end
end