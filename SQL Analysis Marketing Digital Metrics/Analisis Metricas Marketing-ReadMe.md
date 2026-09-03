# Análisis de Rendimiento de Marketing y Campañas con SQL

Repositorio de análisis de datos de marketing digital que evalúa el rendimiento financiero, la eficiencia de inversión y las tasas de conversión por campaña y categoría utilizando consultas SQL avanzadas.

## 📊 Descripción del Proyecto
Este proyecto analiza un conjunto de datos multicanal de 308 registros para extraer insights clave sobre rentabilidad, inversión publicitaria (`mark_spent`), ingresos generados (`revenue`), generación de prospectos (`leads`) y transacciones (`orders`).

---

## 📈 Key Insights del Análisis

* **Canal Más Rentable:** La categoría **`influencer`** destaca con el ROI más alto (2.54), generando $21.1M en ingresos con una inversión de $8.3M.
* **Campaña Líder:** **`youtube_blogger`** se posiciona como la campaña con mayor volumen de órdenes (1,914) y revenue total ($15.3M).
* **Eficiencia vs Volumen:** Aunque la categoría **`social`** concentra la mayor inversión publicitaria ($13.8M), presenta un ROI menor a 1 (0.86), lo que evidencia una oportunidad crítica de optimización en pauta.
* **Conversión de Pauta:** Las campañas basadas en creadores y creadores de contenido (como YouTube e Instagram) muestran tasas de conversión superiores frente a los banners tradicionales.

---

## 🛠️ Consultas SQL Implementadas

```sql
-- 1. Inversión Total y Revenue por Categoría
SELECT 
    category,
    SUM(mark_spent) AS inversion_total,
    SUM(revenue) AS ingresos
FROM marketing
GROUP BY category
ORDER BY ingresos DESC;
```
![Resultado 1](./Images\RTA1.png)

```sql
-- 2. Campaña con Mayor Revenue Total
SELECT
    campaign_name,
    SUM(revenue) AS ingresos
FROM marketing
GROUP BY campaign_name
ORDER BY ingresos DESC;
```
![Resultado 2](./Images\RTA2.png)

```sql
-- 3. Total de Leads y Órdenes por Campaña
SELECT 
    campaign_name,
    SUM(leads) AS leads_generados,
    SUM(orders) AS ordenes_generadas
FROM marketing
GROUP BY campaign_name
ORDER BY ordenes_generadas DESC;
```

![Resultado 3](./Images\RTA3.png)

```sql
-- 4. Costo por Clic Promedio (CPC) por Categoría
SELECT 
    category,
    AVG(mark_spent / clicks) AS costo_promedio_por_click
FROM marketing
GROUP BY category;
```

![Resultado 4](./Images\RTA%204.png)

```sql
-- 5. Fecha con Mayor Revenue Total
SELECT 
    c_date,
    SUM(revenue) AS ingresos_totales
FROM marketing
GROUP BY c_date
ORDER BY ingresos_totales DESC
LIMIT 1;
```
![Resultado 5](./Images\RTA5.png)

```sql
-- 6. Tasa de Clics Promedio (CTR) por Categoría
SELECT 
    category,
    AVG(clicks * 1.0 / impressions) * 100 AS CTR
FROM marketing
GROUP BY category
ORDER BY CTR DESC;
```
![Resultado 6](./Images\RTA6.png)

```sql
-- 7. Días con Cero Órdenes por Campaña
SELECT 
    COUNT(c_date) AS dias,
    campaign_name
FROM marketing
WHERE orders = 0
GROUP BY campaign_name;
```
![Resultado 7](./Images\RTA7.png)

```sql
-- 8. Clasificación de Rentabilidad (ROI) por Categoría
SELECT 
    category,
    CASE
        WHEN SUM(revenue) / SUM(mark_spent) > 2 THEN 'Rentable'
        WHEN SUM(revenue) / SUM(mark_spent) BETWEEN 1 AND 2 THEN 'Aceptable'
        ELSE 'Perdida'
    END AS Clasificacion_ROI
FROM marketing
GROUP BY category;
```

![Resultado 8](./Images\RTA8.png)