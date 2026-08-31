#1. Cuales son las ciudades con la mayor cantidad de clientes
SELECT 
    city AS ciudad,
    COUNT(DISTINCT customer_id) AS Numero_clientes
FROM customers
GROUP BY city
ORDER BY Numero_clientes DESC
LIMIT 10;


#2. ¿Cuál es el saldo total y promedio de cuentas por tipo de cuenta?
SELECT 
    account_type,
    AVG(balance_usd) AS saldo_promedio,
    SUM(balance_usd) AS saldo_total_cuentas
FROM accounts
GROUP BY account_type;

#3. ¿Cuáles son los 10 clientes con mayor saldo total sumando todas sus cuentas?
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(a.balance_usd) AS saldo_cuentas
FROM customers AS c
LEFT JOIN accounts AS a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id
ORDER BY saldo_cuentas DESC
LIMIT 10;

# 4. ¿Cuál es el monto total y promedio transaccionado por mes?
SELECT 
    strftime('%Y-%m', transaction_date) AS mes,
    SUM(amount_usd) AS monto_total,
    AVG(amount_usd) AS monto_promedio
FROM transactions
GROUP BY mes;


# 5.¿Cuántas transacciones y qué monto se registraron por comercio, agrupado por ciudad?
SELECT 
     m.city,
     COUNT(DISTINCT t.transaction_id) AS Numero_transacciones,
    SUM(t.amount_usd) AS monto_total,
    AVG(t.amount_usd) AS Monto_promedio
FROM transactions as t
JOIN merchants as m
    ON t.merchant_id = m.merchant_id
GROUP BY m.city
ORDER BY Monto_promedio DESC;
