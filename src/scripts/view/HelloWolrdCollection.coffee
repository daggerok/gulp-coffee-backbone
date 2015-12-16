{Backbone, $, _} = require '../util.coffee'
HelloWorldCollection = require '../model/HelloWorldCollection.coffee'
HelloWorld = require '../model/HelloWorld.coffee'
HelloWorldView = require './HelloWorld.coffee'

HelloWorldCollectionView = Backbone.View.extend
  el: $ '#collection'

  render: ->
    @collection.forEach (model) ->
      @addOne model, @

  addOne: (model) ->
    view = new HelloWorldView nodel: model
    @$el.append view.render()    

module.exports = HelloWorldCollectionView
