{Backbone, $, _} = require '../util.coffee'

Appointment = Backbone.View.extend
  increment: ->
    @model.set 'clicks', 1 + @model.get 'clicks'

  tagName: 'pre'
  className: 'Appointment'

  template: _.template '<h1><%= title %></h1><p><%= clicks %> clicks</p>'
  
  render: ->
    @$el.html @template @model.toJSON()

  events:
    'click h1': (event) ->
      @increment() && @render()

module.exports = Appointment
