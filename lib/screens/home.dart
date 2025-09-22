import 'package:flutter/material.dart';
import 'package:greenify/models/item.dart';
import 'package:greenify/shared/colors.dart';


class Home extends StatelessWidget {
  Home({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "maha Atef",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
              onTap: () {},
            ),
            ListTile(
              title: Text("My products"),
              leading: Icon(Icons.add_shopping_cart),
              onTap: () {},
            ),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.help_center),
              onTap: () {},
            ),

            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {},
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Developed by Maha atef@2025",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
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

              },
              child: GridTile(
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      left: 0,
                      top: -3,
                      bottom: -9,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Image.asset(itmes[index].Imagepath),
                      ),
                    ),
                  ],
                ),

                footer: GridTileBar(
                  leading: Text(itmes[index].price.toString()),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.black),
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
