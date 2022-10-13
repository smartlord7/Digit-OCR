function [filter] = buildFilter(seed, trainType, trainFun, actFun, learn_rate, epochs)

nInputs = OCRConst.N_FILTER_INPUTS;
nOutputs = OCRConst.N_FILTER_OUTPUTS;
nLayers = OCRConst.N_FILTER_LAYERS;
wMin = OCRConst.FILTER_WEIGHT_INIT_MIN;
wMax = OCRConst.FILTER_WEIGHT_INIT_MAX;
tRatio = OCRConst.TRAIN_RATIO;
vRatio = OCRConst.VALIDATION_RATIO;
tstRatio = OCRConst.TEST_RATIO;
rng(seed)

filter = linearlayer;
filter = configure(filter, transpose(zeros(nInputs)), transpose(zeros(nOutputs)));
filter.biasConnect = false(nLayers, 1);

for i=1:1:nLayers - 1
    filter.layers{1}.transferFcn = actFun;
end

weights = wMin + (wMax - wMin) .* rand(nOutputs, nInputs);
filter.IW{1,1} = weights;

if trainType == "batch"
    filter.trainFcn = trainFun;
else
    filter.trainFcn = "trainc";
    filter.adaptFcn = trainFun;
end

filter.performParam.lr = learn_rate;
filter.trainParam.epochs = epochs;
filter.divideFcn = 'divideblock';
filter.divideParam.trainRatio = tRatio;
filter.divideParam.valRatio = vRatio;
filter.divideParam.testRatio = tstRatio;
