-- CREATE OR REPLACE PROCEDURE latefee(
--     LateFeeAmount DECIMAL, customer INTEGER)

-- AS
-- $$
-- BEGIN
-- --Add the late fee to customers with the customer id of customer
--     UPDATE payments 
--     SET amount = amount + lateFeeAmount
--     WHERE customer_id = customer;
--     COMMIT;
-- END;
-- $$
-- LANGUAGE plpgsql;

-- DROP PROCEDURE latefee;

-- CALL latefee(16, 10.00)
-- -- SELECT * FROM customer;

-- SELECT customer_id, amount
-- FROM payment
-- WHERE customer_id =16;


-- SELECT * FROM actor;

-- CREATE OR REPLACE FUNCTION add_actor_123(
--     _first_name VARCHAR, 
--     _last_name VARCHAR
-- )
-- RETURNS void
-- AS
-- $MAIN$
-- BEGIN
--     INSERT INTO actor(first_name, last_name, last_update)
--     VALUES(_first_name, _last_name, NOW()::timestamp);
-- END;
-- $MAIN$
-- LANGUAGE plpgsql;

-- SELECT add_actor_123('Kyle','Largent');
SELECT actor FROM actor WHERE first_name and last_name LIKE 'Kyle Largent'

-- SELECT * FROM actor WHERE last_name= 'Largent' AND first_name = 'kyle'