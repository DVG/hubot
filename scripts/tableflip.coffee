module.exports = (robot) ->

  robot.hear /^rage$| rage(?=\.|!|$)|rage(?=\s)|^mad$| mad(?=\.|!|$)|mad(?=\s)|^angry$| angry(?=\.|!|$)|angry(?=\s)|dumpster fire|table flip/i, (res) ->
      res.send "(╯°□°）╯︵ ┻━┻)" 
