-- =================================================
-- Shared / admin database
-- Database: postgresdb
-- User: postgres
-- (Created automatically by Docker image)
-- =================================================


-- =====================================================================
--                          BILLING SERVICE
-- =====================================================================

-- =================================================
-- Billing Service - Shared
-- Database: billing_shared_db
-- User: billing_shared_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'billing_shared_user') THEN
      CREATE ROLE billing_shared_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE billing_shared_db OWNER billing_shared_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'billing_shared_db'
)\gexec

-- =================================================
-- Billing Service - INA Tenant
-- Database: billing_ina_db
-- User: billing_ina_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'billing_ina_user') THEN
      CREATE ROLE billing_ina_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE billing_ina_db OWNER billing_ina_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'billing_ina_db'
)\gexec

-- =================================================
-- Billing Service - Makpetrol Tenant
-- Database: billing_makpetrol_db
-- User: billing_makpetrol_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'billing_makpetrol_user') THEN
      CREATE ROLE billing_makpetrol_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE billing_makpetrol_db OWNER billing_makpetrol_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'billing_makpetrol_db'
)\gexec

-- =================================================
-- Billing Service - Petrol Tenant
-- Database: billing_petrol_db
-- User: billing_petrol_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'billing_petrol_user') THEN
      CREATE ROLE billing_petrol_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE billing_petrol_db OWNER billing_petrol_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'billing_petrol_db'
)\gexec


-- =====================================================================
--                          PROVIDER SERVICE
-- =====================================================================

-- =================================================
-- Provider Service - Shared
-- Database: provider_shared_db
-- User: provider_shared_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'provider_shared_user') THEN
      CREATE ROLE provider_shared_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE provider_shared_db OWNER provider_shared_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'provider_shared_db'
)\gexec

-- =================================================
-- Provider Service - Master
-- Database: provider_master_db
-- User: provider_master_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'provider_master_user') THEN
      CREATE ROLE provider_master_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE provider_master_db OWNER provider_master_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'provider_master_db'
)\gexec

-- =================================================
-- Provider Service - INA Tenant
-- Database: provider_ina_db
-- User: provider_ina_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'provider_ina_user') THEN
      CREATE ROLE provider_ina_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE provider_ina_db OWNER provider_ina_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'provider_ina_db'
)\gexec

-- =================================================
-- Provider Service - Petrol Tenant
-- Database: provider_petrol_db
-- User: provider_petrol_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'provider_petrol_user') THEN
      CREATE ROLE provider_petrol_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE provider_petrol_db OWNER provider_petrol_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'provider_petrol_db'
)\gexec

-- =================================================
-- Provider Service - Makpetrol Tenant
-- Database: provider_makpetrol_db
-- User: provider_makpetrol_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'provider_makpetrol_user') THEN
      CREATE ROLE provider_makpetrol_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE provider_makpetrol_db OWNER provider_makpetrol_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'provider_makpetrol_db'
)\gexec


-- =====================================================================
--                          REVIEW SERVICE
-- =====================================================================

-- =================================================
-- Review Service - Master
-- Database: review_master_db
-- User: review_master_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'review_master_user') THEN
      CREATE ROLE review_master_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE review_master_db OWNER review_master_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'review_master_db'
)\gexec

-- =================================================
-- Review Service - Shared
-- Database: review_shared_db
-- User: review_shared_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'review_shared_user') THEN
      CREATE ROLE review_shared_user LOGIN PASSWORD 'secretpassword' CREATEDB;
   ELSE
      ALTER ROLE review_shared_user CREATEDB;
   END IF;
END
$$;

SELECT 'CREATE DATABASE review_shared_db OWNER review_shared_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'review_shared_db'
)\gexec

-- =================================================
-- Review Service - INA Tenant
-- Database: review_ina_db
-- User: review_ina_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'review_ina_user') THEN
      CREATE ROLE review_ina_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE review_ina_db OWNER review_ina_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'review_ina_db'
)\gexec

-- =================================================
-- Review Service - Petrol Tenant
-- Database: review_petrol_db
-- User: review_petrol_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'review_petrol_user') THEN
      CREATE ROLE review_petrol_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE review_petrol_db OWNER review_petrol_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'review_petrol_db'
)\gexec

-- =================================================
-- Review Service - Makpetrol Tenant
-- Database: review_makpetrol_db
-- User: review_makpetrol_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'review_makpetrol_user') THEN
      CREATE ROLE review_makpetrol_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE review_makpetrol_db OWNER review_makpetrol_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'review_makpetrol_db'
)\gexec


-- =====================================================================
--                          STATION SERVICE
-- =====================================================================

-- =================================================
-- Station Service - INA Tenant
-- Database: station_ina_db
-- User: station_ina_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'station_ina_user') THEN
      CREATE ROLE station_ina_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE station_ina_db OWNER station_ina_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'station_ina_db'
)\gexec

-- =================================================
-- Station Service - Makpetrol Tenant
-- Database: station_makpetrol_db
-- User: station_makpetrol_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'station_makpetrol_user') THEN
      CREATE ROLE station_makpetrol_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE station_makpetrol_db OWNER station_makpetrol_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'station_makpetrol_db'
)\gexec

-- =================================================
-- Station Service - Petrol Tenant
-- Database: station_petrol_db
-- User: station_petrol_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'station_petrol_user') THEN
      CREATE ROLE station_petrol_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE station_petrol_db OWNER station_petrol_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'station_petrol_db'
)\gexec


-- =====================================================================
--                          KEYCLOAK
-- =====================================================================

-- =================================================
-- Keycloak
-- Database: keycloak_db
-- User: keycloak_user
-- =================================================
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'keycloak_user') THEN
      CREATE ROLE keycloak_user LOGIN PASSWORD 'secretpassword';
   END IF;
END
$$;

SELECT 'CREATE DATABASE keycloak_db OWNER keycloak_user'
WHERE NOT EXISTS (
   SELECT 1 FROM pg_database WHERE datname = 'keycloak_db'
)\gexec