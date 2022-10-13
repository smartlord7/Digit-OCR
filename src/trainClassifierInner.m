function [] = trainClassifierInner(seed, nLayers, nHiddenNeurons, p, t, logFile)
    for actFunction=OCRConst.ACT_F_CLASS
        for trainType=OCRConst.TRAIN_TYPE
            trainFunctions = [];
            if trainType == true
                trainFunctions = OCRConst.TRAIN_F_BATCH;
                tType = 'batch';
            else
                trainFunctions = OCRConst.TRAIN_F_INC;
                tType = 'inc';
            end
    
            for trainFunction=trainFunctions
                for lr=OCRConst.LEARN_RATE_CLASS
                    for epochs=OCRConst.EPOCHS_CLASS
                        logMsg = sprintf("\nTraining classifier (seed=%d, act=%s, train=%s^%s, lr=%.3f, ep=%d)...\n", seed, actFunction, trainFunction, trainType, lr, epochs);
                        fprintf(logMsg);
                        fprintf(logFile, logMsg);
                        if nLayers == 1
                            nHiddenNeurons = 0;
                        end
                        classifier = buildClassifier(seed, nLayers, nHiddenNeurons, tType, trainFunction, actFunction, lr, epochs);
                        classifier.trainParam.showWindow = 0;
                        [classifier, info] = train(classifier, p, t);
                        fileName = sprintf(OCRConst.PATH_CLASSIFIER_NN_DIR + "/NN_%.5f_%.5f~%d_%s_%s^%s_%.3f_%d", info.best_perf, info.best_vperf, seed, actFunction, trainFunction, tType, lr, epochs);
                        logMsg = sprintf("Classifier trained. Tperf: %.3f, Vperf: %.3f", info.best_perf, info.best_vperf);
                        fprintf(logMsg);
                        fprintf(logFile, logMsg);
                        save(fileName + ".mat", "classifier", "info", "-mat");
                    end
                end
            end
        end
    end
end