import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_property3_widget.dart' show CreateProperty3Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProperty3Model extends FlutterFlowModel<CreateProperty3Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for pricePerNight widget.
  FocusNode? pricePerNightFocusNode;
  TextEditingController? pricePerNightTextController;
  String? Function(BuildContext, String?)? pricePerNightTextControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for taxRate widget.
  FocusNode? taxRateFocusNode;
  TextEditingController? taxRateTextController;
  String? Function(BuildContext, String?)? taxRateTextControllerValidator;
  // State field(s) for cleaningFee widget.
  FocusNode? cleaningFeeFocusNode;
  TextEditingController? cleaningFeeTextController;
  String? Function(BuildContext, String?)? cleaningFeeTextControllerValidator;
  // State field(s) for notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    pricePerNightFocusNode?.dispose();
    pricePerNightTextController?.dispose();

    taxRateFocusNode?.dispose();
    taxRateTextController?.dispose();

    cleaningFeeFocusNode?.dispose();
    cleaningFeeTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();
  }
}
