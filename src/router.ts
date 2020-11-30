import { Application } from "express";

const router = (app: Application) => {
    app.get("/*", (req, res) => {
        res.send("Hello world!").status(600);
    });
};

export default router;
