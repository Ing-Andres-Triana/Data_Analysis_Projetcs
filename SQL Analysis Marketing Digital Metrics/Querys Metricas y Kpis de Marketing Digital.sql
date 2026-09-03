SELECT * FROM marketing.marketing;

#¿Cuál es la inversión total y el revenue total por categoría?
SELECT 
category,
SUM(mark_spent) AS inversion_total,
SUM(revenue) AS ingresos
FROM marketing
GROUP BY category
ORDER BY ingresos DESC;

#¿Qué campaña generó más revenue total, ordenado de mayor a menor?
SELECT
campaign_name,
SUM(revenue) AS ingresos
FROM marketing
GROUP BY campaign_name
ORDER BY ingresos DESC;

#¿Cuántos leads y órdenes en total generó cada campaña?
SELECT 
campaign_name,
SUM(leads) AS leads_generados,
SUM(orders) AS ordenes_generadas
FROM marketing
GROUP BY campaign_name
ORDER BY ordenes_generadas DESC;

#¿Cuál es el costo por clic promedio por categoría?
SELECT 
category,
AVG(mark_spent/clicks) AS costo_promedio_por_click
FROM marketing
GROUP BY category;

#¿Qué fecha tuvo el mayor revenue total, sumando todas las campañas de ese día?
SELECT 
c_date,
SUM(revenue) AS ingresos_totales
FROM marketing
GROUP BY c_date
ORDER BY ingresos_totales
LIMIT 1;

#¿Cuál es la tasa de clics promedio — CTR — por categoría?

SELECT 
category,
AVG ( clicks / impressions) * 100 AS CTR
FROM marketing
GROUP BY category
ORDER BY CTR DESC;

# ¿Cuántos días registró cada campaña con cero órdenes?
SELECT 
COUNT(c_date) AS dias,
campaign_name
FROM marketing
WHERE orders = 0
GROUP BY campaign_name;

#Clasifica cada fila según su ROI: 'Rentable' (ROI > 2), 'Aceptable' (ROI entre 1 y 2), 'Pérdida' (ROI < 1). Cuenta cuántas filas caen en cada categoría, agrupado por category.
SELECT 
category,
CASE
	WHEN SUM(revenue) / SUM(mark_spent) > 2 THEN 'Rentable'
    WHEN SUM(revenue) / SUM(mark_spent) BETWEEN 1 AND 2 THEN 'Aceptable'
    ELSE 'Perdida'
END AS Clasificacion_ROI
FROM marketing
GROUP BY category;
