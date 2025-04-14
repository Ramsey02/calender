import 'package:flutter/material.dart';

abstract class FlutterFlowModel<T extends StatefulWidget> {
  bool _disposed = false;
  void initState(BuildContext context);
  void dispose();
  
  // Provide default implementation of onUpdate
  void onUpdate() {
    // Default empty implementation
  }
  
  bool get disposed => _disposed;
  void maybeDispose() {
    if (!_disposed) {
      dispose();
      _disposed = true;
    }
  }
}

// Export this as a top-level function to be used across the app
T createModel<T extends FlutterFlowModel>(
    BuildContext context, T Function() builder) {
  final model = builder();
  model.initState(context);
  return model;
}