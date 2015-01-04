var gulp = require('gulp');
var gutil = require('gulp-util');
var bower = require('bower');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var minifyCss = require('gulp-minify-css');
var jshint = require('gulp-jshint');
var stylish = require('jshint-stylish');
var rename = require('gulp-rename');
var csscomb = require('gulp-csscomb');
var filesize = require('gulp-filesize');
var uglify = require('gulp-uglify');

var paths = {
    sass: ['./grails-app/assets/stylesheets/beerstrap/**/*.scss'],
    js: ['./grails-app/assets/javascripts/**/*.js']
};

var vendor = {
    css: [
        './grails-app/assets/vendor/fontawesome/css/font-awesome.min.css',
        './grails-app/assets/vendor/bootstrap-datepicker/css/datepicker3.css',
        './grails-app/assets/vendor/select2/select2.css',
        './grails-app/assets/vendor/select2/select2-bootstrap.css',
        './grails-app/assets/vendor/jquery-file-upload/css/jquery.fileupload-ui.css',
        './grails-app/assets/vendor/toastr/toastr.min.css',
        './grails-app/assets/vendor/c3/c3.css',
        './grails-app/assets/vendor/leaflet/dist/leaflet.css',
        './grails-app/assets/vendor/leaflet-fullscreen/dist/leaflet.fullscreen.css'
    ],
    js: [
        './grails-app/assets/vendor/jquery/dist/jquery.min.js',
        './grails-app/assets/vendor/jquery-cookie/jquery.cookie.js',
        './grails-app/assets/vendor/bootstrap/dist/js/bootstrap.min.js',
        './grails-app/assets/vendor/typeahead.js/dist/typeahead.bundle.min.js',
        './grails-app/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js',
        './grails-app/assets/vendor/select2/select2.min.js',
        './grails-app/assets/vendor/d3/d3.min.js',
        './grails-app/assets/vendor/c3/c3.min.js',
        './grails-app/assets/vendor/peity/jquery.peity.min.js',
        './grails-app/assets/vendor/jquery-knob/js/jquery.knob.js',
        './grails-app/assets/vendor/jquery-file-upload/js/vendor/jquery.ui.widget.js',
        './grails-app/assets/vendor/jquery-file-upload/js/jquery.iframe-transport.js',
        './grails-app/assets/vendor/jquery-file-upload/js/jquery.fileupload.js',
        './grails-app/assets/vendor/holderjs/holder.js',
        './grails-app/assets/vendor/toastr/toastr.min.js',
        './grails-app/assets/vendor/tinymce/tinymce.min.js',
        './grails-app/assets/vendor/leaflet/dist/leaflet.js',
        './grails-app/assets/vendor/leaflet-fullscreen/dist/Leaflet.fullscreen.js',
        './grails-app/assets/vendor/beerstrap/reports/c3-mock.js',
        './grails-app/assets/vendor/beerstrap/maps/leaflet-mock.js',
        './grails-app/assets/vendor/beerstrap/beerstrap-init.js',
        './grails-app/assets/vendor/beerstrap/beerstrap-utils.js',
        './grails-app/assets/vendor/beerstrap/beerstrap-ajax.js'
    ]
};

gulp.task('default', ['jshint']);

gulp.task('jshint', function () {
    return gulp.src(paths.js)
        .pipe(jshint())
        .pipe(jshint.reporter(stylish));
});

gulp.task('vendorcss', function() {
    return gulp.src(vendor.css)
        .pipe(concat('vendor.css'))
        .pipe(csscomb())
        .pipe(gulp.dest('./grails-app/assets/stylesheets/'))
        .pipe(filesize())
        .pipe(minifyCss({
            keepSpecialComments: 0
        }))
        .pipe(rename('vendor.min.css'))
        .pipe(gulp.dest('./grails-app/assets/stylesheets/'))
        .pipe(filesize())
        .on('error', gutil.log)
});

gulp.task('vendorjs', function() {
    return gulp.src(vendor.js)
        .pipe(concat('vendor.js'))
        .pipe(gulp.dest('./grails-app/assets/javascripts/'))
        .pipe(filesize())
        //.pipe(uglify())
        .pipe(rename('vendor.min.js'))
        .pipe(gulp.dest('./grails-app/assets/javascripts/'))
        .pipe(filesize())
        .on('error', gutil.log)
});


gulp.task('sass', function (done) {
    gulp.src(paths.sass)
        .pipe(sass().on('error', gutil.log))
        .pipe(csscomb())
        .pipe(gulp.dest('./grails-app/assets/stylesheets/'))
        .pipe(minifyCss({
            keepSpecialComments: 0
        }))
        .pipe(rename({extname: '.min.css'}))
        .pipe(gulp.dest('./grails-app/assets/stylesheets/'))
        .on('end', done);
});

gulp.task('watch', function () {
    gulp.watch(paths.sass, ['sass']);
    gulp.watch(paths.js, ['jshint']);
});