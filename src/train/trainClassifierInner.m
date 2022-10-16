function [] = trainClassifierInner(seed, nLayers, nHiddenNeurons, p, t, logFile, csvFile)
    for i=(1:1:length(OCRConst.ACT_F_CLASS))
        actFunction = OCRConst.ACT_F_CLASS;
        actFunction = actFunction(1,:,:);
        for trainType=OCRConst.TRAIN_TYPE
            trainFunctions = [];
            if trainType == true
                trainFunctions = OCRConst.TRAIN_F_BATCH;
                tType = 'batch';
            else
                trainFunctions = OCRConst.TRAIN_F_INC;
                tType = 'inc';
            end
            c = 0;
            for trainFunction=trainFunctions
                for lr=OCRConst.LEARN_RATE_CLASS  
                    if c == 1 && (trainFunction == "learnp" || trainFunction == "learnpn")
                            continue;
                    end
                    logMsg = sprintf("\nTraining classifier (seed=%d, nLayers=%d, nHiddenNeurons=%d, act=%s, train=%s^%s, lr=%.3f)...\n", seed, nLayers, nHiddenNeurons, join(actFunction, "-"), trainFunction, trainType, lr);
                    fprintf(logMsg);
                    fprintf(logFile, logMsg);
                    if nLayers == 1
                        nHiddenNeurons = 0;
                    end
                    classifier = buildClassifier(seed, nLayers, nHiddenNeurons, tType, trainFunction, actFunction, lr, OCRConst.EPOCHS_CLASS);
                    [classifier, info] = train(classifier, p, t);
                    y = classifier(p);
                    fileName = sprintf(OCRConst.PATH_CLASSIFIER_NN_DIR + "/NN_%.5f_%.5f~%d_%d_%d_%s_%s^%s_%.3f_%d", min(info.perf), min(info.vperf), seed, nLayers, nHiddenNeurons, join(actFunction, "-"), trainFunction, tType, lr, OCRConst.EPOCHS_CLASS);
                    logMsg = sprintf("Classifier trained. Tperf: %.3f, Vperf: %.3f",min(info.perf), min(info.vperf));
                    fprintf(logMsg);
                    fprintf(logFile, logMsg);
                    row = sprintf("%d,%d,%d,%s,%s,%s,%.3f,%.5f,%.5f\n", seed, nLayers, nHiddenNeurons, join(actFunction, "-"), trainFunction, tType, lr, min(info.perf), min(info.vperf));
                    fprintf(csvFile, row);
                    save(fileName + ".mat", "classifier", "info", "-mat");
                    c = c + 1;
                end
            end
        end
    end
end