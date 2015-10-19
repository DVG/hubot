getAdvice = (msg) ->
  msg.http("http://api.adviceslip.com/advice")
    .get() (err, res, body) ->
      results = JSON.parse body
      advice = if err then "Sorry, AdviceBot is BROKEN" else results.slip.advice
      msg.send advice

module.exports = (robot) ->
  robot.respond /what (do you|should I) do (when|about|with) (.*)/i, (msg) ->
    getAdvice(msg)

  robot.respond /how do you handle (.*)/i, (msg) ->
    getAdvice(msg)

  robot.respond /(.*) advice$/i, (msg) ->
    getAdvice(msg)
