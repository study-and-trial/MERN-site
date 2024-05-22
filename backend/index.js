const express = require("express");
const app = express();
const PORT = 5001;

app.use(express.json()); // 모든 express 프로젝트가 json을 사용하는것은 아니다.

app.get("/item", (req, res) => {
  res.status(200).send({
    name: "macbook air",
    price: 1000,
  });
});

app.post("/item/:id", (req, res) => {
  const { id } = req.params;
  const { price } = req.body;

  if (!price) {
    return res.status(418).send({
      error: "Price is required",
    });
  }

  res.status(200).send({
    name: `macbook air ${id}`,
    price,
  });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
