function [classifier] = buildClassifier(seed, nLayers, nHiddenNeurons, trainType, trainFun, actFun, learn_rate, epochs)

nInputs = OCRConst.N_CLASSIFIER_INPUTS;
nOutputs = OCRConst.N_CLASSIFIER_OUTPUTS;
wMin = OCRConst.CLASSIFIER_WEIGHT_INIT_MIN;
wMax = OCRConst.CLASSIFIER_WEIGHT_INIT_MAX;
bMin = OCRConst.CLASSIFIER_BIAS_INIT_MIN;
bMax = OCRConst.CLASSIFIER_BIAS_INIT_MAX;
tRatio = OCRConst.TRAIN_RATIO;
vRatio = OCRConst.VALIDATION_RATIO;
tstRatio = OCRConst.TEST_RATIO;
rng(seed)

if nLayers == 1
    classifier = linearlayer;
else
    classifier = feedforwardnet(nHiddenNeurons);
end

classifier.biasConnect = true(nLayers, 1);

for i=1:1:nLayers
    classifier.layers{i}.transferFcn = actFun(i);
end

for i=1:1:nLayers - 1
    weights = wMin + (wMax - wMin) .* rand(nHiddenNeurons, 0);
    biases = bMin + (bMax - bMin) .* rand(nHiddenNeurons, 1);
    classifier.IW{i, 1} = weights;
    classifier.b{1} = biases;
end

if trainType == "batch"
    classifier.trainFcn = trainFun;
    classifier.trainParam.epochs = epochs;
else
    classifier.trainFcn = "trainc";
    classifier.adaptFcn = trainFun;
    classifier.trainParam.epochs = OCRConst.EPOCHS_TRAINC;
end

classifier.performParam.lr = learn_rate;
classifier.divideFcn = 'divideblock';
classifier.divideParam.trainRatio = tRatio;
classifier.divideParam.valRatio = vRatio;
classifier.divideParam.testRatio = tstRatio;
