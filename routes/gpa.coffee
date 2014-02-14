
exports.gpa = (req, res) ->
  res.locals = {
    titleGPA: 'GPA Calculator',
    descriptionGPA: 'An fun way to make your GPA!'
  }
  res.render 'gpa'

