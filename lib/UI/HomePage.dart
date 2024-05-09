import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.menu),
          actions: [
            SizedBox(
              width: 300,
              height: 44,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Search here",
                    suffixIcon: Icon(Icons.search),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.network(
                          'https://is2-ssl.mzstatic.com/image/thumb/Purple114/v4/b5/60/9b/b5609b14-e928-3f4d-0a34-6ead78a0ada4/source/512x512bb.jpg'),
                    ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.notifications),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: listview(),
        floatingActionButton: FloatingActionButton.extended(

          onPressed: () {  },
          icon: Icon(Icons.chat, color: Colors.white,),
          label: Text("Chat", style: TextStyle(color: Colors.white),),
          heroTag: 'Chat',
          backgroundColor: Colors.red,
          elevation: 15,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.red,),label: "Home", ),
            BottomNavigationBarItem(icon: Icon(Icons.category,color: Colors.grey,),label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.shop_outlined,color: Colors.grey,),label: "Deals"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: Colors.grey,),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.grey,),label: "Profile"),
          ],
          selectedLabelStyle: TextStyle(color: Colors.grey),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          fixedColor: Colors.red,

        ),
        );
  }

  listview() {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      width: 300,
                      child: Image.network(
                          'https://m.media-amazon.com/images/G/31/img21/Wireless/Shreyansh/BAU/COOPMAy/1400x800_3._SX414_QL85_.jpg'),
                    ),
                  )
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
              height: 150,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blueGrey),
              width: 300,
              child: const Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      "KYC Pending",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "You need to provide the required",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "documents for your account activation.",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "Click Here",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white),
                    ),
                  ],
                ),
              )),
        ),
        roundedImages(),
        SizedBox(
          height: 10,
        ),
        exclusiveOffers(),

      ],
    );
  }

  roundedImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTglzXc6W9TJUtgqXJwaNNDROo6sgTw20domMe6EObK4g&s')),
            Text("Mobile")
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 18,
            ),
            SizedBox(
                height: 70,
                width: 70,
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbSJACLpAsIshPeG23_j50rImeDYxjlATfUHzd38-Pmw&s')),
            SizedBox(
              height: 12,
            ),
            Text("Laptop")
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 18,
            ),
            SizedBox(
                height: 70,
                width: 70,
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYgzGPHwL08YaA0dKWUhaAamZKK5P3M5q7zyILtbVaOg&s')),
            SizedBox(
              height: 12,
            ),
            Text("Camera")
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 18,
            ),
            SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                    'https://as2.ftcdn.net/v2/jpg/04/05/06/49/1000_F_405064998_YwGM5ItmHQOMwtJmrXP3zfJApGKThic5.jpg')),
            SizedBox(
              height: 6,
            ),
            Text("LED")
          ],
        ),
      ],
    );
  }

  exclusiveOffers() {
    return Container(
        height: 380,
        padding: EdgeInsets.all(20),
        color: Colors.lightBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "EXCLUSIVE FOR YOU",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  width: 120,
                ),
                Icon(Icons.arrow_forward)
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 180,
                        width: 190,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 120,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  child: const Text(" 32% Off "),
                                ),
                              ],
                            ),
                            Image.network('https://www.reliancedigital.in/medias/OnePlus-Nord-3-SmartPhones-493838380-i-1-1200Wx1200H-300Wx300H?context=bWFzdGVyfGltYWdlc3w0MjMzNHxpbWFnZS9qcGVnfGltYWdlcy9oOGUvaGE3LzEwMDIwOTE3OTAzMzkwLmpwZ3xlYzU1MGU0MWY0NmY3OTEyOTliZjczOWY4YzFmNzE3YTE5OGMzOGYzMjU5MDllMGIzYjhiMWIxZDlhOTcxNzY1'),
                           SizedBox(height: 20,),
                            Text("Nokia 8.1(iron,64 GB", style: TextStyle(fontSize: 16),)
                          ],
                        )),
                  );
                },
              ),
            )
          ],
        ));
  }
}
