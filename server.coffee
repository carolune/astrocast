mongo = require 'mongodb'
express = require 'express'
monk = require 'monk'

db =  monk process.env.MONGOHQ_URL
app = new express()

app.use(express.static(__dirname + '/public'))

bites = db.get("bites")
bites.drop()

bites.insert({ name: "The earth is round, like a ball, and slightly flattened at the North and South poles", tags: ["earth", "solar system", "planet"] })
bites.insert({ name: "We remain on the earth because gravity pulls us towards the ground", tags: ["earth"] })
bites.insert({ name: "Black holes are very dense objects that have a huge gravitational pull", tags: ["black hole"] })
bites.insert({ name: "Planck is a space telescope that explores the cosmic microwave background", tags: ["telescope","universe"] })
bites.insert({ name: "Our galaxy, the Milky Way, is shaped like a disc with a bulge at the centre", tags: ["galaxy"] })
bites.insert({ name: "Earth spins around its axis. This is why we have day and night", tags: ["earth"] })
bites.insert({ name: "Stars move across the sky because the earth spins around its axis", tags: ["earth","star"] })
bites.insert({ name: "Earth has seasons because the axis is tilted", tags: ["earth"] })
bites.insert({ name: "We have a blue sky because of the earth's atmosphere", tags: ["earth"] })
bites.insert({ name: "If we stood on the moon we would see stars during the day", tags: ["moon","star"] })
bites.insert({ name: "Stars twinkle because we are looking at them through the earth's atmosphere", tags: ["star","earth"] })
bites.insert({ name: "The moon is round like a ball but always has the same side facing the earth", tags: ["moon","earth"] })
bites.insert({ name: "A solar eclipse is when the moon blocks some or all of the sun's light from us", tags: ["moon","sun","earth"] })
bites.insert({ name: "A lunar eclipse is when the earth casts a shadow on the moon", tags: ["earth","moon","sun"] })
bites.insert({ name: "The moon is about a quarter the size of the earth", tags: ["moon","earth"] })
bites.insert({ name: "Moon has no atmosphere so craters on the moon are not eroded as quickly as on earth", tags: ["moon","earth"] })
bites.insert({ name: "Moon phases are caused by its position relative to the earth and sun", tags: ["moon","earth","sun"] })
bites.insert({ name: "A light year is the distance that light travels in one year. Speed of light is 299,792km per second", tags: ["light", "physics"] })
bites.insert({ name: "Our Sun is a middle aged star. It's only about 4 billion years old", tags: ["sun"] })
bites.insert({ name: "The heat and light from the sun comes from nuclear reactions in the centre where Hydrogen fuses to form Helium", tags: ["sun"] })
bites.insert({ name: "The Sun is 149,600,000km away from the Earth", tags: ["sun","earth"] })
bites.insert({ name: "It takes 8.3 minutes for light to travel from the sun to the earth", tags: ["sun","earth"] })
bites.insert({ name: "Solar flares are when the sun throws out a a large amount of charged particles", tags: ["sun"] })


app.get '/', (req,res)->
  "hi"

app.get '/bites',(req,res) =>
  query = {}

  if req.query.tags
    tags = req.query.tags.split(",")
    query= {tags: {"$all":tags}}
  bites.find { query }, (e,docs)=>
    res.json(docs)


app.get '/bites/:id',(req,res) =>
  bites.find {"_id": req.params.id }, (e,docs)=>
    res.json(docs)

port = process.env.PORT || 7777
app.listen(port)
console.log "starting server"