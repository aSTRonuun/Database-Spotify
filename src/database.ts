import { Pool } from "pg";

export const pool = new Pool({
    user: "postgres",
    host: "localhost",
    password: "admin",
    database: "spotify",
    port: 5432
});