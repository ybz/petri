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
        clean:
            build: ['build/*']

        compass:
            dev:
                options:
                    specify: ['src/index.scss']
                    sassDir: 'src/'
                    cssDir: 'build/'

        copy:
            dev: {
                files: [{
                    expand: true
                    cwd: 'src/'
                    src: ['**/*.css', '**/*.js', '**/*.html', '**/*.hbs']
                    dest: 'build/'
                }]
            }

        watch:
            coffee:
                files: 'src/**/*.coffee'
                tasks: ['coffee:dev']

        connect:
            server:
                options:
                    base: 'build'
                    keepalive: true


    }

    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-compass'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-connect'

    grunt.registerTask 'build:dev', 'build dev files', ['clean:build', 'coffee:dev', 'compass:dev', 'copy:dev']


    return
