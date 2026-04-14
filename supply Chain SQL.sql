
SELECT * FROM supply_chain_data LIMIT 10;


ALTER TABLE supply_chain_data RENAME COLUMN "Product type" TO product_type;
ALTER TABLE supply_chain_data RENAME COLUMN "Number of products sold" TO products_sold;
ALTER TABLE supply_chain_data RENAME COLUMN "Revenue generated" TO revenue;
ALTER TABLE supply_chain_data RENAME COLUMN "Customer demographics" TO customer_demographics;
ALTER TABLE supply_chain_data RENAME COLUMN "Stock levels" TO stock_levels;
ALTER TABLE supply_chain_data RENAME COLUMN "Lead times" TO lead_times;
ALTER TABLE supply_chain_data RENAME COLUMN "Order quantities" TO order_quantity;
ALTER TABLE supply_chain_data RENAME COLUMN "Shipping times" TO shipping_time;
ALTER TABLE supply_chain_data RENAME COLUMN "Shipping carriers" TO shipping_carrier;
ALTER TABLE supply_chain_data RENAME COLUMN "Shipping costs" TO shipping_cost;
ALTER TABLE supply_chain_data RENAME COLUMN "Supplier name" TO supplier_name;
ALTER TABLE supply_chain_data RENAME COLUMN "Lead time" TO lead_time;
ALTER TABLE supply_chain_data RENAME COLUMN "Production volumes" TO production_volume;
ALTER TABLE supply_chain_data RENAME COLUMN "Manufacturing lead time" TO manufacturing_lead_time;
ALTER TABLE supply_chain_data RENAME COLUMN "Manufacturing costs" TO manufacturing_cost;
ALTER TABLE supply_chain_data RENAME COLUMN "Inspection results" TO inspection_result;
ALTER TABLE supply_chain_data RENAME COLUMN "Defect rates" TO defect_rate;
ALTER TABLE supply_chain_data RENAME COLUMN "Transportation modes" TO transport_mode;

ALTER TABLE supply_chain_data RENAME COLUMN "Price" TO price;
ALTER TABLE supply_chain_data RENAME COLUMN "SKU" TO sku;
ALTER TABLE supply_chain_data RENAME COLUMN "Availability" TO availability;
ALTER TABLE supply_chain_data RENAME COLUMN "Costs" TO costs;

-- Revenue Overview

CREATE VIEW revenue_summary AS
SELECT 
    SUM(revenue) AS total_revenue,
    SUM(products_sold) AS total_products_sold,
    AVG(price) AS avg_price
FROM supply_chain_data;

-- Product Performance
CREATE VIEW product_performance AS
SELECT 
    product_type,
    SUM(revenue) AS total_revenue,
    SUM(products_sold) AS total_sold,
    AVG(price) AS avg_price
FROM supply_chain_data
GROUP BY product_type;

-- Supplier Performance
CREATE VIEW supplier_performance AS
SELECT 
    supplier_name,
    SUM(revenue) AS total_revenue,
    AVG(lead_time) AS avg_lead_time,
    AVG(defect_rate) AS avg_defect_rate
FROM supply_chain_data
GROUP BY supplier_name;

ALTER TABLE supply_chain_data RENAME COLUMN "Location" TO location;

-- Location Performance
CREATE VIEW location_performance AS
SELECT 
    location,
    SUM(revenue) AS total_revenue,
    SUM(products_sold) AS total_sales,
    AVG(shipping_time) AS avg_shipping_time
FROM supply_chain_data
GROUP BY location;


-- 5. Shipping Analysis


CREATE VIEW shipping_analysis AS
SELECT 
    shipping_carrier,
    transport_mode,
    AVG(shipping_cost) AS avg_shipping_cost,
    AVG(shipping_time) AS avg_shipping_time
FROM supply_chain_data
GROUP BY shipping_carrier, transport_mode;