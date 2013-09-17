fortune = require('fortune')

app = fortune
  db: 'astrocast'


app.resource "galaxy",
  name: String 
  redshift : Number 
  ra : Number 
  dec: Number 

app.listen(1337)