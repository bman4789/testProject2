###
  NodeCoffeeScriptLab
  Programmers: David Pagels and Dillon Stenberg
###


headerString='<!DOCTYPE html>\n
<html>\n
<head>\n
    <title>GPA Calculator</title>\n
</head>\n
<body>\n
<h1>Enter your grades and number of credits</h1><br/>\n\n'

bodyString='<form method="post" action="/gpa">\n
    <label>Grade:\n
        <select name="firstG" id="firstG">\n
            <option value="0" selected="selected">none</option>\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="F">F</option>\n
        </select></label>\n
    <label>Credits:\n
        <select name="first" id="first">\n
            <option value="0" selected="selected">none</option>\n
            <option>1</option>\n
            <option>2</option>\n
            <option>3</option>\n
            <option>4</option>\n
            <option>5</option>\n
        </select>\n
    </label>\n
    <br/>\n\n

    <label>Grade:\n
        <select name="secondG" id="secondG">\n
            <option value="0" selected="selected">none</option>\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="F">F</option>\n
        </select></label>\n
    <label>Credits:\n
        <select name="second" id="second">\n
            <option value="0" selected="selected">none</option>\n
            <option>1</option>\n
            <option>2</option>\n
            <option>3</option>\n
            <option>4</option>\n
            <option>5</option>\n
        </select>\n
    </label>\n
    <br/>\n\n

    <label>Grade:\n
        <select name="thirdG" id="thirdG">\n
            <option value="0" selected="selected">none</option>\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="F">F</option>\n
        </select></label>\n
    <label>Credits:\n
        <select name="third" id="third">\n
            <option value="0" selected="selected">none</option>\n
            <option>1</option>\n
            <option>2</option>\n
            <option>3</option>\n
            <option>4</option>\n
            <option>5</option>\n
        </select>\n
    </label>\n
    <br/>\n\n

    <label>Grade:\n
        <select name="fourthG" id="fourthG">\n
            <option value="0" selected="selected">none</option>\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="F">F</option>\n
        </select></label>\n
    <label>Credits:\n
        <select name="fourth" id="fourth">\n
            <option value="0" selected="selected">none</option>\n
            <option>1</option>\n
            <option>2</option>\nexports.gpa = (req, res) ->
  res.locals = {
    title: 'GPA Calculator',
    description: 'Calculate your GPA',
    value: 0
  }
  res.render 'gpa'
            <option>3</option>\n
            <option>4</option>\n
            <option>5</option>\n
        </select>\n
    </label>\n
    <br/><br/>\n
    <input type="submit" id="gpaCalc" value="Calculate GPA"/>\n
    <br/><br/></form>\n\n'

footerString='
</body>\n
</html>\n'




###exports.formResponse = (req, res) ->
  res.render 'gpa'###





module.exports.calcGPA = calcGPA
module.exports.gradeToFloat = gradeToFloat
