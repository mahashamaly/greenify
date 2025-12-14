import 'package:flutter/material.dart';
import 'package:greenify/models/item.dart';
import 'package:greenify/provider/cart.dart';
import 'package:greenify/shared/appbar.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
   DetailsScreen({super.key,required this.product});
   Item product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
bool isshowMore=true;

  @override
  Widget build(BuildContext context) {
       var provider=Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
         productAndPrice(),
          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.product.Imagepath),
            SizedBox(height: 11),
        
            Text(widget.product.price.toString(), style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text("New", style: TextStyle(fontSize: 16)),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 129, 129),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
        
        
                SizedBox(
                  width: 8,
                ),
        
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                  ],
                ),
        
                SizedBox(width: 66),
        
                Row(
                  children: [
                    Icon(
                      Icons.edit_location,
                      size: 23,
                      color: Color.fromARGB(168, 3, 65, 27),
                    ),
                    SizedBox(width: 3),
                    Text("Flower Shop", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
        
         SizedBox(height: 16),
         SizedBox(
          width: double.infinity,
           child: Text("Details",style: TextStyle(fontSize: 18),
           textAlign: TextAlign.start,
           ),
         ),
        
        
        
        
        
         Text("Roses are beautiful flowering plants known for their bright colors and fragrant scent, which add beauty and calmness to any place.hey are used for decoration, gardens, and special occasions such as holidays and weddings.Roses come in various types and colors, including red, yellow, pink, and white, each carrying its own meaning.Rose oil is also extracted from them and used in perfumes and cosmetic products.Roses require good soil, adequate water, and sunlight to grow healthy and beautifully.In different cultures, roses symbolize love, beauty, peace, and appreciation.",
         
         style: TextStyle(fontSize: 18),
         maxLines:isshowMore? 3:null,
         overflow: TextOverflow.fade,
         ),

         TextButton(onPressed: (){  
      setState(() {
        isshowMore=!isshowMore;
      });

         }, child: Text(
       isshowMore?"show more":"show less",
          
          
          style: TextStyle(fontSize: 18),))
        
        
        
        
        
        
        
        
        
          ],
        ),
      ),
    );
  }
}
