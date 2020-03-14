import "package:flutter/material.dart";

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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

  Widget buildStars(int) {
    return Row(children: <Widget>[
      for (var c = 0; c < int; c++)
        Image(
          image: AssetImage("assets/images/star.png"),
          width: 17,
          fit: BoxFit.cover,
        )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: Colors.green,
                height: MediaQuery.of(context).size.height / 3,
                child: Hero(
                  tag: "The little mermaid",
                  child: Image.asset(
                    "assets/images/header.png",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The little mermaid",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: <Widget>[
                          buildStars(5),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Fairy Tales",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff007084)),
                          )
                        ],
                      )
                    ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
                child: Text(
                  "“The Little Mermaid” is a fairy tale written by the Danish author Hans Christian Andersen. The story follows the journey of a young mermaid who is willing to give up her life in the sea as a mermaid to gain a human soul. The tale was first published in 1837 as part of a collection of fairy tales for children.",
                  style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Color(0xff7F8589),
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                      decoration: BoxDecoration(
                          color: Color(0xff007084),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Read book",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 2, color: Color(0xffBDC3C7))),
                      child: Text("More info",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBDC3C7))),
                    )
                  ],
                ),
              ),
            ],
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
