import '../../../components.dart';
import '../../game/game.dart';
import 'package:flutter/foundation.dart';

mixin HasGameRef<T extends Game> {
  T? _gameRef;

  T get gameRef {
    final ref = _gameRef;
    if (ref == null) {
      // print(StackTrace.current);
      debugPrintStack(maxFrames: 3);
      throw '${this} 在添加组件前使用了还没有绑定的gameRef / Accessing gameRef before the component was added to the game!';
    }
    return ref;
  }

  bool get hasGameRef => _gameRef != null;

  set gameRef(T gameRef) {
    _gameRef = gameRef;
    if (this is BaseComponent) {
      (this as BaseComponent)
          .children
          .whereType<HasGameRef<T>>()
          .forEach((e) => e.gameRef = gameRef);
    }
  }
}
