# ANALISIS DE RIESGO FINANCIERO Y CUELLOS DE BOTELLA EN LA CADENA DE SUMINISTRO

## DESCRIPCION
Este proyecto analiza un conjunto de datos logísticos (1,000 órdenes de compra) para identificar ineficiencias operativas y calcular el riesgo financiero asociado a los retrasos en las entregas. El objetivo principal es transformar datos crudos en decisiones de negocio estratégicas, aplicando metodologías de ingeniería industrial y analítica de datos.

## TECNOLOGIAS USADAS
1. Lenguaje: Python
2. Procesamiento de Datos: Pandas
3. Visualización: Matplotlib, Seaborn
4. Entorno: Visual Studio Code / Jupyter Notebooks.

## METODOLOGIA
1. **Auditoría y Limpieza (Data Cleaning):** Manejo de valores nulos e imputación de datos en registros de interrupciones logísticas utilizando .fillna() para estandarizar las órdenes exitosas.

2. **Identificación de Cuellos de Botella (Data Aggregation):** Agrupación y ordenamiento de proveedores (.groupby(), .sort_values()) para cuantificar la pérdida de tiempo operativo (días de retraso acumulados).

3. **Evaluación de Impacto Financiero:** Filtrado  de las órdenes con retrasos reales para calcular el capital inmovilizado (Order_Value_USD) por categoría de producto.

4. **Visualización Gerencial:**
   Creación de gráficos de barras para presentar los resultados de manera clara y orientada a la toma de decisiones.

## CONCLUSIONES

1. **Rendimiento de Proveedores:** Los proveedores S24, S4 y S23 representan los mayores cuellos de botella operativos de la red, acumulando la mayor cantidad de días de retraso global.

2. **Capital en Riesgo:** La ineficiencia operativa tiene un impacto financiero directo. La categoría de Electrónica presenta el mayor nivel de capital inmovilizado por retrasos, alcanzando casi $2,950,797 USD.  seguido por la categoria de  Textiles con $2,849,067 USD.

3. **Estrategia Recomendada:** Se sugiere priorizar la renegociación de Acuerdos de Nivel de Servicio con el Top 3 de proveedores críticos y diseñar planes de contingencia para las rutas de distribución de componentes electrónicos.