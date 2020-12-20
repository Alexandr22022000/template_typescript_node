import { Application } from "express";

const code = process.env.CODE;

const router = (app: Application) => {
    app.get("/hello", (req, res) => {
        res.send("Hello " + code).status(600);
    });
};

export default router;
