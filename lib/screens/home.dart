
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenify/models/item.dart';
import 'package:greenify/provider/cart.dart';
import 'package:greenify/screens/checkout.dart';
import 'package:greenify/screens/details_screen.dart';
import 'package:greenify/shared/appbar.dart';
import 'package:greenify/shared/colors.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<Cart>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "maha Atef",
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text("mahashamaly20@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/img/m.jpg'),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/m2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home())

                
                
                );
              },
            ),
            ListTile(
              title: Text("My products"),
              leading: Icon(Icons.add_shopping_cart),
              onTap: () {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkout())

                
                
                );
                
              },
            ),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.help_center),
              onTap: () {},
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Developed by Maha Atef @2025",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
         productAndPrice()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 33,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          itemCount: itmes.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(product: itmes[index]),
                  ),
                );
              },
              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(55),
                  child: Image.asset(itmes[index].Imagepath),
                ),
                footer: GridTileBar(
                  leading: Text(
                    "\$${itmes[index].price}",
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: IconButton(
                    color: Color.fromARGB(255, 62, 94, 70),
                    onPressed: () {
                      provider.add(itmes[index]);
                    },
                    icon: Icon(Icons.add),
                  ),
                  title: Text(""),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
