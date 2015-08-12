module.exports = (robot) ->
  robot.respond /^mustachify (https?:\/\/[^ #]+\.(?:png|jpg|jpeg))(?:[#]\.png)?$/i, (msg) ->
    src = msg.match[1]
    msg.http("http://stacheable.herokuapp.com")
      .query(src: src)
      .get() (err, res, body) ->
        img = JSON.parse body

        if img.count > 0
          msg.send "http://mustachify.me/?src=#{escape img.src}"