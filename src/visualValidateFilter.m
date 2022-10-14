function [] = visualValidateFilter(nnName)
f = load(OCRConst.PATH_FILTER_NN_DIR + nnName + ".mat").filter;
p = getTrainInputData();

q = f(p);
[nRows, nCols] = size(p);
for i=(1:1:nCols)
    showim(p(:,i));
    pause(1);
    showim(q(:,i));
    pause(3);
end

end