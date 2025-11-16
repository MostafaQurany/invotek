import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_cubit.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_state.dart';
import '../connection/connection_status_widget.dart';

/// Widget section للاتصال - يستمع فقط لحالة الاتصال
/// يستخدم BlocSelector لتقليل rebuilds غير الضرورية
class ConnectionStatusSection extends StatelessWidget {
  const ConnectionStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrinterCubit, PrinterState>(
      buildWhen: (previous, current) {
        // rebuild فقط عند تغيير حالة الاتصال
        final prevConnected = previous.maybeWhen(
          connected: (_) => true,
          orElse: () => false,
        );
        final currConnected = current.maybeWhen(
          connected: (_) => true,
          orElse: () => false,
        );
        return prevConnected != currConnected;
      },
      builder: (context, state) {
        final cubit = context.read<PrinterCubit>();
        final isConnected = state.maybeWhen(
          connected: (_) => true,
          orElse: () => false,
        );
        final connectedDevice = cubit.connectedDevice;

        return ConnectionStatusWidget(
          isConnected: isConnected,
          connectedDevice: connectedDevice,
          onDisconnect: isConnected ? () => cubit.disconnect() : null,
        );
      },
    );
  }
}

