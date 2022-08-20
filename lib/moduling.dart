import 'package:what_next/modules/flexing/flexing.dart';
import 'package:what_next/modules/isolate_tuto/isolating.dart';

const Modules defaultModule = Modules.isolating;

get getDefaultModule => getModule(module: defaultModule);

getModule({Modules module = defaultModule}) {
  switch (module) {
    case Modules.isolating:
      return const Isolating();
    case Modules.flex:
      return const Flexing();
    default:
      return const Isolating();
  }
}

enum Modules { isolating, flex }
