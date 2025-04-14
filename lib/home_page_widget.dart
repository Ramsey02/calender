import '/components/background/background_widget.dart';
import '/components/events/events_widget.dart';
import '/components/now_line/now_line_widget.dart';
import '/components/week_days/week_days_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = 'homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selectedDay = getCurrentTimestamp;
      FFAppState().update(() {});
      if (animationsMap['eventsOnActionTriggerAnimation'] != null) {
        await animationsMap['eventsOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
    });

    animationsMap.addAll({
      'eventsOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.elasticOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(47.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _model.scrollableColumn?.animateTo(
              _model.scrollableColumn!.position.maxScrollExtent,
              duration: Duration(milliseconds: 100),
              curve: Curves.ease,
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).white,
            size: 24.0,
          ),
        ),
        body: Stack(
          alignment: AlignmentDirectional(0.0, -1.0),
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 235.0, 0.0, 0.0),
              child: SingleChildScrollView(
                controller: _model.scrollableColumn,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        wrapWithModel(
                          model: _model.backgroundModel,
                          updateCallback: () => safeSetState(() {}),
                          child: BackgroundWidget(
                            height:
                                functions.multiply(FFAppState().hourHeight, 23),
                          ),
                        ),
                        if (dateTimeFormat("d/M/y", FFAppState().selectedDay) ==
                            dateTimeFormat("d/M/y", getCurrentTimestamp))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.nowLineModel,
                              updateCallback: () => safeSetState(() {}),
                              child: NowLineWidget(
                                height: functions
                                    .nowHeight(FFAppState().hourHeight),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.eventsModel,
                            updateCallback: () => safeSetState(() {}),
                            child: EventsWidget(
                              height: functions.multiply(
                                  FFAppState().hourHeight, 24),
                            ),
                          ).animateOnActionTrigger(
                            animationsMap['eventsOnActionTriggerAnimation']!,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 235.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x11000000),
                    offset: Offset(
                      0.0,
                      6.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 35.0,
                          height: 35.0,
                          child: Stack(
                            children: [
                              Container(
                                width: 35.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Container(
                                  width: 35.0,
                                  height: 35.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/turo-deals-1599612493143.appspot.com/o/demo_images%2Fmichael.jpg?alt=media&token=81bd1338-4ff5-44c0-b4c8-097d8dee8fc6',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.calendar_today,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            FFAppState().selectedDay = getCurrentTimestamp;
                            FFAppState().update(() {});
                            if (animationsMap[
                                    'eventsOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'eventsOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectionArea(
                              child: Text(
                            getJsonField(
                              functions.dateInfo(FFAppState().selectedDay!),
                              r'''$.month''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0x7A57636C),
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                ),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 30.0),
                      child: wrapWithModel(
                        model: _model.weekDaysModel,
                        updateCallback: () => safeSetState(() {}),
                        child: WeekDaysWidget(
                          callback: () async {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.85, 0.95),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 4.0,
                  ),
                  child: Container(
                    width: 100.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).overlayWhite,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: FaIcon(
                            FontAwesomeIcons.minus,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 10.0,
                          ),
                          onPressed: () async {
                            FFAppState().hourHeight =
                                FFAppState().hourHeight + -10;
                            FFAppState().update(() {});
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15.0,
                          ),
                          onPressed: () async {
                            FFAppState().hourHeight =
                                FFAppState().hourHeight + 10;
                            FFAppState().update(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
