# Says Hello
module.exports = (robot) ->
  
  robot.respond /hi|hello|good morning|good afternoon|good evening/i, (res) ->
    res.reply "Hi there!"