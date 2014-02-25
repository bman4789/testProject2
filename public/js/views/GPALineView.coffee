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
        console.log 'calculating GPA'
        valueList = new window.ValueCollection()
        grades = []
        credits = []
        i = 0
        valueList.fetch success: ->
          console.log "in success"
          _.each valueList.models, ((item) ->
            grades[i] = item.get "grade"
            credits[i] = item.get "credits"
            i++
          )
          document.getElementById('GPAResult').innerHTML="The GPA is: " + makeGPA(grades, credits)
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

  makeGPA = (grades, credits) ->
    console.log grades
    console.log credits
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