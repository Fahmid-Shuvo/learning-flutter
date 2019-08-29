import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/recipes.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        Text('$duration min')
                      ],
                    )
                  ],
                ))
          ],
        ),
        margin: EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
