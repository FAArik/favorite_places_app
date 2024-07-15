import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onPickLocation});

  final void Function(LocationData location) onPickLocation;

  @override
  State<StatefulWidget> createState() {
    return _LocationInput();
  }
}

class _LocationInput extends State<LocationInput> {
  LocationData? _pickedLocation;
  var _isGettingLocation = false;

  _getCurrentLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _isGettingLocation = true;
    });
    _locationData = await location.getLocation();
    setState(() {
      _isGettingLocation = false;
      _pickedLocation = _locationData;
    });
    widget.onPickLocation(_locationData);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = _pickedLocation != null
        ? Text(
            "latidude:${_pickedLocation?.latitude}, longitude:${_pickedLocation?.longitude}", //google static maps api can be used for image
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ))
        : Text(
            "No location chosen",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          );

    if (_isGettingLocation == true) {
      previewContent = const CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              label: const Text("Get current location"),
              icon: const Icon(
                Icons.location_on,
              ),
              onPressed: _getCurrentLocation,
            ),
            TextButton.icon(
              label: const Text("Select on map"),
              icon: const Icon(
                Icons.map,
              ),
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }
}
