franc = require('franc')
module.exports = (robot) ->
  # Listen to everything that is said
  robot.hear /(.*)/i, (res) ->
    if res.match[1].length > 15
      # Language detecting
      language = franc(res.match[1], {whitelist: ['fra','eng', 'deu']})
    # Post gif if user does not speak english
    if language == "fra" || language == "deu"
      robot.http("http://api.giphy.com/v1/gifs/search?api_key=I_HAVE_REPLACE_MY_TOKEN&q=speak+english&limit=1")
      .get() (error, response, body) ->
        image = JSON.parse body
        # res.send sends a message to slack channel as a bot user
        # To be Fixed : infinite loop, hubbot keeps sending the same message over and over..
        res.send "#{image.data[0].embed_url}"

