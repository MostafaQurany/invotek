import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_cubit.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_state.dart';
import '../connection/connected_printer_card.dart';

/// Widget section للطابعة المتصلة - يستمع فقط لحالة الاتصال
class ConnectedPrinterSection extends StatelessWidget {
  const ConnectedPrinterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PrinterCubit, PrinterState, bool>(
      selector: (state) => state.maybeWhen(
        connected: (_) => true,
        orElse: () => false,
      ),
      builder: (context, isConnected) {
        if (!isConnected) {
          return const SizedBox.shrink();
        }

        final cubit = context.read<PrinterCubit>();
        final connectedDevice = cubit.connectedDevice;
        
        if (connectedDevice == null) {
          return const SizedBox.shrink();
        }

        return ConnectedPrinterCard(
          connectedDevice: connectedDevice,
          onDisconnect: () => cubit.disconnect(),
        );
      },
    );
  }
}

