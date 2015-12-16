{Backbone} = require '../util.coffee'

Appointment = Backbone.Model.extend
  defaults: ->
    title: 'Appointment'
    clicks: 0

module.exports = Appointment
