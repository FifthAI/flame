import 'dart:ui';

import '../sprite_batch.dart';
import 'component.dart';

/// [SpriteBatch] 组成的组件,
/// - 默认构造方法可以后设置[SpriteBatch]对象;
class SpriteBatchComponent extends Component {
  SpriteBatch? spriteBatch;
  BlendMode? blendMode;
  Rect? cullRect;
  Paint? paint;

  /// Creates a component with an empty sprite batch which can be set later
  SpriteBatchComponent();

  SpriteBatchComponent.fromSpriteBatch(
    this.spriteBatch, {
    this.blendMode,
    this.cullRect,
    this.paint,
  });

  @override
  void render(Canvas canvas) {
    spriteBatch?.render(
      canvas,
      blendMode: blendMode,
      cullRect: cullRect,
      paint: paint,
    );
  }
}
