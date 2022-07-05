const express = require('express');
// password to hash
const bcryptjs = require('bcryptjs');
// token
const jwt = require("jsonwebtoken");
// import user 
const User = require("../models/user");

const authRouter = express.Router();

// create sign up api
authRouter.post("/api/signup", async (req, res) => {
    try {
        // declare properties
        const { name, email, password } = req.body;

        // checking existing user in db
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res
                .status(400)
                .json({ msg: "User with same email already exists!" });
        }

        // create hashed password
        const hashedPassword = await bcryptjs.hash(password, 8);

        // creating new user objects
        let user = new User({
            name, email, password: hashedPassword
        });

        // save user to db
        user = await user.save();
        // return save data to user
        res.json(user);

    } catch (e) {
        res.status(500).json({ error: e.message });
    }

});


// Create sign in api
authRouter.post("/api/signin", async (req, res) => {
    try {
        // user parameter
        const { email, password } = req.body;

        // getting user info
        const user = await User.findOne({ email });
        // check this user is exists
        if (!user) {
            return res
                .status(400)
                .json({ msg: "User with this email does not exist!" });
        }
        // checking hash password matching
        const isMatchPass = await bcryptjs.compare(password, user.password);
        if (!isMatchPass) {
            return res
                .status(400)
                .json({ msg: "Incorrect Password. Please try again!" });
        }

        // settting token
        const token = jwt.sign({ id: user._id }, "passwordKey");
        // return user data. ...user._doc... it's return all user info
        res.json({ token, ...user._doc });

    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}); 

// export authRouter for access outside of the class
module.exports = authRouter;



