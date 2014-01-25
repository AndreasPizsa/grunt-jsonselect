#
# * grunt-jsonselect
# * https://github.com/AndreasPizsa/grunt-jsonselect
# *
# * Copyright (c) 2014 Andreas Pizsa
# * Licensed under the MIT license.
# 
"use strict"
module.exports = (grunt) ->
	
	# Please see the Grunt documentation for more information regarding task
	# creation: http://gruntjs.com/creating-tasks
	grunt.registerMultiTask "jsonselect", "Select elements from a JSON file and write them to individual JSON files.", ->
		jsonselect = require 'JSONSelect'
		theItemSelector     = @data.item
		theFilenameSelector = @data.filename
		theItemFilter				= @data.itemFilter ? ()-> true

		grunt.fail.fatal('"item" is required') if not theItemSelector
		grunt.fail.fatal('"filename" is required') if not theFilenameSelector

		path = require 'path'

		# Iterate over all specified file groups.
		@files.forEach (f) ->
			
			# Warn on and remove invalid source files (if nonull was set).
			# Read file source.
			src = f.src.filter((filepath) ->
				return true if grunt.file.exists(filepath)
				grunt.log.warn "Source file \"" + filepath + "\" not found."
				false
			).map((filepath) ->
				theData = grunt.file.readJSON filepath
				jsonselect.forEach theItemSelector,theData,(inObject)->
					return if not theItemFilter(inObject)
					theFilename = path.dirname(f.dest) + path.sep + jsonselect.match(theFilenameSelector,inObject) + path.extname(f.dest)
					grunt.log.writeln "File \"" + theFilename + "\" created."
					grunt.file.write theFilename, JSON.stringify(inObject)
			)