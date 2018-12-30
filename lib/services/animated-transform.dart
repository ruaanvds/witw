import 'package:flutter/material.dart';

class AnimatedTransform extends ImplicitlyAnimatedWidget {
  final Matrix4 transform;
  final AlignmentGeometry alignment;
  final bool transformHitTests;
  final Offset origin;
  final Widget child;

  const AnimatedTransform({
    Key key,
    @required this.transform,
    @required Duration duration,
    this.alignment,
    this.transformHitTests = true,
    this.origin,
    this.child,
    Curve curve = Curves.linear,
  })  : assert(transform != null),
        assert(duration != null),
        super(
          key: key,
          duration: duration,
          curve: curve,
        );

  @override
  _AnimatedTransformState createState() => _AnimatedTransformState();
}

class _AnimatedTransformState
    extends AnimatedWidgetBaseState<AnimatedTransform> {
  Matrix4Tween _transform;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _transform = visitor(_transform, widget.transform,
        (dynamic value) => Matrix4Tween(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: widget.alignment,
      transform: _transform.evaluate(animation),
      transformHitTests: widget.transformHitTests,
      origin: widget.origin,
      child: widget.child,
    );
  }
}
