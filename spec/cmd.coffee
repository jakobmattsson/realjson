should = require 'should'
exec = require('child_process').exec

it "should parse json", (done) ->
  exec "echo '{ \"a\": 1 }' | node bin/realjson.js", (err, stdout, stderr) ->
    should.not.exist err
    stderr.should.eql ''
    stdout.should.eql '''{
      "a": 1
    }\n
    '''
    done()

it "should return an empty line on error", (done) ->
  exec "echo not-real | node bin/realjson.js", (err, stdout, stderr) ->
    should.not.exist err
    stderr.should.eql ''
    stdout.should.eql '\n'
    done()
