import "package:flutter/material.dart";

import '../Book.dart';
import '../MainBook.dart';
import 'DetailsScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bookbar = ["All", "Recommended", "Popular books", "My books"];

  Widget buildStars(int) {
    return Row(children: <Widget>[
      for (var c = 0; c < int; c++)
        Image(image: AssetImage("assets/images/star.png"))
    ]);
  }

  var _currentIndex = 0;
  var _icons = [Icons.favorite, Icons.import_contacts, Icons.person];

  buildBottomNavigationBarItem() {
    return _icons.map((data) {
      return BottomNavigationBarItem(
        icon: Icon(
          data,
          color: _currentIndex == _icons.indexOf(data)
              ? Color(0XFF007084)
              : Color(0XFFBDC3C7),
        ),
        title: SizedBox.shrink(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F5F9),
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F5F9),
        title: Text(
          "Hi John,",
          style: TextStyle(
            fontFamily: "CircularStd",
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.search, color: Colors.black, size: 25),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.notifications, color: Colors.black, size: 25),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            child: Image(
              image: AssetImage(
                "assets/images/banner.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    bookbar[index],
                    style: TextStyle(
                        fontFamily: "CircularStd",
                        fontWeight: FontWeight.w700,
                        fontSize: index == 0 ? 18 : 15,
                        color:
                            index == 0 ? Color(0XFF0B0B0B) : Color(0XFFBDC3C7)),
                  ),
                );
              },
              itemCount: bookbar.length,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mainBooks.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: 240,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                new Radius.circular(10.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 6)
                              ]),
                          height: 135,
                          child: Container(
                              margin: EdgeInsets.only(left: 100),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    mainBooks[index].title,
                                    style: TextStyle(
                                        fontFamily: "CircularStd",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    mainBooks[index].about,
                                    style: TextStyle(
                                        fontFamily: "CircularStd",
                                        fontSize: 9,
                                        color: Color(0xff7F8589),
                                        height: 1.5),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      buildStars(mainBooks[index].stars),
                                      Text(mainBooks[index].category,
                                          style: TextStyle(
                                              fontFamily: "CircularStd",
                                              fontSize: 10,
                                              color: Color(0xff007084),
                                              fontWeight: FontWeight.w700))
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Positioned(
                        left: 2,
                        bottom: 2,
                        child: Container(
                          width: 110,
                          height: 160,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DetailsScreen()),
                              );
                            },
                            child: Hero(
                              tag: mainBooks[index].title,
                              child: Image(
                                  image: AssetImage(mainBooks[index].cover),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 35),
          Text(
            "You may also like",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 15),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRect(
                      child: Image.asset(books[index].cover),
                    ),
                    Text(
                      books[index].title,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      books[index].category,
                      style: TextStyle(
                          color: Color(0xff007084),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: 0,
        elevation: 0,
        items: buildBottomNavigationBarItem(),
      ),
    );
  }
}
