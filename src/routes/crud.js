import express from "express";
import fs from "fs";
const crudRoute = express.Router();

crudRoute.post("/add", (req, rest, next) => {
  let username = req.body.username;
  try {
    // read nodes from existing file, process into array
    let list = Array.from(JSON.parse(fs.readFileSync(`../data/${username}.json`));
  } catch {
    // if reading the file errors for any reason it'll overwrite the whole thing oh well
    let list = [];
  }

  // parse incoming request, apply all its properties to newly created node
  let newNode = {
    id: 0,
    type: req.body.type,
    name: req.body.name,
    body: req.body.body,
    target: req.body.target,
    deadline: req.body.deadline,
    tags: req.body.tags,
    parents: req.body.parents,
    children: req.body.children,
    auxParents: req.body.auxParents,
    auxChildren: req.body.auxChildren,
    updated: null,
    created: Date.now(),
    completed: req.body.completed,
  };

  // check newly created node for validity

  // append newly created node to array of nodes
  list.push(newNode);

  // convert array of nodes to json, write to file
  fs.writeSync(`../data/${username}.json`, JSON.stringify({...list}));
});
