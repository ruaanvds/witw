import 'dart:math' as math;
import 'package:flutter/foundation.dart';

double _radians(n) {
  return n * (math.pi / 180);
}

double _degrees(n) {
  return n * (180 / math.pi);
}

double getBearing(startLat, startLon, endLat, endLon) {
  num cStartLat = _radians(startLat);
  num cStartLon = _radians(startLon);
  num cEndLat = _radians(endLat);
  num cEndLon = _radians(endLon);

  num dLong = cEndLon - cStartLon;
  num dPhi = math.log(math.tan(cEndLat / 2.0 + math.pi / 4.0) /
      math.tan(cStartLat / 2.0 + math.pi / 4.0));

  if (dLong.abs() > math.pi) {
    if (dLong > 0.0)
      dLong = -(2.0 * math.pi - dLong);
    else
      dLong = (2.0 * math.pi + dLong);
  }

  var bearing = (_degrees(math.atan2(dLong, dPhi)) + 360.0) % 360.0;
  debugPrint('bearing is: $bearing');

  return bearing;
}
