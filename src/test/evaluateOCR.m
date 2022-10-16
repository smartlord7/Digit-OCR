function [] = evaluateOCR()
    filters = dir(OCRConst.PATH_TEST_FILTER_NN_DIR + '/*.mat');
    classifiers = dir(OCRConst.PATH_TEST_CLASSIFIER_NN_DIR + '/*.mat');
    classifiersSeq = dir(OCRConst.PATH_TEST_CLASSIFIER_SEQ_NN_DIR + '/*.mat');

    data = [];
    path = OCRConst.PATH_TEST_INPUT;
    input_files = dir(path + '/*.mat');
    for i=1:length(input_files)
        fileData = load(path + input_files(i).name).P;
        data = cat(2, data, fileData);
    end

    [nRows, nCols] = size(data);
    t = getClassifierTargetData(nCols / OCRConst.N_CLASSES);

    for i=1:length(filters)
        f = load(OCRConst.PATH_TEST_FILTER_NN_DIR + filters(i).name).filter;
        p = f(data);

        for j=1:length(classifiersSeq)
            c = load(OCRConst.PATH_TEST_CLASSIFIER_SEQ_NN_DIR + classifiersSeq(i).name).classifier;
            y = c(p);

            plotconfusion(t,y);
        end
    end

    for i=1:length(classifiers)
        n = classifiers(i).name;
        c = load(OCRConst.PATH_TEST_CLASSIFIER_NN_DIR + n).classifier;
        y = c(data);
        [r, c] = size(y);
        m = max(y, [], 1);
        idx = int8((y == m));

        c = plotconfusion(t,idx);
        title(n);
    end

end

