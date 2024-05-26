import express from "express";
const app = express();
const PORT = process.env.BE_PORT;
import db from "./configs/database.js";

app.use(express.json()); // 모든 express 프로젝트가 json을 사용하는것은 아니다.

app.get("/items", async (_req, res) => {
  const [rows] = await db.query("SELECT * FROM devices");

  res.status(200).json(rows);
});

app.post("/item/create/:name", async (req, res) => {
  const { name } = req.params;
  const { price } = req.body;

  if (!price) {
    return res.status(418).send({
      error: "Price is required",
    });
  }

  const [rows] = await db.query(
    "insert into devices (name, price) values (?, ?)",
    [name, price]
  );

  if (rows.affectedRows === 1) {
    res.status(200).send({
      message: "success to insert",
      name,
      price,
    });
  } else {
    return res.status(500).send({
      error: "fail to insert",
    });
  }
});

app.listen(PORT || 4001, () => {
  console.log(`Server is running on port ${PORT}`);
});
