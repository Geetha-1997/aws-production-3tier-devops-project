const express = require("express");

const app = express();

const PORT = 3000;

app.get("/", (req, res) => {
    res.send("AWS Production 3-Tier DevOps Project");
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});