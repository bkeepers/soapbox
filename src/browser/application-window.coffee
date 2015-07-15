BrowserWindow = require 'browser-window'

module.exports =
class ApplicationWindow
  window: null

  constructor: (path) ->
    @window = new BrowserWindow({})
    @window.loadUrl(path)
    
