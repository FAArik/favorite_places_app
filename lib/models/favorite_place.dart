import 'dart:io';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.latidude,
    required this.longitude,
    required this.address,
  });

  final double latidude;
  final double longitude;
  final String address;
}

class FavoritePlace {
  FavoritePlace({
    required this.title,
    required this.image,
    required this.location,
    id,
  }) : id = id ?? uuid.v4();
  final String id;
  final String title;
  File image;
  final PlaceLocation location;
}
