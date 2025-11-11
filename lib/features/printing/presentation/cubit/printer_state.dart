import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'printer_state.freezed.dart';

@freezed
class PrinterState with _$PrinterState {
  const factory PrinterState.initial() = _Initial;

  const factory PrinterState.connected(BluetoothDevice device) = _Connected;

  const factory PrinterState.disconnected() = _Disconnected;

  const factory PrinterState.scanning(List<BluetoothDevice> devices) =
      _Scanning;

  const factory PrinterState.printing() = _Printing;

  const factory PrinterState.error(String message) = _Error;
}
