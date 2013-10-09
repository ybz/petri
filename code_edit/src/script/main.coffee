require ['sub1'], (sub1) ->
    console.log "main here yo"
    sub1.greet()
    return {}
