should = require 'should'
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
