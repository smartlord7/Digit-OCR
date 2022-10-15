function [] = trainFilter()
p = getTrainInputData();
[nRows, nCols] = size(p);
t = getFilterTargetData(nCols / OCRConst.N_CELLS_MPAPER);
logFile = fopen(OCRConst.PATH_LOG_FILE, "w");
csvFile = fopen(OCRConst.PATH_CSV_FILTER_FILE, "w");
fprintf(csvFile, OCRConst.HEADER_CSV_FILTER);
delete(OCRConst.PATH_FILTER_NN_DIR + ".*")
delete(OCRConst.PATH_CLASSIFIER_INPUT + ".*")

for seed=OCRConst.SEED
    for actFunction=OCRConst.ACT_F_FILTER
        for trainType=OCRConst.TRAIN_TYPE
            trainFunctions = [];
            if trainType == true
                trainFunctions = OCRConst.TRAIN_F_INC;
                tType = 'inc';
            else
                trainFunctions = OCRConst.TRAIN_F_BATCH;
                tType = 'batch';
            end
            c = 0;
            for trainFunction=trainFunctions
                for lr=OCRConst.LEARN_RATE_FILTER
                        if c == 1 && (trainFunction == "learnp" || trainFunction == "learnpn")
                            continue;
                        end
                        epochs = OCRConst.EPOCHS_FILTER;
                        logMsg = sprintf("\nTraining filter (seed=%d, act=%s, train=%s^%s, lr=%.3f)...\n", seed, actFunction, trainFunction, trainType, lr);
                        fprintf(logMsg);
                        fprintf(logFile, logMsg);
                        filter = buildFilter(seed, tType, trainFunction, actFunction, lr, epochs);                       
                        if ~ trainType
                            [filter, info] = train(filter, p, t, 'useParallel','yes');
                        else
                            [filter, info] = train(filter, p, t, 'useParallel','no');
                        end
                        logMsg = sprintf("Filter trained. Tperf: %.3f, Vperf: %.3f", min(info.perf), min(info.vperf));
                        y = filter(p);
                        fileName = sprintf(OCRConst.PATH_FILTER_INPUT + "/OF_%.5f_%.5f~%d_%s_%s^%s_%.3f_%d",  min(info.perf), min(info.vperf), seed, actFunction, trainFunction, tType, lr, epochs);
                        save(fileName + ".mat", "y", "-mat");
                        fprintf(logMsg);
                        fprintf(logFile, logMsg);                     
                        row = sprintf("%d,%s,%s,%s,%d,%.3f,%.5f,%.5f\n", seed, actFunction, trainFunction, tType, epochs, lr, min(info.perf), min(info.vperf));
                        fprintf(csvFile, row);
                        fileName = sprintf(OCRConst.PATH_FILTER_NN_DIR + "/NNF_%.5f_%.5f~%d_%s_%s^%s_%.3f_%d",  min(info.perf), min(info.vperf), seed, actFunction, trainFunction, tType, lr, epochs);
                        save(fileName + ".mat", "filter", "info", "-mat");
                        c = c + 1;
                end
            end
        end
    end
end

end