{Backbone, $} = require '../util.coffee'

Appointment = Backbone.View.extend
  tagName: 'pre'
  className: 'Appointment'
  render: ->
    @$el.html "<h1>#{@model.get('title')}</h1>"

module.exports = Appointment
