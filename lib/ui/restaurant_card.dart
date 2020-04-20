import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodybite_neo/model/restaurant.dart';
import 'package:foodybite_neo/utils/constants.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({Key key, this.restaurant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 200,
        decoration: neoDecoration,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 4,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: restaurant.thumbUrl +
                          '?fit=around|300%3A160&crop=300%3A160%3B*%2C*',
                      placeholder: (context, _) {
                        return Center(
                          child: SizedBox(
                            width: 64,
                            height: 64,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 8.0, right: 8.0, bottom: 4.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        restaurant.name,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontFamily: 'JosefinSans', fontSize: 18),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                              colors: [Color(0xFFFF8C48), Color(0xFFFF5673)]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            restaurant.primaryCuisine,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'JosefinSans',
                                fontSize: 11),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xAF2DCEF8), Color(0xAF3B40FE)]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '2.2 km',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'JosefinSans',
                                fontSize: 11),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                restaurant.address,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: text_color),
              ),
            )),
          ],
        ));
  }
}
