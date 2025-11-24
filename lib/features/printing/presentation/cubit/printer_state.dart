import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'printer_state.freezed.dart';

@freezed
class PrinterState with _$PrinterState {
  const factory PrinterState.initial() = _Initial;

  const factory PrinterState.connected(BluetoothDevice device) = _Connected;

  const factory PrinterState.disconnected() = _Disconnected;

  const factory PrinterState.connecting(BluetoothDevice device) = _Connecting;

  const factory PrinterState.scanning(List<BluetoothDevice> devices) =
      _Scanning;

  // حالات الطباعة الجديدة
  const factory PrinterState.processingTemplate() = _ProcessingTemplate;
  const factory PrinterState.renderingProgress(double progress) =
      _RenderingProgress;
  const factory PrinterState.sendingToPrinter() = _SendingToPrinter;
  const factory PrinterState.sendingProgress(double progress) =
      _SendingProgress;
  const factory PrinterState.printing() = _Printing; // للتوافق
  const factory PrinterState.cancelling() = _Cancelling;

  const factory PrinterState.error(String message) = _Error;
}
