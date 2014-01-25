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
    filetwo_should_not_exist: function(test) {
      test.expect(1);
      test.throws(function() {
        return grunt.file.read("tmp/file2.json");
      });
      return test.done();
    },
    filethree: function(test) {
      var actual, expected;
      test.expect(1);
      actual = grunt.file.read("tmp/file3.json");
      expected = grunt.file.read("test/expected/file3.json");
      test.equal(actual, expected, "should describe what the custom option(s) behavior is.");
      return test.done();
    }
  };

}).call(this);
