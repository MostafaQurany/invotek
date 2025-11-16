import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_cubit.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_state.dart';
import '../test/test_section_widget.dart';

/// Widget section للاختبار - يستمع فقط لحالة الاتصال
class TestSection extends StatelessWidget {
  final bool isGeneratingPreview;
  final List<Uint8List> testPreview;
  final VoidCallback onGeneratePreview;
  final VoidCallback onPrintTest;

  const TestSection({
    super.key,
    required this.isGeneratingPreview,
    required this.testPreview,
    required this.onGeneratePreview,
    required this.onPrintTest,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PrinterCubit, PrinterState, bool>(
      selector: (state) {
        return state.maybeWhen(
          connected: (_) => true,
          orElse: () => false,
        );
      },
      builder: (context, isConnected) {
        return TestSectionWidget(
          isGeneratingPreview: isGeneratingPreview,
          isConnected: isConnected,
          testPreview: testPreview,
          onGeneratePreview: onGeneratePreview,
          onPrintTest: onPrintTest,
        );
      },
    );
  }
}

