function [filter] = buildAssocMemFilter(seed)

nInputs = OCRConst.N_FILTER_INPUTS;
nOutputs = OCRConst.N_FILTER_OUTPUTS;
nLayers = OCRConst.N_FILTER_LAYERS;
trainFun = OCRConst.ASSOCIATIVE_FILTER_TRAIN_FUNCTION;
wMin = OCRConst.FILTER_WEIGHT_INIT_MIN;
wMax = OCRConst.FILTER_WEIGHT_INIT_MAX; 
rng(seed)

filter = linearlayer;
filter = configure(filter, transpose(zeros(nInputs)), transpose(zeros(nOutputs)));
filter.biasConnect = false(nLayers, 1);

weights = wMin + (wMax - wMin) .* rand(nOutputs, nInputs);
filter.IW{1,1} = weights;
filter.trainFcn = trainFun;
view(filter)
