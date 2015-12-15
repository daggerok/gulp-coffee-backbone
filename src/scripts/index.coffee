Appointment = require './model/Appointment.coffee'

App =
  log: (app) ->
    console.log app

App.log new Appointment()

module.exports = App
