// Runs only on first container startup

// ===============================
// Shared user database
// ===============================
db = db.getSiblingDB("data_tracking_shared_db");

db.createUser({
  user: "data_tracking_shared_user",
  pwd: "secretpassword",
  roles: [{ role: "readWrite", db: "data_tracking_shared_db" }]
});

// Force DB creation
db.createCollection("healthcheck");

// ===============================
// Tenant: INA
// ===============================
db = db.getSiblingDB("data_tracking_ina_db");

db.createUser({
  user: "data_tracking_ina_user",
  pwd: "secretpassword",
  roles: [{ role: "readWrite", db: "data_tracking_ina_db" }]
});

db.createCollection("healthcheck");

// ===============================
// Tenant: PETROL
// ===============================
db = db.getSiblingDB("data_tracking_petrol_db");

db.createUser({
  user: "data_tracking_petrol_user",
  pwd: "secretpassword",
  roles: [{ role: "readWrite", db: "data_tracking_petrol_db" }]
});

db.createCollection("healthcheck");

// ===============================
// Tenant: MAKPETROL
// ===============================
db = db.getSiblingDB("data_tracking_makpetrol_db");

db.createUser({
  user: "data_tracking_makpetrol_user",
  pwd: "secretpassword",
  roles: [{ role: "readWrite", db: "data_tracking_makpetrol_db" }]
});

db.createCollection("healthcheck");
