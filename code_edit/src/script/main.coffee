require ['sub1', 'jquery'], (sub1, $) ->
    console.log "main here yo 2"
    sub1.greet()
    return {}
