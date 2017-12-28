require.config({
    paths: {
        'backbone': 'vendor/backbone'
        'marionette': 'vendor/marionette'
        'underscore': 'vendor/underscore'
        'backbone.radio': 'vendor/backbone-radio'
        'jquery': 'vendor/jquery'
    }

    shim: {
        'backbone': {
            deps: ['underscore', 'jquery']
        }
        'marionette': {
            deps: ['backbone', 'backbone.radio']
        }
    }
})

require [
    'backbone'
    'marionette'
    'underscore'
    'jquery'
], (Backbone, Marionette, _, $) ->
    self.Backbone = Backbone
    self.Marionette = Marionette
    self._ = _
    self.$