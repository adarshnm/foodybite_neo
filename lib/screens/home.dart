import 'package:flutter/material.dart';
import 'package:foodybite_neo/model/restaurant.dart';
import 'package:foodybite_neo/ui/cuisine_card.dart';
import 'package:foodybite_neo/ui/heading_main.dart';
import 'package:foodybite_neo/ui/restaurant_card.dart';
import 'package:foodybite_neo/ui/search_bar.dart';

class Home extends StatefulWidget {
  final Future locationDetails;
  Home({Key key, @required this.locationDetails})
      : assert(locationDetails != null),
        super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _getTrendingList(AsyncSnapshot<dynamic> snapshot) {
    final responseList = snapshot.data['best_rated_restaurant'];
    final restaurantList = responseList
        .map((it) => Restaurant.fromJSON(it['restaurant']))
        .toList();
    return restaurantList;
  }

  _getTopCuisines(AsyncSnapshot<dynamic> snapshot) {
    return snapshot.data['top_cuisines'];
  }

  final _cuisineAssets = [
    'assets/images/dish1.jpg',
    'assets/images/dish2.jpg',
    'assets/images/dish3.jpg',
    'assets/images/dish4.jpg',
    'assets/images/dish5.jpg'
  ];
  static const _cuisineGradients = [
    LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xAFFF5673), Color(0xAFFF8C48)]),
    LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xAFFF4665), Color(0xAFFF4665)]),
    LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xAF2DCEF8), Color(0xAF3B40FE)]),
    LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xAFFF5673), Color(0xAFFF8C48)]),
    LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xAFFF4665), Color(0xAFFF4665)]),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        SearchBar(),
        FoodyBiteHeader(
          title: 'Trending Restaurants',
          subTitle: 'See all',
          onsubTitleTap: () {},
        ),
        Container(
          height: 300,
          padding: EdgeInsets.only(left: 8, bottom: 8),
          child: FutureBuilder(
              future: widget.locationDetails,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final restaurantList = _getTrendingList(snapshot);
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurantList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RestaurantCard(
                      restaurant: restaurantList[index],
                    ),
                  ),
                );
              }),
        ),
        FoodyBiteHeader(
          title: 'Categories',
          subTitle: 'See all',
          onsubTitleTap: () {},
        ),
        Container(
          height: 150,
          child: FutureBuilder(
              future: widget.locationDetails,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final list = _getTopCuisines(snapshot);
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      for (var i = 0; i < 3; i++)
                        CuisineCard(
                          title: list[i],
                          imgUrl: _cuisineAssets[i],
                          gradient: _cuisineGradients[i],
                        )
                    ],
                  ),
                );
              }),
        ),
      ],
    ));
  }
}
