import 'package:gp_project/models/product.dart';
import 'package:flutter/cupertino.dart';

class CartItem extends ChangeNotifier{
  List< product> products =[];

  addProduct(product product){
    products.add(product);
    notifyListeners();
  }
  deleteProduct(product product){
    products.remove(product);
    notifyListeners();
  }
}