const jwt = require('jsonwebtoken');
const User = require('../models/user');

const admin = async(req, res, next) => {
    try {
        // gettting token and check
        const token = req.header("x-auth-token");
        if (!token)
            return res.status(401).json({ msg: "Not Auth token, access denied" });

        const verified = jwt.verify(token, "passwordKey");
        if (!verified)
            return res
                .status(401)
                .json({ msg: "Token verification failed, authorization denied." });

        // checking user
        const user = await User.findById(verified.id);
        if (user.type == "user" || user.type == "seller") {
            return res.status(401).json({msg: "You are not an admin"});
        }

        // setting token and ids
        req.user = verified.id;
        req.token = token;
        next();
    } catch (e) {
        res.status(500).json({ error: error.message });
    }
}


module.exports = admin;