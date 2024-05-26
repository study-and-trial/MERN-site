import { useState } from "react";
import axios from "axios";

const BASE_URL = "api";

interface Item {
  id: number;
  name: string;
  price: number;
  created_at: Date;
}

function App() {
  const [items, setItems] = useState<Item[]>();

  const getItems = async () => {
    try {
      const { data } = await axios.get(`${BASE_URL}/items`);

      const items = data.map((item: any) => ({
        ...item,
        created_at: new Date(item.created_at),
      }));

      setItems(items);
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <>
      <button onClick={getItems}>get itmes</button>
      <h2>List of items:</h2>
      {items?.map((item) => (
        <p key={item.id}>
          {item.created_at.toLocaleDateString()}: {item.name}, {item.price}
        </p>
      ))}
    </>
  );
}

export default App;
