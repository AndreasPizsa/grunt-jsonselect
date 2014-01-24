(function() {
  "use strict";
  var grunt;

  grunt = require("grunt");

  exports.jsonselect = {
    setUp: function(done) {
      return done();
    },
    fileone: function(test) {
      var actual, expected;
      test.expect(1);
      actual = grunt.file.read("tmp/file1.json");
      expected = grunt.file.read("test/expected/file1.json");
      test.equal(actual, expected, "should describe what the default behavior is.");
      return test.done();
    },
    filetwo: function(test) {
      var actual, expected;
      test.expect(1);
      actual = grunt.file.read("tmp/file2.json");
      expected = grunt.file.read("test/expected/file2.json");
      test.equal(actual, expected, "should describe what the custom option(s) behavior is.");
      return test.done();
    }
  };

}).call(this);
