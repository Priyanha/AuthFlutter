import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LandingScreen.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Testtoo")),
      drawer: new Drawer(
          child: ListView(children: <Widget>[
        new UserAccountsDrawerHeader(
            accountName: new Text('TestUser'),
            accountEmail: new Text('test@test.com'),
            currentAccountPicture: new CircleAvatar(
              child: Image.asset('icon.jpg'),
            )),
        new ListTile(
            title: new Text("Image"),
            trailing: Icon(Icons.wallpaper_sharp, color: Colors.blue[300]),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new LandingScreen()));
            }),
        new ListTile(
            title: new Text("Account"),
            trailing: Icon(Icons.tag_faces, color: Colors.purple[300]),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.push(context, new MaterialPageRoute(
              //   builder: (BuildContext context) => new LandingScreen()));
            }),
        new ListTile(
            title: new Text("Product"),
            trailing: Icon(Icons.shopping_cart, color: Colors.orange[300]),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.push(context, new MaterialPageRoute(
              //   builder: (BuildContext context) => new LandingScreen()));
            }),
        new ListTile(
            title: new Text("Favorites"),
            trailing: Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.push(context, new MaterialPageRoute(
              //   builder: (BuildContext context) => new LandingScreen()));
            })
      ])),
      body: ListView(children: [
        // Padding(
        //   padding: EdgeInsets.all(15.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Icon(Icons.menu, color: Colors.black),
        //       Container(
        //         height: 50.0,
        //         width: 50.0,
        //         decoration: BoxDecoration(
        //             boxShadow: [
        //               BoxShadow(
        //                   color: Colors.grey.withOpacity(0.3),
        //                   blurRadius: 6.0,
        //                   spreadRadius: 4.0,
        //                   offset: Offset(0.0, 3.0))
        //             ],
        //             color: Color(0xFFC6E7FE),
        //             shape: BoxShape.circle,
        //             image: DecorationImage(
        //                 image: AssetImage('images/tuxedo.png'),
        //                 fit: BoxFit.contain)),
        //       )
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 15.0),
        //   child: Text(
        //     'Testtoo',
        //     style: GoogleFonts.notoSans(
        //         fontWeight: FontWeight.w800, fontSize: 27.0),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 15.0),
        //   child: Text(
        //     'VEHICLES',
        //     style: GoogleFonts.notoSans(
        //         fontWeight: FontWeight.w800, fontSize: 27.0),
        //   ),
        // ),
        // SizedBox(height: 25.0),
        // Padding(
        //     padding: EdgeInsets.only(left: 15.0, right: 15.0),
        //     child: Container(
        //         padding: EdgeInsets.only(left: 5.0),
        //         decoration: BoxDecoration(
        //             color: Colors.grey.withOpacity(0.1),
        //             borderRadius: BorderRadius.circular(10.0)),
        //         child: TextField(
        //           decoration: InputDecoration(
        //               hintText: 'Search',
        //               hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
        //               border: InputBorder.none,
        //               fillColor: Colors.grey.withOpacity(0.5),
        //               prefixIcon: Icon(Icons.search, color: Colors.grey)),
        //         ))),
        // SizedBox(height: 20.0),
        Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("sathu.gif"), fit: BoxFit.cover))),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Categories',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w700, fontSize: 18.0),
          ),
        ),
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              height: 140.0,
              child:
                  Center(
                    child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                _buildListItem('IMAGE', 'images/image.png', '21',
                      Color(0xFFFFE9C6), Color(0xFFDA9551)),
                _buildListItem('ACCOUNT', 'images/per.jpg', '15',
                      Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
               
              ]),
                  )),
        ),SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              height: 140.0,
              child:
                  Center(
                    child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                 _buildListItem('PRODUCT', 'images/pro.png', '15',
                  Color(0xFFD7FADA), Color(0xFF56CC7E)),
              _buildListItem('FAVORITES', 'images/heart.jpg', '15',
                  Color(0xFFE1BEE7), Color(0xFFBA48C8)),
               
              ]),
                  )),
        ),
        SizedBox(height: 10.0),
      ]),
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: InkWell(
            onTap: () {
              //ToDo
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LandingScreen()));
            },
            child: Container(
                height: 175.0,
                width: 150.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0), color: bgColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                        tag: foodName,
                        child: Container(
                            height: 75.0,
                            width: 75.0,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                                child: Image.asset(imgPath,
                                    height: 50.0, width: 50.0)))),
                    SizedBox(height: 10.0),
                    Text(
                      foodName,
                      style: GoogleFonts.notoSans(
                          fontSize: 17.0, color: textColor),
                    ),
                    // Text('\$' + price,
                    //     style: GoogleFonts.notoSans(
                    //         fontSize: 17.0, color: textColor))
                  ],
                ))));
  }
}
