import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KidsAddBucketTypesWidget extends StatefulWidget {
  const KidsAddBucketTypesWidget({Key key}) : super(key: key);

  @override
  _KidsAddBucketTypesWidgetState createState() =>
      _KidsAddBucketTypesWidgetState();
}

class _KidsAddBucketTypesWidgetState extends State<KidsAddBucketTypesWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'iconButtonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!(widget.isOpen) ?? true)
          Align(
            alignment: AlignmentDirectional(0.9, 0.9),
            child: FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primaryText,
              borderRadius: 60,
              borderWidth: 1,
              buttonSize: 80,
              fillColor: FlutterFlowTheme.of(context).secondaryColor,
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 40,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ).animated([animationsMap['iconButtonOnActionTriggerAnimation']]),
          ),
      ],
    );
  }
}
