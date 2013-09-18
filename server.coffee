mongo = require 'mongodb'
express = require 'express'
monk = require 'monk'

console.log "here"

db =  monk process.env.MONGOHQ_URL
app = new express()
console.log "here"
app.use(express.static(__dirname + '/public'))

bites = db.get("bites")

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

console.log "here"

port = process.env.PORT || 7777
app.listen(port)
console.log "starting server"