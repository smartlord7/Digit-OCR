function [] = validateClassifier(nnName)
c = load(OCRConst.PATH_CLASSIFIER_NN_DIR + nnName + ".mat").classifier;
p = getTrainInputData();

q = c(p);

[nRows, nCols] = size(p);
for i=(1:1:nCols / OCRConst.N_CLASSES)
    showim(p(:,i));
    pause(1);
    q(1:10, i:i+10);
    fprintf("%d\n", q(mod(i, 10) + 1, mod(i, 10) + 1));
    pause(3);
end

end