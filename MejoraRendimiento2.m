%Alumna: Karla Monserratt Martínez López
%Grupo: 807-A
%Materia: Redes neuronales convolucionales 

% Definir diferentes combinaciones
learningRates = [0.001, 0.0005]; % a1 y a2
momentums = [0.9, 0.95]; % m1 y m2

% Almacenar resultados
results = struct('LearningRate', {}, 'Momentum', {}, 'Net', {}, 'TrainInfo', {}, 'Accuracy', {}, 'ConfusionMat', {});

% Contador para el índice de resultados
resultIdx = 1;

% Probar todas las combinaciones
for lr = learningRates
    for mom = momentums
        fprintf('Entrenando con LR=%.4f, Momentum=%.2f\n', lr, mom);
        
        % Opciones de entrenamiento con parámetros
        options = trainingOptions('sgdm', ...
            'InitialLearnRate', lr, ...
            'Momentum', mom, ...
            'MaxEpochs', 20, ...
            'MiniBatchSize', 32, ...
            'Shuffle', 'every-epoch', ...
            'ValidationData', augmentedImdsVal, ...
            'ValidationFrequency', 10, ...
            'ValidationPatience', 5, ...
            'Verbose', false, ...
            'Plots', 'none', ...
            'OutputNetwork', 'best-validation-loss');
        
        % Entrenar
        [net, trainInfo] = trainNetwork(augmentedImdsTrain, lgraph, options);
        
        % Evaluar
        [YPred, probs] = classify(net, augmentedImdsTest);
        accuracy = mean(YPred == imdsTest.Labels);
        
        % Guardar resultados en el arreglo de estructuras
        results(resultIdx).LearningRate = lr;
        results(resultIdx).Momentum = mom;
        results(resultIdx).Net = net;
        results(resultIdx).TrainInfo = trainInfo;
        results(resultIdx).Accuracy = accuracy;
        results(resultIdx).ConfusionMat = confusionmat(imdsTest.Labels, YPred);
        
        % Guardar red de acuerdo a las combinaciones
        save(sprintf('flower_net_lr%d_mom%d.mat', round(lr*10000), round(mom*100)), ...
             'net', 'trainInfo');
        
        resultIdx = resultIdx + 1;
    end
end

% Mostrar comparación de resultados
fprintf('\nComparación de resultados:\n');
fprintf('%-10s %-10s %-10s %-10s %-10s\n', 'LR', 'Momentum', 'Precisión', 'Val Loss', 'Train Loss');
for i = 1:length(results)
    valLoss = min(results(i).TrainInfo.ValidationLoss);
    trainLoss = results(i).TrainInfo.TrainingLoss(end);
    fprintf('%-10.4f %-10.2f %-10.2f %-10.4f %-10.4f\n', results(i).LearningRate, results(i).Momentum, results(i).Accuracy*100, valLoss, trainLoss);
end