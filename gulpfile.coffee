project =
  srcDir:   './src/'
  buildDir: './dist/'
  apiDir:   './src/api/'
  modules:  './node_modules/'
  mainJs:   'bundle.js'
  coffee:   '**/*.coffee'
  html:     '**/*.html'
  json:     '**/*.json'

gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
remove  = require 'gulp-rimraf'
connect = require 'gulp-connect'
concat  = require 'gulp-concat'
require 'colors'

log = (error) ->
  console.log [
    "BUILD FAILED: #{error.name ? ''}".red.underline
    '\u0007' # beep
    "#{error.code ? ''}"
    "#{error.message ? error}"
    "in #{error.filename ? ''}"
    "gulp plugin: #{error.plugin ? ''}"
  ].join '\n'
  this.end()

gulp.task 'clean', ->
  gulp.src(project.buildDir, read: false)
    .pipe(remove force: true)

gulp.task 'coffee', ->
  gulp.src(project.srcDir + project.coffee)
    .pipe(coffee {bare: true})
      .on('error', log)
    .pipe(concat(project.mainJs))
      .on('error', log)
    .pipe(gulp.dest project.buildDir)
    .pipe(connect.reload())

gulp.task 'vendors', ->
  gulp.src("#{project.modules}backbone/backbone.js", base: "#{project.modules}backbone/")
    .pipe(gulp.dest project.buildDir)

gulp.task 'html', ->
  gulp.src(project.srcDir + project.html, base: project.srcDir)
    .pipe(gulp.dest project.buildDir)
    .pipe(connect.reload())

gulp.task 'api', ->
  gulp.src(project.apiDir + project.json, base: project.srcDir)
    .pipe(gulp.dest project.buildDir)
    .pipe(connect.reload())

gulp.task 'default', ['coffee', 'vendors', 'html', 'api']

gulp.task 'connect', ->
  connect.server
    root: project.buildDir
    livereload: true

gulp.task 'watch', ['default', 'connect'], ->
  gulp.watch project.srcDir + project.coffee, ['coffee']
  gulp.watch project.srcDir + project.html, ['html']
  gulp.watch project.apiDir + project.json, ['api']
