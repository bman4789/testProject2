class window.valueCollectionView extends Backbone.View
  template: _.template $('#GPAbuttons').html()
  events:
    'click button.addRow': 'addRow'

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


  addRow: ->
    console.log 'some text'
    @collection.add new value()
    @render()
    this

  sendToDB: ->


  makeGPA = (grades, credits) ->
    console.log 'calculating GPA'
    gradePoint = 0
    for i in [0..grades.length - 1]
      gradePoint += (grades[i] * credits[i])
    #reduce is for summing an array
    #multiplied by 1000 and math.round in order to get 3 decimal places
    return Math.round((gradePoint / (credits.reduce (t, s) -> t + s))*1000)/1000

  gradeToFloat = (grade) -> #returns the corresponding GPA
    retFlo = switch
      when grade is 'A' then 4.0
      when grade is 'A-' then 3.7
      when grade is 'B+' then 3.3
      when grade is 'B' then 3.0
      when grade is 'B-' then 2.7
      when grade is 'C+' then 2.3
      when grade is 'C' then 2.0
      when grade is 'C-' then 1.7
      when grade is 'D+' then 1.3
      when grade is 'D' then 1.0
      when grade is 'F' then 0.0
      else 0
