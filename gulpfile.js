var gulp = require('gulp');
var gutil = require('gulp-util');
var bower = require('bower');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var minifyCss = require('gulp-minify-css');
var jshint = require('gulp-jshint');
var stylish = require('jshint-stylish');
var rename = require('gulp-rename');

var paths = {
    scss: ['./grails-app/assets/stylesheets/beerstrap/**/*.scss'],
    js: ['./grails-app/assets/javascripts/**/*.js']
};

gulp.task('default', ['jshint']);

gulp.task('jshint', function () {
    return gulp.src(paths.js)
        .pipe(jshint())
        .pipe(jshint.reporter(stylish));
});

//gulp.task('scss', function (done) {
//    gulp.src(paths.scss)
//        .pipe(sass().on('error', gutil.log))
//        .pipe(gulp.dest('./grails-app/assets/stylesheets/'))
//        .pipe(minifyCss({
//            keepSpecialComments: 0
//        }))
//        .pipe(rename({extname: '.min.css'}))
//        .pipe(gulp.dest('./grails-app/assets/stylesheets/'))
//        .on('end', done);
//});

gulp.task('watch', function () {
    //gulp.watch(paths.scss, ['scss']);
    gulp.watch(paths.js, ['jshint']);
});