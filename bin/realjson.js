#!/usr/bin/env node

var optimist = require('optimist');
var realjson = require('../src/realjson');

var argv = optimist
  .usage("Turns poor man's \"almost JSON\" into actual well-formatted JSON")
  .describe('version', 'Print the current version number')
  .describe('help', 'Show this help message')
  .alias('version', 'v')
  .alias('help', 'h')
  .argv;

if (argv.help) {
  console.log(optimist.help());
  return;
}

if (argv.version) {
  console.log(require('../package.json').version);
  return;
}

realjson.stream(process.stdin, process.stdout);
