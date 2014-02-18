class window.valueCollectionView extends Backbone.View
  tagName: 'div'
  template: _.template $('#GPAHead').html()
  footTemplate: _.template $('#GPAFoot').html()


  initialize: ->
    @render()

  render: ->
    @$el.html @template()
    _.each @collection.models, ((item) ->
      console.log item
      view = new GPALineView(model: item)
      @$el.append view.el
      return
    ), this
    this
    @$el.append @footTemplate