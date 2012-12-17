exports.convert = function(data) {
  try {
    var obj = eval('(' + data + ')');
    var json = JSON.stringify(obj, null, '  ');

    if (json[0] != '{')
      return '';

    return json;
  } catch (ex) {
    return '';
  }
};

exports.stream = function(instream, outstream) {
  var data = '';

  instream.setEncoding('utf-8');

  instream.on('data', function(chunk) {
    data += chunk;
  });

  instream.on('end', function() {
    outstream.write(exports.convert(data) + '\n');
  });

  instream.resume();
};
