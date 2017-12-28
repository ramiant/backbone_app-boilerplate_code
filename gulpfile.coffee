gulp = require('gulp')
concat = require('gulp-concat')
rename = require('gulp-rename')
coffee = require('gulp-coffee')
_ = require('lodash')

LOG_ERROR = console.log

vendorMap = {
    'node_modules/lodash/lodash.min.js': 'underscore.js'
    'node_modules/jquery/dist/jquery.min.js': 'jquery.js'
    'node_modules/requirejs/require.js': 'require.js'
    'node_modules/backbone/backbone-min.js': 'backbone.js'
    'node_modules/backbone.marionette/lib/backbone.marionette.min.js': 'marionette.js'
    'node_modules/backbone.radio/build/backbone.radio.min.js': 'backbone-radio.js'
}

gulp.task 'vendor', ->
    _.forEach vendorMap, (value, key) ->
        gulp.src(key)
            .pipe(rename(value))
            .pipe(gulp.dest('public/js/vendor'))

gulp.task 'build-scripts', ->
    gulp.src('src/**/*.coffee')
        .pipe(coffee({ bare: true })).on('error', LOG_ERROR)
        .pipe(gulp.dest('public/js'))

gulp.task 'build', ['vendor', 'build-scripts'], ->

gulp.task 'watch', ['build'] , ->
    return gulp.watch 'src/**/*.coffee', ['build-scripts']

gulp.task 'default', ['watch'], ->
