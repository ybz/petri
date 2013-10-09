require [
    'jquery'
    'codemirror'
], (
    $
    CodeMirror
) ->
    console.log "main here yo 2"
    initEditor = ->
        host_el = $('.editor_panel')
        editor = CodeMirror host_el[0],
            value: 'Start typing'
            lineNumbers: true
        window.editor = editor

    $ ->
        initEditor()
    return {}
