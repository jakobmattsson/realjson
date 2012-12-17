exports.convert = (data) ->
  try
    obj = eval('(' + data + ')')
    json = JSON.stringify(obj, null, '  ')
    if json[0] != '{' then '' else json
  catch ex
    ''

exports.stream = (instream, outstream) ->
  data = ''

  instream.setEncoding('utf-8')

  instream.on 'data', (chunk) ->
    data += chunk

  instream.on 'end', ->
    outstream.write(exports.convert(data) + '\n')

  instream.resume()
