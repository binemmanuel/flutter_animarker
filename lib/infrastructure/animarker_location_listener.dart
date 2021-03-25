// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:flutter_animarker/core/i_animarker_controller.dart';
import '../flutter_map_marker_animation.dart';
import '../helpers/extensions.dart';

mixin AnimarkerLocationListenerMixin on IAnimarkerController{

  void locationListener(ILatLng location) async {

    var marker = Marker(
      markerId: location.markerId,
      position: location.toLatLng,
      rotation: location.bearing,
    );

    if(description.onMarkerAnimation != null){
      description.onMarkerAnimation!(marker);
    }

    //Notify if the marker has reached his end position
    if(location.isStopover && description.onStopover != null){
      await description.onStopover!(location.toLatLng);
    }
  }
}
