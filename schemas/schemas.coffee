mongoose = require 'mongoose'
Schema = mongoose.Schema


Section = new Schema(
  title: String
  link: String
  body: String
  category: String
  htmlId: String
)

ClassGrade = new Schema(
  grade: String
  credits: String
)

Section = mongoose.model 'Section', Section

module.exports =
  Section : Section

