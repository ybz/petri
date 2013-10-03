module.exports = (grunt) ->

    grunt.initConfig {
        pkg: grunt.file.readJSON('package.json')
        coffee:
            dev:
                files: [{
                    expand: true
                    cwd: 'src/'
                    src: '**/*.coffee'
                    dest: 'build/'
                    ext: '.js'
                }]

    }

    grunt.loadNpmTasks 'grunt-contrib-coffee'

    grunt.registerTask 'some-task', 'a test task', ->
        grunt.log.write('test task running ').ok()
        return



    return
