import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
   DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
bool isshowMore=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                  Positioned(
                    bottom: 24,

                    child: Container(
                      padding: EdgeInsets.all(5),

                      child: Text(
                        '8',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(211, 164, 255, 193),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text("\$13"),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/img/w1.jpg'),
            SizedBox(height: 11),
        
            Text("\$13.66", style: TextStyle(fontSize: 20)),
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
