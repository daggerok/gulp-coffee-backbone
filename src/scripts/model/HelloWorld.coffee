{Backbone} = require '../util.coffee'

HelloWorldModel = Backbone.Model.extend
  # default model properties:
  defaults: ->
    title: 'HelloWorld'
    clicks: 0
  # model specific methods
  increment: (value = 1) ->
    @.set 'clicks', value + @.get 'clicks'

module.exports = HelloWorldModel
