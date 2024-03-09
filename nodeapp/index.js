import fetch from "node-fetch";

fetch('http://localhost:3000/api/v1/notes', {
  method: 'GET',
  headers: {
      'Accept': 'application/json',
  },
})
.then(response => response.json())
.then(response => console.log(JSON.stringify(response)))

fetch('http://localhost:3000/api/v1/notes', {
  method: 'POST',
  headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
  },
  body: JSON.stringify({ "title": "New Note", content: "Add new Note" })
})
.then(response => response.json())
.then(response => console.log(JSON.stringify(response)))