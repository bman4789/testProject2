class window.GPALineView extends Backbone.View
  tagName: ''

  #Defining the template html explicitly rather than selecting it from a hidden element
  #Convinient for small snippets like this, not for anything much bigger
  template: _.template $('#OneClass').html()

  initialize: ->
    @render()

  render: ->
    @$el.html @template(@model.toJSON())
    this
