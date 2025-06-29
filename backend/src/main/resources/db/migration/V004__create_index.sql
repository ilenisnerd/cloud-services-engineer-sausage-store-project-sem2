-- migrations/V004__create_index.sql

-- Индексы для оптимизации
CREATE INDEX IF NOT EXISTS idx_order_product_product_id ON order_product(product_id);
CREATE INDEX IF NOT EXISTS orders_status_date_idx ON orders(status, date_created); 
CREATE INDEX IF NOT EXISTS order_product_order_id_idx ON order_product(order_id); 