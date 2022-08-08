import 'package:what_next/modules/isolate_tuto/isolating.dart';

const Modules defaultModule = Modules.ISOLATING;
get getDefaultModule {
  switch (defaultModule) {
    case Modules.ISOLATING:
      return Isolating();
    default:
      return Isolating();
  }
}

enum Modules { ISOLATING }
