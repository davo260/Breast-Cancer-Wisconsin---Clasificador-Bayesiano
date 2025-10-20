# Breast-Cancer-Wisconsin---Clasificador-Bayesiano

# 🩺 Clasificador Bayesiano para el Conjunto de Datos *Breast Cancer Wisconsin (Diagnostic)*

Este proyecto implementa un análisis estadístico y un clasificador **Bayesiano (QDA)** aplicado al diagnóstico de cáncer de mama.  
Se utilizan tres variables morfológicas del núcleo celular — `radius_mean`, `texture_mean` y `concavity_mean` — para distinguir entre tumores **benignos** y **malignos**.

---

## 📊 Objetivos
- Analizar las distribuciones estadísticas de variables morfológicas clave.
- Aplicar **Análisis de Componentes Principales (PCA)** para reducción de dimensionalidad.
- Entrenar un **clasificador QDA** y evaluar su desempeño.
- Visualizar la **frontera de decisión Bayesiana** y la probabilidad posterior.

---

## 🧠 Metodología
1. **Ajuste de distribuciones** (Normal, Lognormal, Gamma) mediante máxima verosimilitud.  
2. **Selección de variables** basadas en varianza y correlación con el diagnóstico.  
3. **PCA y Whitening** para eliminar redundancias.  
4. **Clasificación Bayesiana (QDA)** con evaluación de sensibilidad y especificidad.  
5. **Visualización 2D y 3D** de las superficies de decisión.

---

## 🧬 Contexto biológico
- `radius_mean`: tamaño promedio del núcleo celular.  
- `texture_mean`: variabilidad en la intensidad del núcleo (heterogeneidad estructural).  
- `concavity_mean`: deformación de los bordes nucleares.  
Estas características reflejan la agresividad del tumor y son observables en imágenes FNA microscópicas.

---

## ⚙️ Requisitos
Instala las dependencias ejecutando:
```bash
pip install -r requirements.txt
