console.log 'config ran 2'
require.config
    baseUrl: 'app'
    paths:
        jquery: '../vendor/jquery/jquery-1.10.2'
        codemirror: '../vendor/codemirror/codemirror'
        lodash: '../vendor/lodash/lodash'
        Handlebars: '../vendor/handlebars/handlebars'
        text: '../vendor/requirejs-text/text'
        hbs: '../vendor/requirejs-handlebars/hbars'

    shim:
        codemirror:
            exports: 'CodeMirror'
        lodash:
            exports: '_'
        Handlebars:
            exports: 'Handlebars'

    hbars:
        extension: '.hbs'

    # used for DEV remove on build
    urlArgs: "bust=" + (new Date()).getTime()
