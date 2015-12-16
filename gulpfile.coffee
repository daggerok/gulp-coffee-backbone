project =
  srcDir:   'src/'
  main:     'src/scripts/index.coffee'
  buildDir: 'dist/'
  bundle:   'bundle.js'
  coffee:   'src/**/*.coffee'
  html:     'src/**/*.html'
  imgs:     'src/img/**/*.*'
  json:     'src/api/**/*.json'
  uri:      'http://localhost:8080/'
  open:     false

gulp       = require 'gulp'
remove     = require 'gulp-rimraf'
browserify = require 'gulp-browserify'
concat     = require 'gulp-concat'
#sourcemaps = require 'gulp-sourcemaps'
#uglify     = require 'gulp-uglify'
imagemin   = require 'gulp-imagemin'
pngquant   = require 'imagemin-pngquant'
connect    = require 'gulp-connect'
open       = require 'gulp-open'

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
        debug: true
      .on('error', log)
    .pipe(concat(project.bundle))
      .on('error', log)
    #.pipe(sourcemaps.init())
    #.pipe(uglify())
    #  .on('error', log)
    #.pipe(sourcemaps.write('.'))
    .pipe(gulp.dest project.buildDir)
    .pipe(connect.reload())

gulp.task 'html', ->
  gulp.src(project.html, base: project.srcDir)
    .pipe(gulp.dest project.buildDir)
    .pipe(connect.reload())

gulp.task 'img', ->
  gulp.src(project.imgs, base: project.srcDir)
    .pipe imagemin
      progressive: true
      svgoPlugins: [ removeViewBox: false ]
      use: [ pngquant() ]
    .pipe(gulp.dest project.buildDir)
    .pipe(connect.reload())

gulp.task 'json', ->
  gulp.src(project.json, base: project.srcDir)
    .pipe(gulp.dest project.buildDir)
    .pipe(connect.reload())

gulp.task 'default', ['js', 'html', 'img', 'json']

gulp.task 'connect', ->
  connect.server
    root: project.buildDir
    livereload: true

gulp.task 'watch', ['default', 'connect'], ->
  gulp.watch project.imgs, ['img']
  gulp.watch project.coffee, ['js']
  gulp.watch project.html, ['html']
  gulp.watch project.json, ['json']
  gulp.src(__filename)
    .pipe open uri: project.uri if project.open
