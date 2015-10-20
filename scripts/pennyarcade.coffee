# Commands:
#   hubot pa - The latest Penny Arcade comic

htmlparser = require "htmlparser2"
select = require("soupselect").select

module.exports = (robot) ->
  robot.respond /pa(\s(0?[1-9]|1[0-2]).(0?[1-9]|[1-2][0-9]|3[0-1]).(19\d{2}|20\d{2}))?$/i, (msg) ->
    if msg.match[1] == undefined
      date = ''
    else
      date = "/#{msg.match[4]}/#{msg.match[2]}/#{msg.match[3]}/"

    console.log(date)

    msg.http("http://penny-arcade.com/comic")
        .get() (err, res, body) ->
          handler = new htmlparser.DomHandler( (err, dom) ->
            if err
              console.log("WTF just happened")
            else
              img = select(dom, '#comicFrame img')
              console.log(img)
          )
          parser = new htmlparser.Parser(handler)
          parser.parseComplete(body)
          img = select(handler.dom, "#comicFrame img")
          comic = img[0].attribs

          msg.send comic.src
          msg.send comic.alt
