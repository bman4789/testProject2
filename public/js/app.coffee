###
Created by mart2967 on 1/30/14.
###

class AppRouter extends Backbone.Router
  routes:
    '': 'index'
    'gpa': 'gpa'

  gpa: ->
    coll = new window.ValueCollection()
    console.log coll
    coll.fetch
      success: ->
        $('#GPAContent').append new window.valueCollectionView(collection: coll).$el
        return
    console.log coll
    return

  index: ->
    console.log 'inside index'
    sectionList = new window.SectionCollection()
    console.log sectionList
    sectionList.fetch success: ->
      $('#content').html new window.SectionCollectionView(collection: sectionList).$el
      $('#bs-example-navbar-collapse-1').html new window.NavbarView(collection: sectionList).$el
      return
    return

app = new AppRouter()
Backbone.history.start pushState: true
