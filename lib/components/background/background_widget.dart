import '/components/hour_background/hour_background_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'background_model.dart';
export 'background_model.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({
    super.key,
    this.height,
  });

  final int? height;

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  late BackgroundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackgroundModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: widget!.height?.toDouble(),
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Builder(
          builder: (context) {
            final hours = getJsonField(
              functions.getHours(),
              r'''$.hours[*]''',
            ).toList();

            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(hours.length, (hoursIndex) {
                final hoursItem = hours[hoursIndex];
                return HourBackgroundWidget(
                  key: Key('Keyy5q_${hoursIndex}_of_${hours.length}'),
                  time: getJsonField(
                    hoursItem,
                    r'''$.hour''',
                  ).toString(),
                  period: getJsonField(
                    hoursItem,
                    r'''$.period''',
                  ).toString(),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
