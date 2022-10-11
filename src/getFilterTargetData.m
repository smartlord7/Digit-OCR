function [data] = getFilterTargetData(times)
path = OCRConst.FILTER_TARGET_DATA_PATH;
prop = OCRConst.FILTER_TARGET_DATA_PROP;

data = load(path).(prop);
data = repmat(data, 1, times * 5);
end