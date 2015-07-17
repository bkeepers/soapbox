ipc = require('ipc')

# Handle local files
file = document.getElementById("file")
file.addEventListener "change", (e) ->
  ipc.send("open-file", "file://#{file.path}") for file in @files
  window.close()

document.querySelector("form").addEventListener "submit", ->
  ipc.send "open-file", document.getElementById("url").value
  window.close()
