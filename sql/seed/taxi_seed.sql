-- ============================================================
-- NYC TAXI OLTP SEED - Course Spine v1
-- 30 taxi trips across 3 vendors, 8 zones, 5 payment types
-- Runs in PostgreSQL 16 (DataLearn SQL Sandbox default)
-- ============================================================

-- Clean slate (reverse dependency order)
DROP TABLE IF EXISTS taxi_trips    CASCADE;
DROP TABLE IF EXISTS taxi_zones    CASCADE;
DROP TABLE IF EXISTS vendors       CASCADE;
DROP TABLE IF EXISTS rate_codes    CASCADE;
DROP TABLE IF EXISTS payment_types CASCADE;

-- ---------- Lookups ----------

CREATE TABLE vendors (
  vendor_id   INTEGER      PRIMARY KEY,
  vendor_name VARCHAR(50)  UNIQUE NOT NULL
);
INSERT INTO vendors VALUES
  (1, 'Creative Mobile Technologies'),
  (2, 'VeriFone Inc.'),
  (3, 'Independent Cab Co-Op');

CREATE TABLE rate_codes (
  rate_code_id   INTEGER     PRIMARY KEY,
  rate_code_name VARCHAR(50) UNIQUE NOT NULL
);
INSERT INTO rate_codes VALUES
  (1, 'Standard'),
  (2, 'JFK'),
  (3, 'Newark'),
  (4, 'Nassau/Westchester'),
  (5, 'Negotiated');

CREATE TABLE payment_types (
  payment_type_id   INTEGER     PRIMARY KEY,
  payment_type_name VARCHAR(50) UNIQUE NOT NULL
);
INSERT INTO payment_types VALUES
  (1, 'Credit card'),
  (2, 'Cash'),
  (3, 'No charge'),
  (4, 'Dispute'),
  (5, 'Unknown');

CREATE TABLE taxi_zones (
  zone_id      INTEGER      PRIMARY KEY,
  borough      VARCHAR(30)  NOT NULL,
  zone_name    VARCHAR(100) NOT NULL,
  service_zone VARCHAR(30)
);
INSERT INTO taxi_zones VALUES
  (132, 'Queens',    'JFK Airport',                'Airports'),
  (138, 'Queens',    'LaGuardia Airport',          'Airports'),
  (161, 'Manhattan', 'Midtown Center',             'Yellow Zone'),
  (163, 'Manhattan', 'Midtown North',              'Yellow Zone'),
  (170, 'Manhattan', 'Murray Hill',                'Yellow Zone'),
  (186, 'Manhattan', 'Penn Station',               'Yellow Zone'),
  (230, 'Manhattan', 'Times Sq/Theatre District',  'Yellow Zone'),
  (79,  'Manhattan', 'East Village',               'Yellow Zone');

-- ---------- Fact ----------

CREATE TABLE taxi_trips (
  trip_id          BIGSERIAL     PRIMARY KEY,
  vendor_id        INTEGER       NOT NULL REFERENCES vendors(vendor_id),
  pickup_zone_id   INTEGER       NOT NULL REFERENCES taxi_zones(zone_id),
  dropoff_zone_id  INTEGER       NOT NULL REFERENCES taxi_zones(zone_id),
  rate_code_id     INTEGER       NOT NULL REFERENCES rate_codes(rate_code_id),
  payment_type_id  INTEGER       NOT NULL REFERENCES payment_types(payment_type_id),
  pickup_datetime  TIMESTAMPTZ   NOT NULL,
  dropoff_datetime TIMESTAMPTZ   NOT NULL,
  passenger_count  INTEGER       NOT NULL,
  trip_distance    NUMERIC(6,2)  NOT NULL,
  fare_amount      NUMERIC(8,2)  NOT NULL,
  tip_amount       NUMERIC(8,2)  NOT NULL DEFAULT 0,
  total_amount     NUMERIC(8,2)  NOT NULL
);

INSERT INTO taxi_trips
  (vendor_id, pickup_zone_id, dropoff_zone_id, rate_code_id, payment_type_id,
   pickup_datetime, dropoff_datetime, passenger_count, trip_distance,
   fare_amount, tip_amount, total_amount)
VALUES
  (1, 132, 161, 2, 1, '2026-01-05 08:12:00+00', '2026-01-05 08:47:00+00', 1, 18.5, 52.00, 12.00, 68.30),
  (1, 138, 230, 1, 1, '2026-01-05 09:03:00+00', '2026-01-05 09:22:00+00', 2, 8.2,  24.50, 5.00,  32.80),
  (2, 161, 79,  1, 2, '2026-01-05 12:45:00+00', '2026-01-05 12:58:00+00', 1, 2.1,  8.50,  0.00,  10.30),
  (2, 163, 132, 2, 1, '2026-01-05 14:20:00+00', '2026-01-05 14:52:00+00', 3, 17.8, 52.00, 10.00, 65.80),
  (1, 230, 170, 1, 1, '2026-01-05 18:11:00+00', '2026-01-05 18:29:00+00', 2, 3.4,  14.00, 3.20,  19.00),
  (3, 79,  186, 1, 2, '2026-01-06 07:33:00+00', '2026-01-06 07:52:00+00', 1, 4.2,  16.50, 0.00,  18.30),
  (1, 132, 163, 2, 1, '2026-01-06 09:15:00+00', '2026-01-06 09:48:00+00', 1, 19.1, 52.00, 11.00, 67.30),
  (2, 186, 161, 1, 1, '2026-01-06 11:20:00+00', '2026-01-06 11:33:00+00', 1, 2.3,  9.00,  2.00,  12.80),
  (2, 170, 132, 2, 1, '2026-01-06 15:44:00+00', '2026-01-06 16:20:00+00', 4, 18.9, 52.00, 13.00, 68.30),
  (1, 161, 138, 1, 1, '2026-01-06 17:00:00+00', '2026-01-06 17:34:00+00', 2, 9.4,  28.00, 6.50,  37.10),
  (1, 230, 79,  1, 2, '2026-01-06 19:22:00+00', '2026-01-06 19:37:00+00', 1, 3.7,  15.00, 0.00,  16.80),
  (3, 138, 163, 1, 1, '2026-01-07 06:15:00+00', '2026-01-07 06:41:00+00', 1, 10.2, 30.00, 7.00,  40.10),
  (2, 132, 230, 2, 1, '2026-01-07 10:10:00+00', '2026-01-07 10:44:00+00', 2, 20.5, 52.00, 12.50, 68.80),
  (1, 79,  161, 1, 2, '2026-01-07 12:50:00+00', '2026-01-07 13:05:00+00', 1, 2.2,  8.50,  0.00,  10.30),
  (1, 163, 132, 2, 1, '2026-01-07 15:33:00+00', '2026-01-07 16:04:00+00', 3, 18.4, 52.00, 11.50, 67.80),
  (2, 230, 186, 1, 1, '2026-01-07 18:45:00+00', '2026-01-07 19:02:00+00', 2, 3.9,  15.50, 3.00,  20.30),
  (3, 186, 79,  1, 2, '2026-01-07 20:15:00+00', '2026-01-07 20:29:00+00', 1, 2.8,  11.00, 0.00,  12.80),
  (1, 132, 170, 2, 1, '2026-01-08 08:00:00+00', '2026-01-08 08:35:00+00', 1, 19.6, 52.00, 11.00, 67.30),
  (2, 138, 161, 1, 1, '2026-01-08 09:22:00+00', '2026-01-08 09:47:00+00', 2, 8.6,  25.50, 5.50,  33.30),
  (1, 161, 230, 1, 1, '2026-01-08 13:15:00+00', '2026-01-08 13:34:00+00', 1, 3.1,  12.50, 2.80,  17.10),
  (2, 170, 79,  1, 2, '2026-01-08 16:00:00+00', '2026-01-08 16:24:00+00', 2, 4.8,  17.50, 0.00,  19.30),
  (3, 132, 163, 2, 1, '2026-01-08 19:45:00+00', '2026-01-08 20:22:00+00', 4, 19.3, 52.00, 12.00, 67.80),
  (1, 230, 138, 1, 1, '2026-01-09 07:00:00+00', '2026-01-09 07:33:00+00', 2, 9.2,  27.50, 6.00,  35.30),
  (2, 79,  186, 1, 2, '2026-01-09 10:22:00+00', '2026-01-09 10:42:00+00', 1, 4.4,  16.50, 0.00,  18.30),
  (1, 163, 132, 2, 1, '2026-01-09 14:15:00+00', '2026-01-09 14:49:00+00', 3, 18.7, 52.00, 11.50, 67.80),
  (2, 161, 170, 1, 1, '2026-01-09 17:33:00+00', '2026-01-09 17:51:00+00', 1, 3.5,  14.00, 3.00,  18.80),
  (3, 138, 230, 1, 1, '2026-01-09 20:11:00+00', '2026-01-09 20:38:00+00', 2, 9.9,  28.50, 6.50,  37.80),
  (1, 132, 186, 2, 1, '2026-01-10 08:44:00+00', '2026-01-10 09:19:00+00', 1, 18.8, 52.00, 11.50, 67.80),
  (2, 186, 132, 2, 1, '2026-01-10 12:12:00+00', '2026-01-10 12:47:00+00', 2, 19.0, 52.00, 12.00, 67.80),
  (3, 79,  163, 1, 2, '2026-01-10 16:05:00+00', '2026-01-10 16:22:00+00', 1, 3.6,  14.50, 0.00,  16.30);

-- ---------- Sanity check ----------
-- Runs live at the end of the seed. Returns 5 rows so you can eyeball
-- the row counts against expectations without opening a new tab.
-- Expected: taxi_trips=30, taxi_zones=8, vendors=3, rate_codes=5, payment_types=5
SELECT 'taxi_trips'    AS table_name, COUNT(*) AS row_count FROM taxi_trips
UNION ALL SELECT 'taxi_zones',    COUNT(*) FROM taxi_zones
UNION ALL SELECT 'vendors',       COUNT(*) FROM vendors
UNION ALL SELECT 'rate_codes',    COUNT(*) FROM rate_codes
UNION ALL SELECT 'payment_types', COUNT(*) FROM payment_types;
