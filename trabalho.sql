-- VIEW SIMPLES
CREATE VIEW vw_atores AS
SELECT actor_id, first_name, last_name
FROM actor;

-- VIEW JOIN
CREATE VIEW vw_filme_atores AS
SELECT f.title, a.first_name, a.last_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id;

-- SEQUENCE + INSERT
CREATE SEQUENCE seq_categoria START 1;

INSERT INTO category (category_id, name)
VALUES (nextval('seq_categoria'), 'Ação');

INSERT INTO category (category_id, name)
VALUES (nextval('seq_categoria'), 'Drama');

-- UNION
CREATE VIEW vw_pessoas AS
SELECT first_name, last_name FROM customer
UNION
SELECT first_name, last_name FROM staff;

-- QTD FILMES
CREATE VIEW vw_qtd_filmes_cliente AS
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nome,
    COUNT(r.rental_id) AS quantidade_filmes
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, nome;

-- FILMES POR CLIENTE
CREATE VIEW vw_filmes_cliente AS
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nome,
    f.title
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN film f ON i.film_id = f.film_id;
