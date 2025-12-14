import 'package:flutter/material.dart';
import 'package:greenify/provider/cart.dart';
import 'package:greenify/shared/appbar.dart';
import 'package:greenify/shared/colors.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<Cart>(context);
    return Scaffold(
 appBar: AppBar(
        title: Text("checkout Screen"),
        actions: [
         productAndPrice()
        ],
      ),

      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount:provider.selectedProducts.length ,
                itemBuilder:(context,index){
                 return Card(
                  child: ListTile(
                    title: Text(provider.selectedProducts[index].name),
                    subtitle:Text("${provider.selectedProducts[index].price} - ${provider.selectedProducts[index].location}") ,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(provider.selectedProducts[index].Imagepath),
                    ),
                    trailing: IconButton(onPressed: (){
                   
                    provider.delete(provider.selectedProducts[index]);                 

                    

                    }, icon: Icon(Icons.remove)),
                  ),
            
                 );
                  
                }
              
              
              
                  ),
                  ),
          ),
        
        
        
        ElevatedButton(onPressed: (){}, 
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(BTNPink),
          padding:MaterialStateProperty.all (EdgeInsets.all(12)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        ),
        child: Text("pay  \$ ${provider.price}",style: TextStyle(fontSize: 19),)
        ),
        ],
      )
    );
          }
          
          
          
          


    
  }
