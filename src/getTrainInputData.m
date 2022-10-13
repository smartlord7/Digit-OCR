function [data] = getTrainInputData()
path = OCRConst.TRAIN_INPUT_DATA_PATH;
prop = OCRConst.INPUT_DATA_PROP;
data = [];

input_files = dir(path + '/*.mat');
for i=1:length(input_files)
    fileData = load(path + input_files(i).name).(prop);
    data = cat(2, data, fileData);
end

end