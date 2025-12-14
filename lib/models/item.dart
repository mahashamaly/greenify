class Item {
  String Imagepath;
  double price;
  String location;
  String name;
  Item({required this.Imagepath, required this.price,this.location="main-branch", required this.name});
}

final List<Item> itmes = [
  Item(name:"product1", Imagepath: "assets/img/w1.jpg", price: 17.44, ),
  Item( name:"product2"  , Imagepath: "assets/img/w2.jpg", price: 25.44,),
  Item(  name:"product3" ,  Imagepath: "assets/img/w3.jpg", price: 20.55, ),
  Item(  name:"product4",  Imagepath: "assets/img/w4.jpg", price: 19.12, ),
  Item(name:"product5", Imagepath: "assets/img/w1.jpg", price: 17.44, ),
  Item( name:"product6",    Imagepath: "assets/img/w2.jpg", price: 25.44, ),
  Item(  name:"product7" ,Imagepath: "assets/img/w3.jpg", price: 20.55,),
  Item( name:"product8" , Imagepath: "assets/img/w4.jpg", price: 19.12, ),
];

