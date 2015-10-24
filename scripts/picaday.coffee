# Commands:
#   hubot picaday - The latest National Geographic photo

htmlparser = require "htmlparser2"
select = require("soupselect").select

module.exports = (robot) ->
  robot.respond /picaday/i, (msg) ->
    msg.http("http://photography.nationalgeographic.com/photography/photo-of-the-day/")
        .get() (err, res, body) ->
          handler = new htmlparser.DomHandler( (err, dom) ->
            if err
              console.log("WTF just happened")
            else
              img = select(dom, '.primary_photo img')
          )
          parser = new htmlparser.Parser(handler)
          parser.parseComplete(body)
          img = select(handler.dom, ".primary_photo img")
          comic = img[0].attribs

          msg.send comic.src.substring(2)
          msg.send comic.alt
