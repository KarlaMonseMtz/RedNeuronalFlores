# RedNeuronalFlores

# Red Neuronal para Clasificación de Flores (Oxford Flowers 102)

Este proyecto implementa y evalúa una red neuronal en MATLAB para la clasificación de imágenes de flores utilizando el **Oxford 102 Category Flower Dataset**.

## 📋 Descripción

El objetivo es entrenar un modelo de aprendizaje profundo capaz de identificar 102 especies de flores comunes en el Reino Unido. El proyecto incluye scripts para el preprocesamiento de datos, el diseño de la arquitectura de la red, el entrenamiento del modelo y la evaluación de su rendimiento, así como una versión mejorada para optimizar los resultados.

## Contenido del Repositorio

El repositorio contiene los siguientes archivos fuente en MATLAB:

| Archivo | Descripción |
| :--- | :--- |
| `RedNeuronal.m` | Script principal que define la arquitectura de la red neuronal y realiza el entrenamiento inicial. |
| `EntrenamientoEvaluacion.m` | Script encargado del proceso de entrenamiento formal y la evaluación del modelo con el conjunto de validación/prueba. |
| `MejoraRendimiento2.m` | Versión optimizada del script de entrenamiento con mejoras en hiperparámetros y técnicas de regularización para aumentar la precisión. |

## Conjunto de Datos (Oxford Flowers 102)

El proyecto utiliza el **102 Category Flower Dataset** de la Universidad de Oxford. Este conjunto de datos es un desafío común en visión por computadora debido a las siguientes características:

- **102 categorías** de flores.
- **Tamaño variable:** Entre 40 y 258 imágenes por clase.
- **Variabilidad:** Las imágenes presentan grandes variaciones de escala, pose e iluminación.
- **Similitud:** Existen categorías con alta variación intra-clase y otras muy similares entre sí, lo que dificulta la clasificación.

### Descarga del Dataset

Para ejecutar los scripts, es necesario descargar el conjunto de datos desde el sitio oficial:

1. Visita: [https://www.robots.ox.ac.uk/~vgg/data/flowers/102/](https://www.robots.ox.ac.uk/~vgg/data/flowers/102/)
2. Descarga el archivo de imágenes (`102flowers.tgz`) y las etiquetas correspondientes (`imagelabels.mat` y `setid.mat`).
3. Extrae los archivos y colócalos en una carpeta llamada `data/` en el directorio raíz del proyecto (o ajusta las rutas en los scripts según tu configuración).

## ⚙️ Requisitos

- **MATLAB** (se recomienda R2021a o superior).
- **Deep Learning Toolbox**.
- **Image Processing Toolbox** (para el preprocesamiento de imágenes).

## Ejecución

1. Clona este repositorio:
   ```bash
   git clone https://github.com/KarlaMonseMtz/RedNeuronalFlores.git
   ```
2. Abre MATLAB y navega hasta la carpeta del proyecto.
3. Asegúrate de tener el dataset descargado y organizado correctamente.
4. Ejecuta el script de entrenamiento principal:
   ```matlab
   EntrenamientoEvaluacion
   ```
5. Para probar la versión optimizada, ejecuta:
   ```matlab
   MejoraRendimiento2
   ```

## Autores

- **Karla Monse Martínez** - [GitHub Profile](https://github.com/KarlaMonseMtz)

## Referencias

- Nilsback, M-E. and Zisserman, A. **Automated Flower Classification over a Large Number of Classes**. *Proceedings of the Indian Conference on Computer Vision, Graphics and Image Processing (2008)*.
- [Oxford Visual Geometry Group - 102 Category Flower Dataset](https://www.robots.ox.ac.uk/~vgg/data/flowers/102/)
