import 'package:flutter/material.dart';

/// Wrapper widget that applies RepaintBoundary for performance optimization
/// Prevents unnecessary repaints during scroll operations
class RepaintBoundaryWrapper extends StatelessWidget {
  final Widget child;
  final String? debugLabel;

  const RepaintBoundaryWrapper({
    super.key,
    required this.child,
    this.debugLabel,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: child,
    );
  }
}




