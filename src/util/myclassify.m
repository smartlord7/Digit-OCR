function [y] = myclassify(data, filled_inx)
    p = data(:, filled_inx);

    if OCRStatic.setGetOCRArchitecture == OCRConst.ARCHITECTURE_FILTER_AND_CLASSIFIER
         filterNN = load(OCRStatic.setGetFilterPath).filter;
         p = filterNN(p);
    end

    classifierNN = load(OCRStatic.setGetClassifierPath).classifier;
    y = classifierNN(p);
    m = max(y, [], 1);
    idx = (y == m);
    [row, col] = find(idx);
    
    y = row;
end

