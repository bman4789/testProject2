###
Created by mart2967 on 1/30/14.
###

class AppRouter extends Backbone.Router
  routes:
    '': 'index'
    'gpa': 'gpa'

  gpa: ->
    console.log 'inside gpa'
    coll = new window.valueCollection()
    console.log 'line 13'
    coll.fetch
      success: ->
        console.log "in success"
        $('#GPAContent').append new window.valueCollectionView(collection: coll).$el
      error: ->
        console.log "error"
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
