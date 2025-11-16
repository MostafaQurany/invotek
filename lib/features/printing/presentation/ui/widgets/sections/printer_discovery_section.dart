import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_cubit.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_state.dart';
import '../discovery/printer_discovery_widget.dart';

/// Widget section للبحث عن الطابعات - يستمع فقط لحالة البحث والاتصال
class PrinterDiscoverySection extends StatelessWidget {
  const PrinterDiscoverySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PrinterCubit, PrinterState, ({
      bool isScanning,
      bool isConnecting,
    })>(
      selector: (state) {
        final isScanning = state.maybeWhen(
          scanning: (_) => true,
          orElse: () => false,
        );
        final isConnecting = state.maybeWhen(
          connecting: (_) => true,
          orElse: () => false,
        );
        return (isScanning: isScanning, isConnecting: isConnecting);
      },
      builder: (context, data) {
        final cubit = context.read<PrinterCubit>();
        final isConnected = cubit.isConnected;
        final connectedDevice = cubit.connectedDevice;

        return PrinterDiscoveryWidget(
          scanResults$: cubit.scanResults$,
          isScanning: data.isScanning,
          connectedDevice: connectedDevice,
          isConnected: isConnected,
          isConnecting: data.isConnecting,
          onStartScan: () => cubit.startScan(),
          onStopScan: () => cubit.stopScan(),
          onConnectToDevice: (device) {
            if (!data.isConnecting) {
              cubit.connect(device);
            }
          },
        );
      },
    );
  }
}

