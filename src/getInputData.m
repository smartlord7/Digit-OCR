function [data] = getInputData(times)
path = OCRConst.INPUT_DATA_PATH;
prop = OCRConst.INPUT_DATA_PROP;

data = load(path).(prop);
data = repmat(data, 1, times);
end