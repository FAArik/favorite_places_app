import 'package:favorite_places_app/models/favorite_place.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({super.key, required this.place});
  final FavoritePlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(place.title),
        ),
        body: Stack(
          children: [
            Image.file(
              place.image,
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black54,
                          ],
                        ),
                      ),
                      child: Text(
                        place.location.address,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
