require [
    'jquery'
    'lodash'
    'codemirror'
], (
    $
    _
    CodeMirror
) ->
    console.log "main here yo 2"
    editor = null

    onEditorChange = _.debounce ((args...) ->
        console.log 'there was an editor change ', args...
    ), 1000, trailing: true

    initEditor = ->
        host_el = $('.editor_panel')
        editor = CodeMirror host_el[0],
            value: 'Start typing'
            lineNumbers: true
        window.editor = editor

        editor.on 'change', onEditorChange


    $ ->
        initEditor()
    return {}
