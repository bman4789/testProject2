  class window.value extends Backbone.Model
    urlRoot: '/aGPA'
    idAttribute: '_id' #conforming to mongodb id syntax
    initialize: ->
      console.log 'Initializing a Value'

    defaults:
      grade: "0"
      credits: "0"