Model = require './model/Appointment.coffee'
View = require './view/Appointment.coffee'
{$} = require './util.coffee'

(->
  ## use debugger to verify...
  #debugger;
  model = new Model
    title: 'hello...'

  # register event listener
  model.on 'all', (event) ->
    console.log event
  
  # fire event: change:name
  model.set
    name: 'hello'

  view = new View
    model: model

  view.render() # render hello..
  $ 'div#app'
    .html view.el

  # fire event: change:title
  model.set
    title: 'Hello, World!'
  view.render() # rerender: Hello, World!
)()
