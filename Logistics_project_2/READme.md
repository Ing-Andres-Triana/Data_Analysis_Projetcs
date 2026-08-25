# 📦 Supply Chain Analytics: Eficiencia Logística y Riesgo Operativo

## 📋 Descripción del Proyecto
Este proyecto de análisis de datos se enfoca en auditar y diagnosticar el estado operativo de una cadena de suministro global. El objetivo principal es identificar cuellos de botella en las entregas, evaluar el rendimiento real de los métodos de envío frente a los tiempos prometidos, y detectar vulnerabilidades financieras relacionadas con transacciones fraudulentas.

## 🗄️ Dataset
Los datos provienen del conjunto público **[DataCo Smart Supply Chain for Big Data Analysis](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis)** alojado en Kaggle. Contiene información histórica y estructurada sobre transacciones, métricas de envío, perfiles geográficos y estado de las órdenes (incluyendo alertas de fraude).

## 🛠️ Herramientas y Requerimientos
El procesamiento, la limpieza y el Análisis Exploratorio de Datos (EDA) se ejecutaron de forma programática utilizando el siguiente stack:
*   **Lenguaje:** Python 
*   **Librerías principales:** `pandas` (para creación de variables, manipulación de DataFrames y agrupaciones matemáticas).
*   **Entorno de Desarrollo:** Visual Studio Code.

## 🔍 Principales Hallazgos

1.  **Focos Rojos Geográficos (Tasa de Fallo Real):** Al analizar el porcentaje de entregas tardías en lugar del volumen absoluto, se descubrió que los peores niveles de servicio ocurren en **Nuevo México (NM) y Delaware (DE)**, superando el 60% de tasa de retraso, seguidos por Oklahoma (OK) y Arkansas (AR). 
2.  **Falla Sistémica en Envíos Premium (Shipping Variance):** Mediante la creación de una métrica de varianza (Días Prometidos vs. Días Reales), se descubrió que los problemas de logística afectan principalmente a los servicios más costosos.
    *   **Standard Class:** Operación estable. Cumple con los tiempos programados (varianza neutral de 0.004 días).
    *   **First Class:** Incumplimiento sistemático. Los pedidos llegan, en promedio, **1 día tarde**.
    *   **Second Class:** El mayor cuello de botella. Los clientes reciben sus paquetes prácticamente **2 días tarde** en promedio.
3.  **Vulnerabilidad Financiera y Fraude:** Al aislar las transacciones catalogadas como `SUSPECTED_FRAUD`, se identificó un patrón inequívoco de riesgo operativo. El bloque principal de fraudes (4,062 incidentes aislados) ocurrió exclusivamente a través de un único método de pago: **TRANSFER** (Transferencia Bancaria).


## 💡 Recomendaciones Estratégicas

*   **Auditoría a Proveedores Logísticos:** Es crítico revisar los acuerdos de nivel de servicio (SLA) con los transportistas encargados de *First* y *Second Class*, así como investigar las rutas de distribución específicas hacia Nuevo México y Delaware, donde la operación está fallando en 6 de cada 10 envíos.
*   **Mitigación de Fraude Focalizada:** Se sugiere implementar protocolos de validación de identidad más estrictos (como autenticación en dos pasos o periodos de validación de fondos) **únicamente** para los pagos realizados mediante `TRANSFER`. Esto cerrará el vector principal de pérdidas económicas sin añadir fricción innecesaria al proceso de compra del resto de los usuarios.