import 'package:flutter/material.dart';

abstract class FlutterFlowModel<T extends StatefulWidget> {
  bool _disposed = false;
  void initState(BuildContext context);
  void dispose();
  void onUpdate();
  bool get disposed => _disposed;
  void maybeDispose() {
    if (!_disposed) {
      dispose();
      _disposed = true;
    }
  }
}

T createModel<T extends FlutterFlowModel>(
    BuildContext context, T Function() builder) {
  final model = builder();
  model.initState(context);
  return model;
}