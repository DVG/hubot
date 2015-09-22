module.exports = (robot) ->
  robot.respond /blow up (.+)'s phone$/i, (msg) ->
    robot.send "@#{msg.match[1]} hi" for [1..10]
