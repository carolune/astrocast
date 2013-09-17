mongo = require 'mongodb'
express = require 'express'
monk = require 'monk'
db =  monk 'localhost:27017/astrocasts'
app = new express()

app.use(express.static(__dirname + '/public'))

bites = db.get("bites")

bites.drop()

bites.insert({ name: 'assadasd', tags: ["one", "two", "three","four"] })
bites.insert({ name: 'dsdfsfs', tags: ["five", "six", "seven"] })

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

app.listen(3003)