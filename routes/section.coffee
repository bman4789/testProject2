Section = require('../schemas/schemas').Section

# Populate the database if there are no records
Section.count({},(err, c) ->
  console.log err if err
  if c == 0
    console.log 'Populating database'
    populateDB()
)

exports.findAll = (req, res) ->
  Section.find (err, items) ->
    res.send items


exports.create = (req, res) ->
  newSection = new Section req.body
  console.log 'created section ' + newSection.title
  newSection.save()
  res.send()

exports.getById = (req, res) ->
  id = req.route.params['id']
  Section.findById id, (err, result) ->
    res.send result

exports.edit = (req, res) ->
  section = req.body
  delete section._id
  #console.log req
  id = req.params.id
  Section.update({ _id: id }, { $set: section }, (err, numAffected, raw) ->
    console.log err if err
    console.log 'The number of updated documents was %d', numAffected
    #console.log 'The raw response from Mongo was ', raw
    res.send(section)
  )



populateDB = ->
  sections = [
    {
      title: 'Node.js'
      link: 'http://www.nodejs.org'
      category: 'default'
      htmlId: 'node'
      body: 'Node.js is a software platform that is used to build scalable network (especially server-side) applications. Node.js utilizes JavaScript as its scripting language, and achieves high throughput via non-blocking I/O and a single-threaded event loop.
      Node.js contains a built-in HTTP server library, making it possible to run a web server without the use of external software, such as Apache or Lighttpd, and allowing more control of how the web server works.'
    },
    {
      title: 'Coffeescript'
      link: 'http://www.coffeescript.org'
      htmlId: 'coffee'
      body: 'CoffeeScript is a programming language that transcompiles to JavaScript. The language adds syntactic sugar inspired by Ruby, Python and Haskell to enhance JavaScript\'s brevity and readability, adding additional features like list comprehension and pattern matching. CoffeeScript compiles predictably to JavaScript, and programs can be written with less code, typically 1/3 fewer lines, with no effect on runtime performance. Since March 16, 2011, CoffeeScript has been on GitHub\'s list of most-watched projects, and as of 2013 was the twelfth[5] most popular language on GitHub in terms of project-count (at one point it was tenth). However, also in 2013 it was ranked 29th among languages, based on number of questions tagged at Stack Overflow.'
    },
    {
      title: 'Mocha'
      link: 'http://visionmedia.github.io/mocha/'
      htmlId: 'mocha'
      body: 'Mocha is a feature-rich JavaScript test framework running on node.js and the browser, making asynchronous testing simple and fun. Mocha tests run serially, allowing for flexible and accurate reporting, while mapping uncaught exceptions to the correct test cases.'
    },
    {
      title: 'Backbone.js'
      link: 'http://www.backbonejs.org'
      htmlId: 'backbone'
      body: 'Backbone.js gives structure to web applications by providing models with key-value binding and custom events, collections with a rich API of enumerable functions, views with declarative event handling, and connects it all to your existing API over a RESTful JSON interface.'
    }

  ]
  createAndAdd section for section in sections

createAndAdd = (sec)->
  newSection = new Section(sec)
  newSection.save()





exports.postResponse = (req, res) ->
  grade1 = gradeToFloat(req.body.firstG) #parsing the data
  grade2 = gradeToFloat(req.body.secondG)
  grade3 = gradeToFloat(req.body.thirdG)
  grade4 = gradeToFloat(req.body.fourthG)
  credit1 = parseFloat(req.body.first)
  credit2 = parseFloat(req.body.second)
  credit3 = parseFloat(req.body.third)
  credit4 = parseFloat(req.body.fourth)
  #constructing the array
  GPArray = [grade1, credit1, grade2, credit2, grade3, credit3, grade4, credit4]

  #sending the updated page


calcGPA = (GPArray) -> #calculates GPA between four grades
  theGPA = (GPArray[0] * GPArray[1] + GPArray[2] * GPArray[3] + GPArray[4] * GPArray[5] + GPArray[6] * GPArray[7])/
  (GPArray[1] + GPArray[3] + GPArray[5] + GPArray[7])
  theGPA

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