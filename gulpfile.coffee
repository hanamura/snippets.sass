fs   = require 'fs'
glob = require 'glob'
gulp = require 'gulp'
path = require 'path'

gulp.task 'imports', (done) ->
  glob 'src/*.sass', null, (err, matches) ->
    return done err if err
    return done() unless matches.length

    imports = for match in matches
      "@import '#{match[0...-5]}'"
    imports = imports.join('\n') + '\n'

    fs.writeFile 'snippets.sass', imports, (err) ->
      return done err if err
      done()
