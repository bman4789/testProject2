class window.valueCollectionView extends Backbone.View
  template: _.template $('#GPAbuttons').html()
  events:
    'click button.AddRow': 'AddRow'

  initialize: ->
    @render()

  render: ->
    @$el.html ''
    $('#GPADropDowns').html ''
    _.each @collection.models, ((item) ->
      console.log item
      view = new GPALineView(model: item)
      $('#GPADropDowns').append view.el
      return
    ), this
    @$el.append @template()
    this


  AddRow: ->
    console.log 'some text'
    @collection.add new value()
    @render()
    this
