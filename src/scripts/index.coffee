Model = require './model/HelloWorld.coffee'
View = require './view/HelloWorld.coffee'
Collection = require './model/HelloWorldCollection.coffee'
CollectionView = require './view/HelloWolrdCollection.coffee'
{$} = require './util.coffee'

(->
  ## use debugger to verify...
  #debugger;

  ### view ###
  model = new Model title: 'hello...'

  # # register event listener
  # model.on 'all', (event) ->
  #   console.log event

  # fire event: change:name
  model.set name: 'hello'

  view = new View model: model

  # render hello..
  $('#view').html view.render()

  # fire event: change:title
  model.set title: 'Hello, World!'

  # rerender: Hello, World!
  view.render()
  # console.log view.$el.html()

  ### view-fetch ###
  fetched = new Model
  fetched.fetch url: '/api/helloworld/2.json'
  fetchedView = new View model: fetched
  $('#view-fetch').html fetchedView.render()

  ### collection ###
  collection = new Collection
  collectionView = new CollectionView collection: collection
  $('#collection').html collectionView.render()
)()
