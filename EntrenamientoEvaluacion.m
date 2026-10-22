%Alumna: Karla Monserratt Martínez López
%Grupo: 807-A
%Materia: Redes neuronales convolucionales 

% Opciones de aumento de datos para entrenamiento
augmenter = imageDataAugmenter(...
    'RandXReflection', true, ...
    'RandYReflection', true, ...
    'RandRotation', [-20 20], ...
    'RandXTranslation', [-10 10], ...
    'RandYTranslation', [-10 10], ...
    'RandXScale', [0.8 1.2], ...
    'RandYScale', [0.8 1.2]);

augmentedImdsTrain = augmentedImageDatastore([224 224], imdsTrain, 'DataAugmentation', augmenter);
augmentedImdsVal = augmentedImageDatastore([224 224], imdsVal);

% Opciones de entrenamiento
options = trainingOptions('sgdm', ...
    'InitialLearnRate', 0.001, ... % a1
    'Momentum', 0.9, ... % m1
    'MaxEpochs', 10, ...
    'MiniBatchSize', 32, ...
    'ValidationData', augmentedImdsVal, ...
    'ValidationFrequency', 10);

% Entrenar la red
[net, trainInfo] = trainNetwork(augmentedImdsTrain, lgraph, options);

% Guardar la red entrenada
save('RedNeuronal.mat', 'net');

% Evaluar en el conjunto de prueba
augmentedImdsTest = augmentedImageDatastore([224 224], imdsTest);
[YPred, probs] = classify(net, augmentedImdsTest);
accuracy = mean(YPred == imdsTest.Labels);

% Mostrar matriz de confusión
figure;
confusionchart(imdsTest.Labels, YPred);
title(sprintf('Matriz de Confusión - Precisión: %.2f%%', accuracy*100));

% Mostrar algunas predicciones de ejemplo
% Ejemplos de predicción
    figure('Name', 'Ejemplos de Predicción', 'Position', [100 100 1200 600]);
    idx = randperm(numel(imdsTest.Files), 6);
    for i = 1:6
        subplot(2,3,i);
        I = readimage(imdsTest, idx(i));
        imshow(I);
        
        trueLabel = imdsTest.Labels(idx(i));
        predLabel = YPred(idx(i));
        prob = max(probs(idx(i),:)) * 100;
        
        if trueLabel == predLabel
            color = 'g';
        else
            color = 'r';
        end
        
        title(sprintf('Real: %s\nPred: %s (%.1f%%)',string(trueLabel), string(predLabel), prob), 'Color', color);
    end