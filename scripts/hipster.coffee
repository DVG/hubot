# uses the hipster jesus api at http://hipsterjesus.com/

module.exports = (robot) ->

  robot.hear /hipster/i, (res) ->
    robot.http("http://hipsterjesus.com/api/")
    .query
        html: "false"           # no html
        paras: 1                # only one paragraph
        type: "hipster-centric" # more readable than hipster-latin
    .get() (err, resp, body) ->
      if err
        res.send "I'm too tired to even rant about that hipster right now..."
        return
      json = JSON.parse(body)
      text = json["text"]
      hipsterRant = text.substring(0, text.length/2)
      res.send hipsterRant 
