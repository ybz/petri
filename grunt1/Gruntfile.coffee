module.exports = (grunt) ->

    grunt.initConfig {
        pkg: grunt.file.readJSON('package.json')
        coffee:
            all:
                files: [{
                    src: 'src/*.coffee'
                    dest: 'build/test.js'
                }]

    }

    grunt.loadNpmTasks 'grunt-contrib-coffee'

    grunt.registerTask 'some-task', 'a test task', ->
        grunt.log.write('test task running ').ok()
        return



    return
