import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _pageIndex = 0;
  List data = [];


  @override
  void initState() {
    this.getData();
    print(fetchAlbum());
    // TODO: implement initState
    super.initState();
  }

  Future<http.Response> fetchAlbum() async {
    var body = {
      'category_id' :'96',
      'seller_id': '2',
      'sort_orde:newest': 'newest',
      'page':'1'
    };
    return await http.post('http://phase2.surabhigoodbuy.com/v2/get_categories',body: body);
  }
  getData(){
    var dt;
    fetchAlbum().then((value1) => {
      setState((){
        dt = json.decode(value1.body);
      }),
      print(dt['data']['category']),
      setState((){
        this.data = dt['data']['categories'];
      })
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select branch', style: TextStyle(fontSize: 12, color: Colors.black87),),
              Text('Ramanattukara', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),),
            ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on, color: Colors.black87,),
          ),
          IconButton(
            icon: new Stack(
              children: <Widget>[
                new Icon(Icons.notifications_none, color: Colors.black87,),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: new Text(
                      '1',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),


        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            DrawerHeader(

              child: Image.network('https://lh3.googleusercontent.com/proxy/c5xziOGSaef_WjyuGRBH9r6ZPtPj-KuS-8u2zU7rNVmuq7yR4IUBfzY1eZgyGc2W-63xpdGC2M_F27Ix7U5_yc3HIq7qC0bVinUJC7LQPPPTa772KHs_nfQhH5zJUm3937GriB7CoNINtZFIsjg0SW9poYh3va1AnbgxJyJDgf7ppjG2Xy6ImOhG_WACDbZ1Ew',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              // decoration: BoxDecoration(
              //   color: Color(0xFFf7fbe2),
              // ),
            ),
            // SizedBox(height: 30,),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Category'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('WishList'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Offers'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Cart'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (value) async{
          getData();
          setState(() {
            print(value);
            this._pageIndex = value;
          });
        },
        // showSelectedLabels:false,
        backgroundColor: Colors.grey[300],
        fixedColor: Colors.black87,
        unselectedItemColor: Colors.black54,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.view_module), title: Text("Category")),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), title: Text("Wishlist")),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), title: Text("Offers")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("Card")),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child:Image.network('https://lh3.googleusercontent.com/proxy/c5xziOGSaef_WjyuGRBH9r6ZPtPj-KuS-8u2zU7rNVmuq7yR4IUBfzY1eZgyGc2W-63xpdGC2M_F27Ix7U5_yc3HIq7qC0bVinUJC7LQPPPTa772KHs_nfQhH5zJUm3937GriB7CoNINtZFIsjg0SW9poYh3va1AnbgxJyJDgf7ppjG2Xy6ImOhG_WACDbZ1Ew',
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child:Image.network('https://lh3.googleusercontent.com/proxy/c5xziOGSaef_WjyuGRBH9r6ZPtPj-KuS-8u2zU7rNVmuq7yR4IUBfzY1eZgyGc2W-63xpdGC2M_F27Ix7U5_yc3HIq7qC0bVinUJC7LQPPPTa772KHs_nfQhH5zJUm3937GriB7CoNINtZFIsjg0SW9poYh3va1AnbgxJyJDgf7ppjG2Xy6ImOhG_WACDbZ1Ew',
                                    width: MediaQuery.of(context).size.width * 0.47,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 8 ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child:Image.network('https://lh3.googleusercontent.com/proxy/c5xziOGSaef_WjyuGRBH9r6ZPtPj-KuS-8u2zU7rNVmuq7yR4IUBfzY1eZgyGc2W-63xpdGC2M_F27Ix7U5_yc3HIq7qC0bVinUJC7LQPPPTa772KHs_nfQhH5zJUm3937GriB7CoNINtZFIsjg0SW9poYh3va1AnbgxJyJDgf7ppjG2Xy6ImOhG_WACDbZ1Ew',
                                    width: MediaQuery.of(context).size.width*0.47,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text('Shop by Category', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54, fontSize: 16),),
                            ),
                            Wrap(
                              children: [
                                for(var i = 0 ; i < this.data.length;i++)
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.32,
                                  color: (i % 2 == 0)?Color(0xFFf7fbe2):Color(0xFFf2f2da),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8,right: 8),
                                        child: Image.network(this.data[i]['image'],
                                          width: MediaQuery.of(context).size.width * 0.32,
                                          height: MediaQuery.of(context).size.width * 0.33,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(this.data[i]['title'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    left: 0.0,
                    top: 0.0,
                    child: new Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60.0,
                        decoration: new BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 0,bottom: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],
                            ),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              // keyboardType: inputType,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 14,height: 1.5),
                                hintText: "ഇവിടെ തിരയുക",
                                prefixIcon: Icon(Icons.search),
                                //   // padding: EdgeInsets., // add padding to adjust icon
                                //   child: Icon(Icons.search),
                                // ),
                              ),

                            ),
                          ),
                        )
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}