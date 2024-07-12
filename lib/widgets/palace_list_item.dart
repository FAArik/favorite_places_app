import 'package:favorite_places_app/models/favorite_place.dart';
import 'package:flutter/material.dart';

class PalaceListItem extends StatelessWidget {
  const PalaceListItem({super.key, required this.favoriteplace});
  final FavoritePlace favoriteplace;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Text(
            favoriteplace.title,
          ),
        ),
      ),
    );
  }
}
