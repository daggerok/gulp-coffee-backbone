AppointmentModel = require './model/Appointment.coffee'
AppointmentView = require './view/Appointment.coffee'

App =
  log: (app) ->
    console.log app

App.log new AppointmentModel()
App.log new AppointmentView()

module.exports = App
