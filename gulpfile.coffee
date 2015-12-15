project =
  srcDir:   './src/'
  buildDir: './dist/'
  modules:  './node_modules/'
  main:     './src/scripts/index.coffee'
  bundle:   'bundle.js'
  index:    './dist/index.html'
  imgs:     './src/img/**/*.*'
  coffee:   '**/*.coffee'
  html:     '**/*.html'
  json:     '**/*.json'

gulp       = require 'gulp'
remove     = require 'gulp-rimraf'
connect    = require 'gulp-connect'
open       = require 'gulp-open'
concat     = require 'gulp-concat'
browserify = require 'gulp-browserify'

log = (error) ->
  console.log [
    '\u0007' # beep
    error
  ].join '\n'
  this.end()

gulp.task 'clean', ->
  gulp.src(project.buildDir, read: false)
    .pipe(remove force: true)

gulp.task 'js', ->
  gulp.src(project.main, read: false)
    .pipe browserify
        transform: ['coffeeify']
        extensions: ['.coffee']
      .on('error', log)
    .pipe(concat(project.bundle))
      .on('error', log)
    .pipe(gulp.dest project.buildDir)
    .pipe(connect.reload())

gulp.task 'html', ->
  gulp.src(project.srcDir + project.html, base: project.srcDir)
    .pipe(gulp.dest project.buildDir)
    .pipe(connect.reload())

gulp.task 'img', ->
  gulp.src(project.imgs, base: project.srcDir)
    .pipe(gulp.dest project.buildDir)
    .pipe(connect.reload())

gulp.task 'json', ->
  gulp.src(project.srcDir + project.json, base: project.srcDir)
    .pipe(gulp.dest project.buildDir)
    .pipe(connect.reload())

gulp.task 'default', ['js', 'html', 'img', 'json']

gulp.task 'connect', ->
  connect.server
    root: project.buildDir
    livereload: true

gulp.task 'watch', ['default', 'connect'], ->
  gulp.watch project.srcDir + project.coffee, ['js']
  gulp.watch project.srcDir + project.html, ['html']
  gulp.watch project.srcDir + project.json, ['json']
  gulp.watch project.imgs, ['img']
  gulp.src(project.index).pipe(open())
