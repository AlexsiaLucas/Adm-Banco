# 🎓 Trabalho de Administração de Banco de Dados

## 📌 Integrantes

* Aléxsia Lucas
* Heitor Hugo

---

## 📖 Descrição

Este trabalho consiste na importação do banco de dados de exemplo **dvdrental** no PostgreSQL e na criação de consultas utilizando:

* Views
* Joins
* Sequences
* Union

---

## ⚙️ Tecnologias Utilizadas

* PostgreSQL
* Linux (Terminal)
* GitHub

---

## 🗄️ Etapas do Projeto

### 1. Criação do banco

Banco criado via terminal utilizando PostgreSQL.


```bash
sudo -u postgres createdb dvdrental
```

### 2. Importação do banco dvdrental

Utilizado arquivo `.tar` com pg_restore.

```bash
sudo -u postgres pg_restore -d dvdrental /home/ubuntu/dvdrental.tar
```

### 3. Verificação das tabelas

Comando utilizado:

```sql
sudo -u postgres psql
\dt
```

---

## 🧠 Atividades Desenvolvidas

### 🔹 1. View simples

```sql
CREATE VIEW vw_atores AS
SELECT actor_id, first_name, last_name
FROM actor;
```

---

### 🔹 2. View com JOIN (1:N)

```sql
CREATE VIEW vw_filme_atores AS
SELECT f.title, a.first_name, a.last_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id;
```

---

### 🔹 3. Sequences + Inserts

```sql
CREATE SEQUENCE seq_categoria START 1;

INSERT INTO category (category_id, name)
VALUES (nextval('seq_categoria'), 'Ação');

INSERT INTO category (category_id, name)
VALUES (nextval('seq_categoria'), 'Drama');
```

---

### 🔹 4. UNION

```sql
CREATE VIEW vw_pessoas AS
SELECT first_name, last_name FROM customer
UNION
SELECT first_name, last_name FROM staff;
```

---

### 🔹 5. Quantidade de filmes por cliente

```sql
CREATE VIEW vw_qtd_filmes_cliente AS
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nome,
    COUNT(r.rental_id) AS quantidade_filmes
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, nome;
```

---

### 🔹 6. Filmes alugados por cliente

```sql
CREATE VIEW vw_filmes_cliente AS
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nome,
    f.title
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN film f ON i.film_id = f.film_id;
```

---

## 📸 Prints

Os prints estão disponíveis na pasta `/prints`.

---

## 🚀 Como executar o projeto

```bash
sudo -u postgres createdb dvdrental
sudo -u postgres pg_restore -d dvdrental -F t dvdrental.tar
sudo -u postgres psql -d dvdrental
```

---

## ✅ Conclusão

O projeto demonstrou a utilização prática de conceitos fundamentais de banco de dados, incluindo consultas complexas, manipulação de dados e modelagem relacional.
