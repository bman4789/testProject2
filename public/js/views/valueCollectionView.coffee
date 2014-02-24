class window.valueCollectionView extends Backbone.View
  template: _.template $('#GPAbuttons').html()
  events:
    'click button.addRow': 'addRow'
    'click button.calcgpa': 'calculateGPA'

  initialize: ->
    @render()

  render: ->
    console.log 'in render'
    _.each @collection.models, ((item) ->
      view = new GPALineView(model: item)
#      @listenTo item, 'click button.save', @calculateGPA
      $('#GPADropDowns').append view.el
      return
    ), this
    @$el.append @template()
    this

  addRow: ->
    console.log 'addRow method'
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

  calculateGPA: ->
    console.log 'calculating GPA'
    grades = []
    credits = []
    _.each @collection.models, ((item) ->
      grades.push item.get "grade"
      credits.push item.get "credits"
    )
    document.getElementById('GPAResult').innerHTML="The GPA is: " + makeGPA(grades, credits)

  makeGPA = (grades, credits) ->
    gradePoint = 0
    for i in [0..grades.length - 1]
      gradePoint += (gradeToFloat(grades[i]) * parseInt(credits[i]))
    #reduce is for summing an array
    #multiplied by 1000 and math.round in order to get 3 decimal places
    return Math.round((gradePoint / (credits.reduce (t, s) -> parseInt(t) + parseInt(s)))*1000)/1000

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