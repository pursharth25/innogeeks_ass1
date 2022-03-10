import express from "express";
const app = express()
app.get("/" , (req,res)=>{
    res.send("<h1>Weldome To the Node App </h1>")
})

app.get("/about" , (req,res)=>{
    console.log("I am in the about path") 

    res.send("<h1>About the Node App </h1>")
})

app.listen(3000);