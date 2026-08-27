# 🏦 Análisis Exploratorio de Datos (EDA) - Abandono de Clientes Bancarios (Churn)

Proyecto de análisis exploratorio de datos enfocado en el sector bancario para identificar los factores clave de riesgo que impulsan la pérdida de clientes (*Customer Churn*).

---

## 📋 Descripción del Proyecto
La retención de clientes es uno de los desafíos más críticos para las instituciones financieras. Este proyecto analiza un dataset de **10,000 registros**[cite: 1] para entender el perfil de los usuarios que abandonan el banco, validar hipótesis de negocio mediante estadística descriptiva y pruebas de hipótesis, y entregar recomendaciones estratégicas basadas en evidencia.

---

## 📊 Dataset
* **Fuente:** Dataset de Churn Bancario de Kaggle[cite: 1].
* **Dimensiones:** 10,000 filas y 12 columnas[cite: 1].
* **Limpieza inicial:** El conjunto de datos se encontraba limpio, sin valores nulos ni registros duplicados.

Variables principales analizadas:
* `age`: Edad del cliente.
* `products_number`: Cantidad de productos contratados con el banco.
* `active_member`: Estatus de actividad del cliente (0 = Inactivo, 1 = Activo).
* `estimated_salary`: Salario estimado del usuario.
* `churn`: Variable objetivo (0 = Cliente retenido, 1 = Cliente que abandonó).

---

## 🔍 Hallazgos Clave e Insights de Negocio

### 1. El Factor Crítico: Número de Productos (`products_number`)
* **Hallazgo:** Contrario a la intuición de fidelización, poseer múltiples productos incrementa de forma drástica el riesgo de abandono. Los clientes con 3 productos presentan una tasa de fuga del **82.7%**, y aquellos con 4 productos alcanzan el **100% de abandono**.
* **Respaldo Estadístico:** Prueba de **Chi-Cuadrado de Independencia** ($P\text{-value} = 0.0$), confirmando una asociación fuerte y significativa entre el número de productos y el *churn*[cite: 1].

### 2. Demografía y Edad (`age`)
* **Hallazgo:** Los clientes que abandonan el banco son, en promedio, más maduros (mediana de **45 años**) en comparación con los que se quedan (mediana de **36 años**).
* **Respaldo Estadístico:** Prueba no paramétrica **Mann-Whitney U** ($P\text{-value} \approx 3.21 \times 10^{-230}$), validando que la diferencia etaria es estadísticamente significativa[cite: 1].

### 3. Actividad del Cliente (`active_member`)
* **Hallazgo:** La inactividad duplica el riesgo de fuga. Los miembros inactivos presentan una tasa de abandono del **26.85%**, mientras que los activos reducen su deserción al **14.27%**[cite: 1].

### 4. Variables Descartadas (Nulos Negativos)
* **Hallazgo:** Se demostró estadísticamente que el **salario estimado** (`estimated_salary`) no presenta diferencias significativas entre ambos grupos ($P > 0.05$), descartándolo como causa raíz del abandono y evitando la mala asignación de presupuestos comerciales en campañas basadas en ingresos[cite: 1].

---

## 🛠️ Tecnologías y Librerías Utilizadas
* **Python**[cite: 1]
* **Pandas & NumPy** (Manipulación y estructuración de datos)[cite: 1]
* **Matplotlib & Seaborn** (Visualización gráfica avanzada y diagramas de caja)[cite: 1]
* **SciPy** (Pruebas estadísticas de hipótesis: *Mann-Whitney U* y *Chi-Cuadrado*)[cite: 1]

---

## 💡 Recomendaciones Estratégicas para el Negocio
1. **Auditoría de Paquetes Multiproducto:** Revisar de forma urgente las comisiones, la experiencia de usuario y el soporte técnico para clientes con 3 o más productos contratados.
2. **Programas de Re-engagement Automatizados:** Implementar alertas tempranas de inactividad para rescatar a los usuarios antes de que alcancen el umbral crítico de abandono.
3. **Estrategias de Retención Segmentadas:** Enfocar los esfuerzos de retención en perfiles demográficos maduros (mayores de 45 años) mediante atención personalizada.

---