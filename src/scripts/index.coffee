Model = require './model/Appointment.coffee'
View = require './view/Appointment.coffee'
{$} = require './util.coffee'

(->
  view = new View
    model: new Model
      title: 'Hello, World!'
  view.render()
  $ 'div#app'
    .html view.el
)()
