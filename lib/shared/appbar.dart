import 'package:flutter/material.dart';
import 'package:greenify/provider/cart.dart';
import 'package:greenify/screens/checkout.dart';
import 'package:provider/provider.dart';

class productAndPrice extends StatelessWidget {
  const productAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
        var provider=Provider.of<Cart>(context);
    return   Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>Checkout())
                      
                      
                      );
                    },
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                  Positioned(
                    bottom: 24,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(211, 164, 255, 193),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "${provider.selectedProducts.length}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text("\$ ${provider.price}"),
              ),
            ],
          );
  }
}