ApplicationWindow = require './application-window'
ipc = require('ipc')
BrowserWindow = require('browser-window')
app = require('app')

module.exports =
class Application

  staticPath: "#{__dirname}/../../static"

  windows: null

  constructor: (options) ->
    global.application = this

    # Report crashes to our server.
    require('crash-reporter').start()

    # Quit when all windows are closed.
    app.on 'window-all-closed', -> app.quit() if process.platform != 'darwin'
    app.on 'ready', @ready

    ipc.on "open-file", (event, path) => @open(path)

    @windows = []

  ready: =>
    @openDialog()

  openDialog: ->
    openWindow = new BrowserWindow({width: 400, height: 110})
    openWindow.loadUrl("file://#{@staticPath}/open.html")
    @addWindow openWindow

  open: (path) ->
    if path.endsWith(".md")
      path = "file://#{@staticPath}/remark.html##{path}"

    @addWindow new ApplicationWindow(path)

  # Public: Removes the window from the global window list.
  removeWindow: (window) ->
    @windows.splice @windows.indexOf(window), 1

  # Public: Adds the window to the global window list.
  addWindow: (window) ->
    @windows.push window
    window.on "closed", => @removeWindow(window)
