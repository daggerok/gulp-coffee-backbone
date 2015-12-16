{Backbone, $, _} = require '../util.coffee'

HelloWorldView = Backbone.View.extend
  tagName: 'pre'
  className: 'HelloWorldView'

  initialize: ->
    @model.on 'change', @render, @
    @model.on 'destroy', @remove, @

  template: _.template '''
<h1><%= title %></h1><p><%= clicks %> clicks</p><div>click on me twice to remove</div>
'''
  
  render: ->
    @$el.html @template @model.toJSON()

  # events
  events:
    'click h1,p'    : (event) -> @model.increment()
    'dblclick div': (event) -> @model.destroy()

module.exports = HelloWorldView
