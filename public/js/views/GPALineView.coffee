class window.GPALineView extends Backbone.View
  tagName: 'div'
  editGPATemplate : _.template $('#GPAEdit').html()
  saveGPATemplate : _.template $('#GPASave').html()
  events:
    'change': 'change'
    'click button.edit': 'editClass'
    'click button.save': 'saveClass'
    'click button.deleteClass': 'deleteClass'


  initialize: ->
    @render()

  render: ->
    @$el.html @editGPATemplate(@model.toJSON())
    this

  editClass: ->
    @$el.html @saveGPATemplate(@model.toJSON())
    this

  change: (event) ->
    console.log 'changed'
    change = {}
    change[event.target.name] = event.target.value #uses name attribute from html
    @model.set(change)

  saveClass: ->
    console.log 'saving...'
    @model.save {},
      success: ->
        console.log 'saved'
      error: ->
        console.log 'error'
    @render()

  deleteClass: ->
    console.log 'deleting...'
    @$el.fadeOut()
    @model.destroy
      success: ->
        console.log 'Section deleted'
      error: ->
        console.log 'error deleting section'
        @$el.show()