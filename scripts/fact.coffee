# Returns a random fact from Numbers API

module.exports = (robot) ->

  robot.hear /fact/i, (res) ->
    robot.http("http://numbersapi.com/random").get() (err, resp, body) ->
      if err
        res.send "I couldn't get a fact, sorry"
        return
      res.send body