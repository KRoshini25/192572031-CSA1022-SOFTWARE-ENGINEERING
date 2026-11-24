const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
const notes = [];

app.get("/", (_req, res) => res.sendFile(__dirname + "/index.html"));

app.get("/notes", (_req, res) => res.json(notes));

app.post("/notes", (req, res) => {
  const text = (req.body && req.body.note || "").trim();
  if (!text) return res.status(400).json({ error: "Note is required" });
  const note = { id: notes.length + 1, text };
  notes.push(note);
  res.status(201).json(note);
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Notes app running on port ${PORT}`);
});
