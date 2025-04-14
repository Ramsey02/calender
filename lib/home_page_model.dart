import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_model.dart';
import '/components/background/background_model.dart';
import '/components/now_line/now_line_model.dart';
import '/components/events/events_model.dart';
import '/components/week_days/week_days_model.dart';
import 'home_page_widget.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.
  // State field(s) for ScrollableColumn widget.
  ScrollController? scrollableColumn;
  // Model for Background component.
  late BackgroundModel backgroundModel;
  // Model for NowLine component.
  late NowLineModel nowLineModel;
  // Model for Events component.
  late EventsModel eventsModel;
  // Model for WeekDays component.
  late WeekDaysModel weekDaysModel;

  @override
  void initState(BuildContext context) {
    scrollableColumn = ScrollController();
    backgroundModel = createModel(context, () => BackgroundModel());
    nowLineModel = createModel(context, () => NowLineModel());
    eventsModel = createModel(context, () => EventsModel());
    weekDaysModel = createModel(context, () => WeekDaysModel());
  }

  @override
  void dispose() {
    scrollableColumn?.dispose();
    backgroundModel.dispose();
    nowLineModel.dispose();
    eventsModel.dispose();
    weekDaysModel.dispose();
  }
}