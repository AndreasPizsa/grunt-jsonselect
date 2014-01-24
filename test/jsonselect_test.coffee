"use strict"
grunt = require("grunt")

#
#  ======== A Handy Little Nodeunit Reference ========
#  https://github.com/caolan/nodeunit
#
#  Test methods:
#    test.expect(numAssertions)
#    test.done()
#  Test assertions:
#    test.ok(value, [message])
#    test.equal(actual, expected, [message])
#    test.notEqual(actual, expected, [message])
#    test.deepEqual(actual, expected, [message])
#    test.notDeepEqual(actual, expected, [message])
#    test.strictEqual(actual, expected, [message])
#    test.notStrictEqual(actual, expected, [message])
#    test.throws(block, [error], [message])
#    test.doesNotThrow(block, [error], [message])
#    test.ifError(value)
#
exports.jsonselect =
  setUp: (done) ->
    
    # setup here if necessary
    done()

  fileone: (test) ->
    test.expect 1
    actual = grunt.file.read("tmp/file1.json")
    expected = grunt.file.read("test/expected/file1.json")
    test.equal actual, expected, "should describe what the default behavior is."
    test.done()

  filetwo: (test) ->
    test.expect 1
    actual = grunt.file.read("tmp/file2.json")
    expected = grunt.file.read("test/expected/file2.json")
    test.equal actual, expected, "should describe what the custom option(s) behavior is."
    test.done()