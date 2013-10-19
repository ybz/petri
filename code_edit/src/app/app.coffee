define [
    'jquery'
    'lodash'
    'codemirror'
], (
    $
    _
    CodeMirror
) ->
    class App
        constructor: (options={}) ->
            console.log 'app init 13'
            @initEditor()
            @initTitle()

        initTitle: ->
            @titleEl = $('.title .content')

        initEditor: ->
            host_el = $('.editor_panel')
            @editor = CodeMirror host_el[0],
                value: 'Start typing'
                lineNumbers: true
            window.editor = @editor
            editor.on 'change', @onEditorChange


        onEditorChange: -> _.debounce ((args...) ->
            console.log 'there was an editor change ', args...
        ), 1000, trailing: true

        setTitle: (title) ->
            @titleEl.html title

        setCode: (code) ->
            @editor.setValue code

        loadStep: (step) ->
            @setTitle(step.title or '')
            @setCode(step.code or '')

    return App
