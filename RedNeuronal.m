%Alumna: Karla Monserratt Martínez López
%Grupo: 807-A
%Materia: Redes neuronales convolucionales 

%Examen y proyecto tercer parcial

% Cargar GoogLeNet preentrenada
net = googlenet;

% Preparar datos
imds = imageDatastore('102flowers\', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

%imdsTrain      : 60% en los datos de entrenamiento
%imdsVal        : 15% en la validación
%imdsTest       : 25% en la la evaluación
[imdsTrain, imdsVal, imdsTest] = splitEachLabel(imds, 0.6, 0.15, 0.25, 'randomized');

% Modificar la red para nuestras 10 clases
numClasses = 10;

%Grafo de capas de la googlenet
lgraph = layerGraph(net);

% crear remplazos de las capas finales
%capa que remplaza a la ultima capa con el número de clases 
newFC = fullyConnectedLayer(numClasses, 'Name', 'new_fc');
%Crear una nueva capa de clasificación
newOutput = classificationLayer('Name', 'new_output');

%remplazar en la red las capas previamente creadas
lgraph = replaceLayer(lgraph, 'loss3-classifier', newFC);
lgraph = replaceLayer(lgraph, 'output', newOutput);

% Analizar la red modificada
analyzeNetwork(lgraph);