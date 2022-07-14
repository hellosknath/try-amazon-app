import 'package:flutter/material.dart';
import 'package:try_amazon_app/common/widget/loader.dart';
import 'package:try_amazon_app/features/admin/screens/add_product_screen.dart';
import 'package:try_amazon_app/features/admin/services/admin_services.dart';
import 'package:try_amazon_app/model/product.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    fetchAllProducts();
    super.initState();
  }

  void fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: const Center(
              child: Text('Products'),
            ),
            // add floating action button
            floatingActionButton: FloatingActionButton(
              onPressed: navigateToAddProduct,
              tooltip: 'Add a products',
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
