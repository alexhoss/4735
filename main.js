const express = require('express')
const app = express()
const port = 8000

app.get('/', (req, res) => res.send('Hello Changeds world 2!'))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
