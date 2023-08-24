import pg from "pg";
import { Router } from "express";

const router = Router();

const pool = new pg.Pool({
  user: "postgres",
  host: "localhost",
  database: "recipeguru",
  port: 5432,
});

router.get("/type/:id", async (req, res) => {
  // const { type } = req.query;
  debugger;
  const id = req.params.id
  console.log("get ingredients", id);
  const { rows } = await pool.query(
    "SELECT * FROM ingredients WHERE type =$1",
    [id]
  );
  res.json({ rows }).end();
});

export default router;
