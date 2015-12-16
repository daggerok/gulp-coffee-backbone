{Backbone, $, _} = require '../util.coffee'

HelloWorld = Backbone.View.extend
  tagName: 'pre'
  className: 'HelloWorld'

  template: _.template '<h1><%= title %></h1><p><%= clicks %> clicks</p>'
  
  render: ->
    @$el.html @template @model.toJSON()

  onClick: ->
    @model.set 'clicks', 1 + @model.get 'clicks'

  events:
    'click h1': (event) ->
      @onClick() && @render()

module.exports = HelloWorld
