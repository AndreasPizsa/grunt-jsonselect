(function() {
  "use strict";
  module.exports = function(grunt) {
    return grunt.registerMultiTask("jsonselect", "Select elements from a JSON file and write them to individual JSON files.", function() {
      var jsonselect, path, theFilenameSelector, theItemFilter, theItemSelector, _ref;
      jsonselect = require('JSONSelect');
      theItemSelector = this.data.item;
      theFilenameSelector = this.data.filename;
      theItemFilter = (_ref = this.data.itemFilter) != null ? _ref : function() {
        return true;
      };
      if (!theItemSelector) {
        grunt.fail.fatal('"item" is required');
      }
      if (!theFilenameSelector) {
        grunt.fail.fatal('"filename" is required');
      }
      path = require('path');
      return this.files.forEach(function(f) {
        var src;
        return src = f.src.filter(function(filepath) {
          if (grunt.file.exists(filepath)) {
            return true;
          }
          grunt.log.warn("Source file \"" + filepath + "\" not found.");
          return false;
        }).map(function(filepath) {
          var theData;
          theData = grunt.file.readJSON(filepath);
          return jsonselect.forEach(theItemSelector, theData, function(inObject) {
            var theFilename;
            if (!theItemFilter(inObject)) {
              return;
            }
            theFilename = path.dirname(f.dest) + path.sep + jsonselect.match(theFilenameSelector, inObject) + path.extname(f.dest);
            grunt.log.writeln("File \"" + theFilename + "\" created.");
            return grunt.file.write(theFilename, JSON.stringify(inObject));
          });
        });
      });
    });
  };

}).call(this);
