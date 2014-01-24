#
# * grunt-jsonselect
# * https://github.com/AndreasPizsa/grunt-jsonselect
# *
# * Copyright (c) 2014 Andreas Pizsa
# * Licensed under the MIT license.
# 
"use strict"
module.exports = (grunt) ->
	
	# Project configuration.
	grunt.initConfig
		coffee:
			compile:
				expand: true
				cwd: 'src'
				src: ['**/*.coffee']
				dest: '.'
				ext: '.js'
			tests:
				expand: true
				cwd: 'test'
				src: ['**/*.coffee']
				dest: 'test'
				ext: '.js'

		jshint:
			all: ["Gruntfile.js", "tasks/*.js", "<%= nodeunit.tests %>"]
			options:
				jshintrc: ".jshintrc"

		jsonselect:
			tests:
				item:			'.objects > *'
				filename:	'.id'
				expand: true
				flatten: true
				cwd:	'test'
				src:	'fixtures/*.json'
				dest:	'tmp'
				ext:	'.json'

		# Before generating any new files, remove any previously-created files.
		clean:
			tests: ["tmp"]

		# Unit tests.
		nodeunit:
			tests: ["test/*_test.js"]

	
	# Actually load this plugin's task(s).
	grunt.loadTasks "src/tasks"
	
	# These plugins provide necessary tasks.
	require('load-grunt-tasks')(grunt);

	# Whenever the "test" task is run, first clean the "tmp" dir, then run this
	# plugin's task(s), then test the result.
	grunt.registerTask "test", ["clean", "jsonselect", "nodeunit"]
	
	# By default, lint and run all tests.
	grunt.registerTask "default", ["coffee", "jshint", "test"]