import { Router } from "express";
import { body, validationResult } from "express-validator";
import ingredients from "./ingredients/api.js";

const router = Router();

router.get("/allrecipe", (req, res) => {});

router.get("/ingredient/:id", body("name").isString(), (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    res.status(400);
    res.json({ errors: errors.array() });
  } else {
    res.json({ data: [] });
  }
});

router.use("/ingredients", ingredients);

export default router;
