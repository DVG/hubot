# Repsonds politely when hubot is thanked

module.exports = (robot) ->
  robot.respond /thanks|thank you/i, (res) ->
    res.reply "It was my pleasure"