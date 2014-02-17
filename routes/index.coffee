exports.index = (req, res) ->
  res.locals = {
    title: 'NodeLab lol h4x0rs',
    description: 'An example of one way to build a powerful web app based on Node.js'
  }
  res.render 'index'

exports.gpa = (req, res) ->
  res.locals = {
    title: 'GPA Calculator',
    description: 'Calculate your GPA',
  }
  res.render 'gpa'

