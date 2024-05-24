import mysql from "mysql2";

const db = mysql
  .createPool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_DATABASE,
  })
  .promise(); // 이렇게 하면 promise를 사용할 수 있다.

export default db;
