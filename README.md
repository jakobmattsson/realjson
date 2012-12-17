RealJSON
========

Command-line tool for turning poor man's JSON into actual (well-formatted) JSON.

Installation
------------

`npm install -g realjson`

Usage
-----

    $ echo "{ propertyWithoutQuotes: 'string in single quotes', array: [{ foo: 'bar' }] }" | realjson
    {
      "propertyWithoutQuotes": "string in single quotes",
      "array": [
        {
          "foo": "bar"
        }
      ]
    }

Why?
----
I got tired of dumb services returning "almost JSON" so I wrote this up once and for all.

I should warn the faint of heart that it uses `eval` at the moment (couldn't find a quick solution and didn't have time to investigate), so only use it for parsing data sources that you trust. Of course I'd be happy to replace eval if it actually matters to anyone.
