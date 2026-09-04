# 📊 Marketing Analytics — SQL & Power BI

Proyecto de análisis de datos de marketing digital multicanal desarrollado con SQL y Microsoft Power BI, enfocado en evaluar el rendimiento financiero, la eficiencia de la inversión publicitaria y las tasas de conversión de diferentes campañas y categorías de marketing.

El proyecto analiza un conjunto de datos de 308 registros, utilizando métricas como inversión publicitaria (mark_spent), ingresos (revenue), impresiones (impressions), clics (clicks), prospectos (leads) y órdenes (orders).

El objetivo es transformar los datos de las campañas en insights accionables que permitan identificar los canales más rentables, detectar oportunidades de optimización y facilitar la toma de decisiones basada en datos.

---

## 🎯 Objetivo del proyecto

El análisis busca responder preguntas clave como:

* ¿Qué categorías de marketing generan mayor rentabilidad?
* ¿Qué campañas generan más ingresos y órdenes?
* ¿Dónde se concentra la inversión publicitaria?
* ¿Qué canales presentan mejor eficiencia?
* ¿Cuáles son las tasas de clics y conversión?
* ¿Qué campañas presentan días con cero órdenes?
* ¿Qué categorías deberían considerarse rentables, aceptables o deficitarias?
* ¿Cómo se puede visualizar el desempeño de las campañas de manera interactiva?

---

## 🛠️ Tecnologías utilizadas

* SQL — análisis, agregaciones y cálculo de métricas.
* Microsoft Power BI — creación del dashboard interactivo y visualización de KPIs.
* GitHub — documentación y control del proyecto.

---

## 🔎 1. Análisis de datos con SQL

Se desarrollaron diferentes consultas SQL para analizar el comportamiento de las campañas y categorías de marketing.

### 1. Inversión total e ingresos por categoría
SELECT 
    category,
    SUM(mark_spent) AS inversion_total,
    SUM(revenue) AS ingresos
FROM marketing
GROUP BY category
ORDER BY ingresos DESC;

Esta consulta permite comparar la inversión realizada frente a los ingresos generados por cada categoría.

### 2. Campaña con mayor revenue
SELECT
    campaign_name,
    SUM(revenue) AS ingresos
FROM marketing
GROUP BY campaign_name
ORDER BY ingresos DESC;

Permite identificar las campañas que generan mayor volumen de ingresos.

### 3. Leads y órdenes por campaña
SELECT 
    campaign_name,
    SUM(leads) AS leads_generados,
    SUM(orders) AS ordenes_generadas
FROM marketing
GROUP BY campaign_name
ORDER BY ordenes_generadas DESC;

Esta consulta permite comparar la capacidad de cada campaña para generar prospectos y convertirlos en órdenes.

### 4. Costo por clic promedio (CPC)
SELECT 
    category,
    AVG(mark_spent / clicks) AS costo_promedio_por_click
FROM marketing
GROUP BY category;

El CPC permite evaluar cuánto se está invirtiendo, en promedio, para generar cada clic en las diferentes categorías.

### 5. Fecha con mayor revenue
SELECT 
    c_date,
    SUM(revenue) AS ingresos_totales
FROM marketing
GROUP BY c_date
ORDER BY ingresos_totales DESC
LIMIT 1;

Permite identificar el día con mayor generación de ingresos dentro del período analizado.

### 6. Tasa de clics promedio (CTR)
SELECT 
    category,
    AVG(clicks * 1.0 / impressions) * 100 AS CTR
FROM marketing
GROUP BY category
ORDER BY CTR DESC;

El CTR permite medir la capacidad de cada categoría para generar clics a partir de las impresiones obtenidas.

### 7. Días con cero órdenes por campaña
SELECT 
    COUNT(c_date) AS dias,
    campaign_name
FROM marketing
WHERE orders = 0
GROUP BY campaign_name;

Esta consulta ayuda a detectar campañas que presentan períodos sin conversiones y que podrían requerir optimización.

### 8. Clasificación de rentabilidad por ROI
SELECT 
    category,
    CASE
        WHEN SUM(revenue) / SUM(mark_spent) > 2 THEN 'Rentable'
        WHEN SUM(revenue) / SUM(mark_spent) BETWEEN 1 AND 2 THEN 'Aceptable'
        ELSE 'Perdida'
    END AS Clasificacion_ROI
FROM marketing
GROUP BY category;

Las categorías se clasifican según el retorno obtenido sobre la inversión:
| ROI | Clasificación |
| :--- | :--- |
| > 2 | Rentable |
| 1 – 2 | Aceptable |
| < 1 | Pérdida |

---

## 📈 2. Dashboard de Marketing Analytics

A partir de los resultados obtenidos mediante SQL, se desarrolló un dashboard interactivo en Microsoft Power BI para facilitar la exploración visual de las métricas.
El dashboard permite analizar de manera dinámica el comportamiento de las campañas, categorías, ingresos, inversión y retorno de inversión.

### 📌 Principales KPIs
El dashboard presenta cuatro indicadores principales:
| KPI | Valor mostrado |
| :--- | :--- |
| Leads | 66 mil |
| Órdenes | 8 mil |
| Total de ingresos | 429 mil |
| Total dinero invertido | 335 mil |
(Los valores pueden variar dependiendo de los filtros aplicados o de los datos utilizados en el modelo).

### 📊 Visualizaciones principales

* ROI por categoría: Se utiliza un gráfico de barras horizontales para comparar el retorno de inversión entre las diferentes categorías (Influencer, Media, Search, Social). Esta visualización permite identificar rápidamente los canales que generan mayor retorno en relación con la inversión realizada.
* Ingresos por categoría: El dashboard muestra los ingresos generados por cada categoría. Esto permite comparar el aporte económico de cada canal.
* Inversión por categoría: Se analiza cómo se distribuye el presupuesto de marketing entre las diferentes categorías. La visualización permite identificar los canales que concentran una mayor cantidad de inversión y compararlos con los ingresos generados.

### 🎛️ Interactividad
El dashboard incorpora filtros y elementos interactivos que permiten:
* Seleccionar campañas específicas.
* Filtrar dinámicamente los datos.
* Analizar ingresos e inversión.
* Comparar categorías y evaluar el ROI.
* Explorar los KPIs y el desempeño de diferentes campañas.
El listado de campañas ubicado en el panel lateral permite seleccionar una campaña y observar cómo cambian las métricas y visualizaciones del dashboard.

---

## 💡 Principales Insights

* 🥇 Canal más rentable: La categoría influencer presenta el ROI más alto, con aproximadamente 2.54, generando alrededor de $21.1M en ingresos frente a una inversión de aproximadamente $8.3M. Esto evidencia una alta eficiencia del canal y su potencial para generar retorno sobre la inversión.
* 🚀 Campaña líder: La campaña youtube_blogger destaca por volumen, alcanzando aproximadamente 1,914 órdenes y $15.3M en revenue. Esto la posiciona como una de las campañas de mejor desempeño dentro del conjunto analizado.
* ⚠️ Eficiencia vs. volumen de inversión: La categoría social concentra la mayor inversión publicitaria, aproximadamente $13.8M, pero presenta un ROI inferior a 1 (0.86). Esto representa una oportunidad de optimización, ya que el nivel de inversión no se traduce proporcionalmente en ingresos.
* 📈 Eficiencia de campañas de creadores: Las campañas relacionadas con creadores de contenido, especialmente aquellas asociadas a plataformas como YouTube e Instagram, muestran mejores tasas de conversión frente a formatos publicitarios tradicionales como los banners. Esto sugiere que las estrategias basadas en contenido y creadores pueden ofrecer una mayor eficiencia para determinadas audiencias.

---

## 📂 Estructura del proyecto

Marketing-Analytics/
│
├── Images/
│   ├── RTA1.png
│   ├── RTA2.png
│   ├── RTA3.png
│   ├── RTA4.png
│   ├── RTA5.png
│   ├── RTA6.png
│   ├── RTA7.png
│   └── RTA8.png
│
├── Dashboard_Marketing_Analytics.png
│
├── SQL/
│   └── marketing_analysis.sql
│
├── README.md
└── ...

---

## 📊 Categorías analizadas

El proyecto se concentra principalmente en cuatro categorías de marketing:
* Influencer
* Social
* Media
* Search

Estas categorías permiten comparar diferentes estrategias de adquisición y evaluar su impacto sobre la inversión, los ingresos y las conversiones.

---

## 🎯 Conclusiones

El análisis demuestra la importancia de combinar SQL para el análisis estructurado de los datos con Power BI para la visualización y exploración interactiva.

Los resultados muestran que un mayor nivel de inversión no necesariamente implica un mayor retorno. Mientras que Influencer presenta una alta eficiencia y rentabilidad, Social concentra una inversión considerable pero obtiene un ROI inferior a 1, lo que representa una oportunidad para revisar la estrategia de pauta.

Por otro lado, campañas como youtube_blogger destacan por su capacidad para generar órdenes e ingresos, reforzando el potencial de las estrategias basadas en creadores de contenido.

En conjunto, el proyecto permite convertir datos de campañas de marketing en información útil para optimizar la asignación de presupuesto, identificar campañas de alto rendimiento y tomar decisiones basadas en métricas cuantificables.

---

## 👨‍💻 Proyecto
Marketing Analytics — SQL & Power BI
Análisis de rendimiento de campañas de marketing digital utilizando técnicas de análisis SQL y visualización de datos en Power BI.
