const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const Product = require("../models/product");

// add product 
adminRouter.post('/admin/add-product', admin, async (req, res) => {
    try {
        const { name, description, price, quantity, category, images } = req.body;

        let product = new Product(
            {
                name,
                description,
                price,
                quantity,
                category,
                images,
            }
        );

        product = await product.save();
        res.json(product);

    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})

// get all your products
// /admin/get-products
adminRouter.get('/admin/get-products', admin, async(req, res) => {
    try {
        const product = await Product.find({});
        res.json(product);
    } catch (error) {
        res.status(500).json({ error: error.message})
    }
})


module.exports = adminRouter;