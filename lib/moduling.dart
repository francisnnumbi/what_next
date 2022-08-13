import 'package:what_next/modules/isolate_tuto/isolating.dart';

const Modules defaultModule = Modules.isolating;
get getDefaultModule {
  switch (defaultModule) {
    case Modules.isolating:
      return const Isolating();
    default:
      return const Isolating();
  }
}

enum Modules { isolating }
