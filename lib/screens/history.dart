import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "HISTORY",
            style: TextStyle(color: Colors.greenAccent, fontFamily: 'Oswald'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HistoryList(),
            ],
          ),
        ));
  }
}

class HistoryList extends StatelessWidget {
  int itemCount = 20;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 10),
        separatorBuilder: (_, int no) => Divider(),
        itemCount: itemCount,
        itemBuilder: (_, int itemCount) => ListTile(
            title: Text(
              itemCount == 0
                  ? "Plastic Bag"
                  : itemCount == 1
                      ? "Paper"
                      : itemCount == 2
                          ? "Food Waste"
                          : itemCount == 3
                              ? "Newspaper"
                              : itemCount == 4
                                  ? "Pens"
                                  : itemCount == 5
                                      ? "Shoes"
                                      : itemCount == 6
                                          ? "Tyres"
                                          : itemCount == 7
                                              ? "Wood"
                                              : itemCount == 8
                                                  ? "Oil"
                                                  : 'Oil',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Approximate Time To Decompose: X Yearsw",
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                  ),
                  Text(
                    "28/03/21",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )));
  }
}
