class window.valueCollectionView extends Backbone.View
  template: _.template $('#GPAbuttons').html()
  events:
    'click button.addClass': 'addClass'

  initialize: ->
    @render()

  render: ->
    console.log 'in render'
    _.each @collection.models, ((item) ->
      view = new GPALineView(model: item)
      $('#GPADropDowns').append view.el
      return
    ), this
    @$el.append @template()
    this

  addClass: ->
    console.log 'addClass method'
    newClass = new value({grade: '0', credits: '0'})
    newClass.save {},
      success: ->
        console.log 'created'
      error: ->
        console.log 'in error'
      @collection.add newClass
      newView = new GPALineView(model: newClass)
      $('#GPADropDowns').append newView.el
    this