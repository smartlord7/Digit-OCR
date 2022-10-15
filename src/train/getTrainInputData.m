function [data] = getTrainInputData(isSeq)
    if isSeq
        path = OCRConst.PATH_CLASSIFIER_INPUT;
        prop = OCRConst.PROP_CLASSIFIER_INPUT;
    else
        path = OCRConst.TRAIN_INPUT_DATA_PATH;
        prop = OCRConst.TRAIN_INPUT_DATA_PROP;
    end
    data = [];
    input_files = dir(path + '/*.mat');
    for i=1:length(input_files)
        fileData = load(path + input_files(i).name).(prop);
        data = cat(2, data, fileData);
    end

end