ipc = require('ipc')

# Handle local files
file = document.getElementById("file")
file.addEventListener "change", (e) ->
  ipc.send("open-file", "file://#{file.path}") for file in @files

document.querySelector("form").addEventListener "submit", ->
  ipc.send "open-file", document.getElementById("url").value
