module.exports = (grunt) ->

    grunt.initConfig {
        pkg: grunt.file.readJSON('package.json')
    }

    grunt.registerTask 'some-task', 'a test task', ->
        grunt.log.write('test task running ').ok()
        return

    grunt.registerTask 'default', ['some-task']

    return
