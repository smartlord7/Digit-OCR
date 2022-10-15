function [data] = getClassifierTargetData(times)
    data = repmat(eye(OCRConst.N_CLASSES), 1, times);
end