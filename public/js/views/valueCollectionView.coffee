class window.valueCollectionView extends Backbone.View
  initialize: ->
    @render()

  render: ->
    _.each @collection.models, ((item) ->
      view = new GPALineView(model: item)
      @$el.append view.el
      return
    ), this
    this