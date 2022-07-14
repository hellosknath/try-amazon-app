const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./route/admin");
// import from others file
const authRouter = require("./route/auth");
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://srinath:cox.srinath@cluster0.bmuct.mongodb.net/?retryWrites=true&w=majority";

// destructure property solve
app.use(express.json());
// middleware
app.use(authRouter);
app.use(adminRouter);


// connection database
mongoose.connect(DB).then(() => {
    console.log("Database connected successfully");
}).catch((e) => {
    console.log(e);
});


app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected at port t ${PORT}`);
});