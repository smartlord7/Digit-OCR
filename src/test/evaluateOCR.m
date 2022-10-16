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
        n =  string(filters(i).name);
        f = load(OCRConst.PATH_TEST_FILTER_NN_DIR + n).filter;
        p = f(data);

        for j=1:length(classifiersSeq)
            n2 = string(classifiersSeq(j).name);
            c = load(OCRConst.PATH_TEST_CLASSIFIER_SEQ_NN_DIR + n2).classifier;
            y = c(p);
            n2 = (n + " & " + n2);
            n2 = n2.replace("_", "-").replace("^", "@").replace(".mat", "");

            f = figure(1);
            plotconfusion(y, t)
            fh = gcf;
            ax = gca;
            ax.FontSize = 8;
            set(findobj(ax,'type','test'),'fontsize',3);
            ah = fh.Children(2);
            ah.XLabel.String = 'Actual';
            ah.YLabel.String = 'Predicted';
            ax.XTickLabel = OCRConst.CLASS_LABELS;
            ax.YTickLabel = OCRConst.CLASS_LABELS;
            title("Filter + Classifier - Confusion Matrix");
            subtitle(n2, 'Fontsize',6)
            set(gcf,'color','w');
            saveas(f, n2 + ".png", "png");
            hold off
        end
    end

    for i=1:length(classifiers)
        n = string(classifiers(i).name);
        c = load(OCRConst.PATH_TEST_CLASSIFIER_NN_DIR + n).classifier;
        y = c(data);
        [r, c] = size(y);
        m = max(y, [], 1);
        idx = int8((y == m));

        f = figure(1)
        plotconfusion(idx, t)
        fh = gcf;
        ax = gca;
        ax.FontSize = 8;
        set(findobj(ax,'type','test'),'fontsize',3);
        ah = fh.Children(2);
        ah.XLabel.String = 'Actual';
        ah.YLabel.String = 'Predicted';
        ax.XTickLabel = OCRConst.CLASS_LABELS;
        ax.YTickLabel = OCRConst.CLASS_LABELS;
        title("Classifier - Confusion Matrix");
        n = n.replace("_", "-").replace("^", "@").replace(".mat", "");
        subtitle(n, 'Fontsize',6);
        set(gcf,'color','w');
        hold off;
        saveas(f, n + ".png", "png");
    end

end

