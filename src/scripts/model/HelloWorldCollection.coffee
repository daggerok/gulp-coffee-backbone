{Backbone, $, _} = require '../util.coffee'
Model = require './HelloWorld.coffee'
# View = require '../view/HelloWolrdCollection.coffee'

HelloWorldCollection = Backbone.Collection.extend
  model: Model
  url: '/api/helloworld.json'
  className: 'HelloWorldCollection'

  # initialize: ->
  #   @view = new View
  #   @bind 'reset', @view.render
  #   @fetch
  #     success: @fetchSuccess
  #     error: @fetchError

  # fetchSuccess: (collection, response) ->
  #   console.log 'collection', JSON.stringify(collection)
  #   console.log 'response', JSON.stringify(response)

  # fetchError: (collection, response) ->  
  #   console.log 'collection', JSON.stringify(collection)
  #   console.log 'response', JSON.stringify(response)

module.exports = HelloWorldCollection
