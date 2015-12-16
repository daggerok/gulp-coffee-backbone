{Backbone} = require '../util.coffee'

HelloWorld = Backbone.Model.extend
  # default model properties:
  defaults: ->
    title: 'HelloWorld'
    clicks: 0

module.exports = HelloWorld
