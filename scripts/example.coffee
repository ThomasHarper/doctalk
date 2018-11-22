franc = require('franc')
module.exports = (robot) ->
  # Listen to everything that is said
  robot.hear /(.*)/i, (res) ->
    # everything except bot messages
    return if (res.envelope.user.id == 'USLACKBOT' || res.envelope.user.is_bot)
    if res.match[1].length > 10
      # Language detecting
      language = franc(res.match[1], {whitelist: ['fra','eng', 'deu']})
    # Post img if user does not speak english
    if language == "fra" || language == "deu"
      # robot.http("http://api.giphy.com/v1/gifs/search?api_key=GIPHY_TOKEN=facepalm&limit=10")
      # .get() (error, response, body) ->
        # image = JSON.parse body
        # res.send "Speak english please #{image.data[index].embed_url}"
      images_list = [
        'https://imgflip.com/i/2n8515',
        'https://imgflip.com/i/2n858d',
        'https://imgflip.com/i/2n85bh',
        'https://imgflip.com/i/2n85hz',
        'https://imgflip.com/i/2n85lm',
        'https://imgflip.com/i/2n85ob',
        'https://imgflip.com/i/2n85sg',
        'https://imgur.com/YtqecMq',
        'https://imgur.com/9skKuka',
        'https://imgur.com/tEJLWPo',
        'https://imgur.com/B3vzUHZ'
      ]
      index = Math.floor(Math.random() * images_list.length)
      res.reply  "Speak English please #{images_list[index]}"

