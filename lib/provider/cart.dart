import 'package:flutter/material.dart';
import 'package:greenify/models/item.dart';

class Cart with ChangeNotifier{
  List selectedProducts=[];
  int price=0;
  add(Item product){
    selectedProducts.add(product);
    //هنا راح يزود
    price+=product.price.round();
    notifyListeners();
  }
  delete(Item product){
    selectedProducts.remove(product);
    // هنا راح ينقص السعر لمن احذفه
      price-=product.price.round();
      notifyListeners();
  }
}