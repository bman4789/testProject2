class window.GPALineView extends Backbone.View
  tagName: 'div'
  events:
    'change': 'change'
    'click button.edit': 'editSection'
    'click button.save': 'saveSection'

  template: _.template $('#OneClass').html()

  initialize: ->
    @render()

  render: ->
    @$el.html @template(@model.toJSON())
    this

  change: (event) ->
    console.log 'changed'
    change = {}
    change[event.target.name] = event.target.value #uses name attribute from html
    @model.set(change)

  editSection: ->
    @$el.html @editGPATemplate(@model.toJSON())
    this

  saveSection: ->
    @$el.html @saveGPATemplate(@model.toJSON())
    this