import 'package:uuid/uuid.dart';

final uuid = Uuid();

class FavoritePlace {
  FavoritePlace({required this.title}) : Id = uuid.v4();
  final String Id;
  final String title;
}
