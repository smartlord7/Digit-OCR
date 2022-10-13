function [] = trainFilter()
p1 = getTrainInputData();
t1 = getFilterTargetData(1);
logFile = fopen(OCRConst.PATH_LOG_FILE, "w");

for seed=OCRConst.SEED
    for actFunction=OCRConst.ACT_F_FILTER
        for trainType=OCRConst.TRAIN_TYPE
            trainFunctions = [];
            if trainType == true
                trainFunctions = OCRConst.TRAIN_F_BATCH;
                trainType = 'batch';
            else
                trainFunctions = OCRConst.TRAIN_F_INC;
                trainType = 'inc';
            end
    
            for trainFunction=trainFunctions
                for lr=OCRConst.LEARN_RATE_FILTER
                    for epochs=OCRConst.EPOCHS_FILTER
                        logMsg = sprintf("\nTraining filter (seed=%d, act=%s, train=%s^%s, lr=%.3f, ep=%d)...\n", seed, actFunction, trainFunction, trainType, lr, epochs);
                        fprintf(logMsg);
                        fprintf(logFile, logMsg);
                        filter = buildFilter(seed, trainFunction, actFunction, lr, epochs);
                        filter.trainParam.showWindow = 0;
                        [filter, info] = train(filter, p1, t1);
                        fileName = sprintf(OCRConst.PATH_NNETS_DIR + "/NN_%.3f_%.3f~%d_%s_%s^%s_%.3f_%d", info.best_perf, info.best_vperf, seed, actFunction, trainFunction, trainType, lr, epochs);
                        logMsg = sprintf("Filter trained. Tperf: %.3f, Vperf: %.3f", info.best_perf, info.best_vperf);
                        fprintf(logMsg);
                        fprintf(logFile, logMsg);
                        save(fileName + ".mat", "filter", "info", "-mat");
                    end
                end
            end
        end
    end
end

end