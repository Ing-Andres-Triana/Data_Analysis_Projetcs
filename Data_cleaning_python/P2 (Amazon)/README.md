# 🧹 Limpieza y Transformación de Datos: Catálogo de Productos Amazon

## 📋 Descripción del Proyecto
Este proyecto consiste en la limpieza y preparación de un conjunto de datos crudo de productos de Amazon, extraído directamente con múltiples campos redundantes, tipos de datos inconsistentes y valores nulos. El objetivo es transformar un dataset "sucio" en una base de datos limpia, estructurada y lista para análisis exploratorio, aplicando un flujo de trabajo típico de un proceso ETL (Extract, Transform, Load) a pequeña escala.

## 🗄️ Dataset
El archivo de entrada (`amazon_product.csv`) contiene 21 columnas con información de productos: título, precios, calificaciones, disponibilidad, entrega, ofertas, entre otros metadatos de scraping. Muchas de estas columnas presentaban alta cardinalidad de valores nulos o no aportaban valor analítico.

## 🛠️ Herramientas y Requerimientos
* **Lenguaje:** Python
* **Librerías principales:** `pandas` (limpieza, transformación de tipos y exportación de datos)
* **Entorno de Desarrollo:** Jupyter Notebook

## 🔍 Metodología

1. **Eliminación de columnas redundantes:** Se descartaron 12 columnas sin valor analítico o con alta proporción de datos faltantes (URLs de producto, imágenes, número de ofertas, disponibilidad de entrega, etiquetas de Prime/Amazon's Choice, entre otras), reduciendo el dataset a las variables realmente útiles para el análisis.

2. **Estandarización de nombres de columnas:** Se normalizó el nombre de cada columna aplicando formato *capitalize* (primera letra en mayúscula) para mantener consistencia y facilitar su uso posterior.

3. **Verificación de duplicados:** Se validó la ausencia de registros duplicados con `.duplicated()`.

4. **Tratamiento de valores nulos:** Ante la alta proporción de nulos en varias columnas frente al tamaño reducido del dataset, se optó por conservar únicamente las columnas con información completa y confiable (`Product_title`, `Product_price`, `Currency`, `Product_star_rating`, `Product_num_ratings`, `Is_best_seller`), eliminando después las filas con valores nulos remanentes (`.dropna()`).

5. **Conversión de tipos de datos:**
   - La columna `Product_price` se transformó de texto (con símbolo `$`) a tipo `float`, habilitando operaciones numéricas y análisis estadístico.
   - La columna `Is_best_seller` se convirtió de booleano (`True`/`False`) a formato binario (`1`/`0`), estándar para su uso en modelos y agregaciones cuantitativas.

6. **Exportación:** El dataset limpio se exportó en formato `.csv` y `.xlsx`, listo para ser consumido en herramientas de análisis o visualización.

## ✅ Resultado
Un dataset final compacto y consistente, con tipos de datos correctos y sin valores nulos, que pasó de 21 columnas con datos heterogéneos a 6 variables clave (título, precio, moneda, calificación, número de calificaciones y bandera de best-seller), quedando disponible para análisis exploratorio de precios, calificaciones y desempeño comercial de productos.

## 💡 Aprendizajes Clave
* La calidad de un análisis depende directamente de la calidad de los datos de entrada: antes de analizar, hay que auditar.
* No siempre "más columnas" es mejor: priorizar variables completas y relevantes reduce ruido y mejora la confiabilidad del análisis.
* Convertir tipos de datos (texto → numérico, booleano → binario) es un paso indispensable para habilitar cualquier análisis cuantitativo posterior.
