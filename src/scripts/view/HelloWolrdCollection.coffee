{Backbone, $, _} = require '../util.coffee'
HelloWorldView = require './HelloWorld.coffee'

HelloWorldCollectionView = Backbone.View.extend
  el: $ '#collection'

  initialize: ->
    @collection.bind 'reset', @render, @
    # @collection.fetch reset: true

  render: ->
    @collection.forEach (model) ->
      @addOne model

  addOne: (model) ->
    view = new HelloWorldView model: model
    @$el.html view.render()

module.exports = HelloWorldCollectionView
