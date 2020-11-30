import express from "express";
import router from "./router";

const app = express();

app.set("PORT", 5000);

router(app);

app.listen(app.get("PORT"), () => console.log("Server is started on port " + app.get("PORT")));
