function [] = trainFilter()
p1 = getTrainInputData();
[nRows, nCols] = size(p1);
t1 = getFilterTargetData(nCols / OCRConst.N_CELLS_MPAPER);
logFile = fopen(OCRConst.PATH_LOG_FILE, "w");
csvFile = fopen(OCRConst.PATH_CSV_FILE, "w");
fprintf(csvFile, OCRConst.HEADER_CSV_FILTER);
delete(OCRConst.PATH_FILTER_NN_DIR + ".*")

for seed=OCRConst.SEED
    for actFunction=OCRConst.ACT_F_FILTER
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
                for lr=OCRConst.LEARN_RATE_FILTER
                    for epochs=OCRConst.EPOCHS_FILTER
                        logMsg = sprintf("\nTraining filter (seed=%d, act=%s, train=%s^%s, lr=%.3f, ep=%d)...\n", seed, actFunction, trainFunction, trainType, lr, epochs);
                        fprintf(logMsg);
                        fprintf(logFile, logMsg);
                        filter = buildFilter(seed, tType, trainFunction, actFunction, lr, epochs);
                        filter.trainParam.showWindow = 0;
                        [filter, info] = train(filter, p1, t1);                      
                        fileName = sprintf(OCRConst.PATH_FILTER_NN_DIR + "/NN_%.5f_%.5f~%d_%s_%s^%s_%.3f_%d",  min(info.perf), min(info.vperf), seed, actFunction, trainFunction, tType, lr, epochs);
                        logMsg = sprintf("Filter trained. Tperf: %.3f, Vperf: %.3f", min(info.perf), min(info.vperf));
                        fprintf(logMsg);
                        fprintf(logFile, logMsg);                     
                        row = sprintf("%d,%s,%s,%s,%d,%.3f,%.5f,%.5f\n", seed, actFunction, trainFunction, tType, epochs, lr, min(info.perf), min(info.vperf));
                        fprintf(csvFile, row);
                        save(fileName + ".mat", "filter", "info", "-mat");
                    end
                end
            end
        end
    end
end

end