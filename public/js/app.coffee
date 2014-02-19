###
Created by mart2967 on 1/30/14.
###

class AppRouter extends Backbone.Router
  routes:
    '': 'index'
    'gpa': 'gpa'

  gpa: ->
    console.log 'inside gpa'
    gpaVar1 = new value()
    gpaVar2 = new value()
    gpaVar3 = new value()
    gpaVar4 = new value()
    gpaArr = [gpaVar1, gpaVar2, gpaVar3, gpaVar4]
    coll = new window.valueCollection(gpaArr)
    $('#GPAContent').append new window.valueCollectionView(collection: coll).$el
    return

  index: ->
    console.log 'inside index'
    sectionList = new window.SectionCollection()
    sectionList.fetch success: ->
      $('#content').html new window.SectionCollectionView(collection: sectionList).$el
      $('#bs-example-navbar-collapse-1').html new window.NavbarView(collection: sectionList).$el
      return

    return

app = new AppRouter()
Backbone.history.start pushState: true
