import express from "express";
import router from "./router.js";
import morgan from "morgan";

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(morgan("dev"));

app.get("/", (_, res) => {
  res.status(200);
  res.json({ message: "hello" });
});
app.use("/api", router);

export default app;
