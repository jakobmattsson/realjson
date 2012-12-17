should = require 'should'
bufferstream = require 'bufferstream'
realjson = require('../src/realjson')

describe 'convert', ->

  it 'should parse actual json', ->
    realjson.convert('{ "a": 1 }').should.eql '''{
      "a": 1
    }'''

  it 'should parse the empty object', ->
    realjson.convert('{ }').should.eql '''{}'''

  it 'should parse javascript objects', ->
    realjson.convert('{ a: 1 }').should.eql '''{
      "a": 1
    }'''

  it 'should not parse simple booleans', ->
    realjson.convert('true').should.eql ''

  it 'should not parse simple numbers', ->
    realjson.convert('1').should.eql ''

  it 'should not parse simple strings', ->
    realjson.convert('"foobar"').should.eql ''

  it 'should not parse undefined variables', ->
    realjson.convert('some_variable').should.eql ''

  it.skip 'should not parse locally defined variables', ->
    realjson.convert('exports').should.eql ''

  it.skip 'should not run functions', ->
    realjson.convert('((function() { return { a: 1 } })())').should.not.eql '''{
      "a": 1
    }'''

describe 'stream', ->

  it "should convert invalid json from the first stream, to valid json into the second stream", (done) ->

    output = new bufferstream()
    output.on 'data', (buffer) ->
      buffer.toString().should.eql '''{
        "b": 2
      }\n'''
      done()

    input = new bufferstream()
    realjson.stream(input, output)
    input.write("{ b")
    input.write(": 2 }")
    input.end()
