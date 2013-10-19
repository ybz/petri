require [
    'jquery'
    './App'
], (
    $
    App
) ->
    $ ->
        app = new App()
        window.app = app
    return
