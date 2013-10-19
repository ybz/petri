require [
    'jquery'
    './App'
    './hbs!template'
], (
    $
    App
    template
) ->
    $ ->
        app = new App()
        window.app = app
        $('body').append template({name:'bozo'})
    return
