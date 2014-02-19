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
  credits: Number
)

Section = mongoose.model 'Section', Section
ClassGrade = mongoose.model 'ClassGrade', ClassGrade

module.exports =
  Section : Section
  ClassGrade : ClassGrade

