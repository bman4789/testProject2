class window.GPALineView extends Backbone.View
  tagName: 'div'
  editGPATemplate : _.template $('#GPAEdit').html()
  saveGPATemplate : _.template $('#GPASave').html()
  events:
    'change': 'change'
    'click button.edit': 'editSection'
    'click button.save': 'saveSection'


  initialize: ->
    @render()

  render: ->
    @$el.html @editGPATemplate(@model.toJSON())
    this

  change: (event) ->
    console.log 'changed'
    change = {}
    change[event.target.name] = event.target.value #uses name attribute from html
    @model.set(change)

  editSection: ->
    @$el.html @saveGPATemplate(@model.toJSON())
    this

  saveSection: ->
    console.log 'saving...'
    @model.save {},
      success: ->
        console.log 'saved'
      error: ->
        console.log 'error'
    @render()
    this