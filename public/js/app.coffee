###
Created by mart2967 on 1/30/14.
###

class AppRouter extends Backbone.Router
  routes:
    '': 'index'
    '/gpa': 'gpa'

  gpa: ->
    gpaVar1 = new value({grade: '3', credits: '1'})
    gpaVar2 = new value({grade: '2', credits: '3'})
    gpaVar3 = new value({grade: '1', credits: '2'})
    gpaVar4 = new value({grade: '4', credits: '4'})
    gpaArr = [gpaVar1, gpaVar2, gpaVar3, gpaVar4]
    $('#
        return

  index: ->
    sectionList = new window.SectionCollection()
    sectionList.fetch success: ->
      $('#content').html new window.SectionCollectionView(collection: sectionList).$el
      $('#bs-example-navbar-collapse-1').html new window.NavbarView(collection: sectionList).$el
      return

    return

app = new AppRouter()
Backbone.history.start pushState: true
