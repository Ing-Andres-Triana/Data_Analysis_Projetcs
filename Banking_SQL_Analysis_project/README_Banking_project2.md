# Proyecto de Análisis de Datos Bancarios (SQL)

## Descripción del proyecto

Este proyecto analiza un dataset bancario sintético (`bank_sqlite.db`) compuesto por 7 tablas relacionadas: `customers`, `accounts`, `branches`, `cards`, `loans`, `merchants` y `transactions`. El objetivo es responder preguntas de negocio utilizando SQL básico (`SELECT`, `JOIN`, `GROUP BY`, `HAVING`, `ORDER BY`, funciones de agregación), sin recurrir a CTEs ni funciones de ventana.

## Herramientas utilizadas

- **Motor de base de datos:** MySQL (desarrollo local con DBeaver)
- **Dataset:** Synthetic Banking Dataset (Kaggle)
- **Lenguaje:** SQL estándar

---

## Preguntas resueltas

### 1. ¿Cuáles son las ciudades con la mayor cantidad de clientes?

```sql
SELECT city AS ciudad, COUNT(DISTINCT customer_id) AS Numero_clientes
FROM customers
GROUP BY city
ORDER BY Numero_clientes DESC
LIMIT 5;
```


**Hallazgos:** La ciudad con más clientes es **South Michael**, con 56 clientes, seguida de **East Michael** (42), **New Michael** (41), **Port Michael** (39) y **New Jennifer** (39). Las 5 ciudades principales oscilan entre 39 y 56 clientes, lo que sugiere una base de clientes bastante distribuida geográficamente, sin una concentración dominante en una sola ciudad.

### 2. ¿Cuál es el saldo total y promedio de cuentas por tipo de cuenta?

```sql
SELECT account_type, AVG(balance_usd) AS saldo_promedio, SUM(balance_usd) AS saldo_total_cuentas
FROM accounts
GROUP BY account_type;
```

**Hallazgos:** Los tres tipos de cuenta (Business, Checking, Savings) presentan saldos muy similares entre sí:

| Tipo de cuenta | Saldo promedio | Saldo total |
|---|---|---|
| Checking | $100,097.20 | $2,510,437,746.15 |
| Savings | $99,963.17 | $2,509,275,452.08 |
| Business | $99,702.86 | $2,474,425,544.54 |

No hay una diferencia significativa entre tipos de cuenta, lo que indica que el dataset distribuye los saldos de forma uniforme independientemente del tipo de producto.

### 3. ¿Cuáles son los 10 clientes con mayor saldo total sumando todas sus cuentas?

```sql
SELECT c.customer_id, c.first_name, c.last_name, SUM(a.balance_usd) AS saldo_cuentas
FROM customers AS c
LEFT JOIN accounts AS a ON c.customer_id = a.customer_id
GROUP BY c.customer_id
ORDER BY saldo_cuentas DESC
LIMIT 10;
```

**Hallazgos:** El cliente con mayor saldo acumulado es **Thomas Cardenas**, con $1,040,545.37, seguido de **Karen Murillo** ($1,003,731.76) y **Matthew Patterson** ($990,702.58). Los 10 clientes principales superan el millón o se acercan a él, muy por encima del saldo promedio por cuenta (~$100,000), lo que indica que probablemente tienen múltiples cuentas de alto valor.

### 4. ¿Cuál es el monto total y promedio transaccionado por mes?

```sql
SELECT strftime('%Y-%m', transaction_date) AS mes, SUM(amount_usd) AS monto_total, AVG(amount_usd) AS monto_promedio
FROM transactions
GROUP BY mes;
```

**Hallazgos:** El dataset cubre transacciones desde **enero de 2019 hasta diciembre de 2025** (84 meses). El monto total transaccionado por mes se mantiene notablemente estable, oscilando entre **$54M y $62M**, sin una tendencia de crecimiento o caída marcada a lo largo de los 7 años. El monto promedio por transacción también es muy constante, rondando siempre los **$4,950–$5,050**, lo que sugiere que el volumen y el valor de las transacciones no varían estacionalmente ni muestran inflación o crecimiento en el dataset.

### 5. ¿Cuántas transacciones y qué monto se registraron por comercio, agrupado por ciudad?

```sql
SELECT m.city, COUNT(DISTINCT t.transaction_id) AS Numero_transacciones,
       SUM(t.amount_usd) AS monto_total, AVG(t.amount_usd) AS Monto_promedio
FROM transactions AS t
JOIN merchants AS m ON t.merchant_id = m.merchant_id
GROUP BY m.city
ORDER BY Monto_promedio DESC;
```

**Hallazgos:** Existen 4,317 combinaciones de ciudad-comercio registradas. Ordenando por monto promedio de transacción (de mayor a menor), las ciudades líderes son **Cabrerachester** ($5,761.08, 187 transacciones), **Port Russell** ($5,694.72, 178 transacciones), **Moniquechester** ($5,657.64, 214 transacciones), **New Zachary** ($5,630.27, 188 transacciones) y **Brittneybury** ($5,618.07, 218 transacciones). La diferencia entre estas ciudades líderes es pequeña, lo que sugiere que el monto promedio por transacción es bastante homogéneo entre las ciudades con mejor desempeño.

---

