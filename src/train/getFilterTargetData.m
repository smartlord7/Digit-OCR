function [data] = getFilterTargetData(times)
    path = OCRConst.FILTER_TARGET_DATA_PATH;
    prop = OCRConst.FILTER_TARGET_DATA_PROP;
    nRows = OCRConst.N_ROWS_MPAPER;
    
    data = load(path).(prop);
    data = repmat(data, 1, times * nRows);
end