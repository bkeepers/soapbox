ApplicationWindow = require './application-window'
ipc = require('ipc')
app = require('app')  # Module to control application life.

module.exports =
class Application

  windows: null

  constructor: (options) ->
    global.application = this

    # Report crashes to our server.
    require('crash-reporter').start()

    # Quit when all windows are closed.
    app.on 'window-all-closed', -> app.quit() if process.platform != 'darwin'
    app.on 'ready', @ready

    ipc.on "open-file", (event, path) => @open(path)

  ready: =>
    # Create the browser window.
    mainWindow = new BrowserWindow({width: 400, height: 300})

    # and load the index.html of the app.
    mainWindow.loadUrl('file://' + __dirname + '/../../open.html')

    # Emitted when the window is closed.
    mainWindow.on 'closed', ->
      # Dereference the window object, usually you would store windows
      # in an array if your app supports multi windows, this is the time
      # when you should delete the corresponding element.
      mainWindow = null

    @windows.push mainWindow

  open: (path) ->
    window = new ApplicationWindow(path)
    @windows.push()
