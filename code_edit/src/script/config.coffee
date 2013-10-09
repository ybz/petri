console.log 'config ran 2'
require.config
    baseUrl: 'script'
    paths:
        jquery: '../vendor/jquery/jquery-1.10.2'
        codemirror: '../vendor/codemirror/codemirror'

    shim:
        codemirror:
            exports: 'CodeMirror'


