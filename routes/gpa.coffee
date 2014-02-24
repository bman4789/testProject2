ClassGrade = require('../schemas/schemas').ClassGrade

ClassGrade.count({},(err, c) ->
  console.log err if err
  if c == 0
    console.log 'Populating database'
    populateGPA()
)

exports.findAllClasses = (req, res) ->
  ClassGrade.find (err, items) ->
    res.send items
    console.log items

populateGPA = ->
  newPage = [
    {
      grade: "0"
      credits: "0"
    },
    {
      grade: "0"
      credits: "0"
    },
    {
      grade: "0"
      credits: "0"
    },
    {
      grade: "0"
      credits: "0"
    }
  ]
  createAndAddGPA things for things in newPage

createAndAddGPA = (sec)->
  newClass = new ClassGrade(sec)
  newClass.save()

exports.createClass = (req, res) ->
  newClass = new ClassGrade req.body
  console.log 'created class with grade: ' + newClass.grade + ', credits of: ' + newClass.credits
  newClass.save()
  res.send(newClass)

exports.editGPA = (req, res) ->
  gpaVar = req.body
  console.log gpaVar
  delete gpaVar._id
  #console.log req
  id = req.params.id
  ClassGrade.update({ _id: id }, { $set: gpaVar }, (err, numAffected, raw) ->
    console.log err if err
    console.log 'The number of updated documents was %d', numAffected
    #console.log 'The raw response from Mongo was ', raw
    res.send(gpaVar)
  )

exports.getClassById = (req, res) ->
  console.log 'in get'
  id = req.route.params['id']
  ClassGrade.findById id, (err, result) ->
    res.send result