function [filter] = buildPerceptronFilter()

nInputs = OCRConst.N_FILTER_INPUTS;
nOutputs = OCRConst.N_FILTER_OUTPUTS;
nLayers = OCRConst.N_FILTER_LAYERS;
trainFun = OCRConst.PERCEPTRON_FILTER_TRAIN_FUNCTION;
adapFun = OCRConst.PERCEPTRON_FILTER_ADAPT_FUNCTION;

filter = perceptron;
filter = configure(filter, transpose(zeros(nInputs)), transpose(zeros(nOutputs)));
filter.biasConnect = false(nLayers, 1);
filter.trainFcn = trainFun;
filter.adaptFcn = adapFun;

view(filter)
end