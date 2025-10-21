class PrintSettingsModel {
  final String? printerName;
  final String? printerIp;
  final int printerPort;
  final String paperSize;
  final String printQuality;
  final bool isThermalPrinter;
  final String connectionType; // bluetooth, usb, network
  final String? bluetoothAddress;
  final String? usbVendorId;
  final String? usbProductId;
  final bool autoConnect;
  final int timeoutSeconds;
  final bool enableTestPrint;

  PrintSettingsModel({
    this.printerName,
    this.printerIp,
    this.printerPort = 9100,
    this.paperSize = '80mm',
    this.printQuality = 'high',
    this.isThermalPrinter = true,
    this.connectionType = 'network',
    this.bluetoothAddress,
    this.usbVendorId,
    this.usbProductId,
    this.autoConnect = false,
    this.timeoutSeconds = 10,
    this.enableTestPrint = true,
  });

  factory PrintSettingsModel.fromJson(Map<String, dynamic> json) {
    return PrintSettingsModel(
      printerName: json['printerName'],
      printerIp: json['printerIp'],
      printerPort: json['printerPort'] ?? 9100,
      paperSize: json['paperSize'] ?? '80mm',
      printQuality: json['printQuality'] ?? 'medium',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'printerName': printerName,
      'printerIp': printerIp,
      'printerPort': printerPort,
      'paperSize': paperSize,
      'printQuality': printQuality,
    };
  }

  PrintSettingsModel copyWith({
    String? printerName,
    String? printerIp,
    int? printerPort,
    String? paperSize,
    String? printQuality,
    bool? isThermalPrinter,
    String? connectionType,
    String? bluetoothAddress,
    String? usbVendorId,
    String? usbProductId,
    bool? autoConnect,
    int? timeoutSeconds,
    bool? enableTestPrint,
  }) {
    return PrintSettingsModel(
      printerName: printerName ?? this.printerName,
      printerIp: printerIp ?? this.printerIp,
      printerPort: printerPort ?? this.printerPort,
      paperSize: paperSize ?? this.paperSize,
      printQuality: printQuality ?? this.printQuality,
      isThermalPrinter: isThermalPrinter ?? this.isThermalPrinter,
      connectionType: connectionType ?? this.connectionType,
      bluetoothAddress: bluetoothAddress ?? this.bluetoothAddress,
      usbVendorId: usbVendorId ?? this.usbVendorId,
      usbProductId: usbProductId ?? this.usbProductId,
      autoConnect: autoConnect ?? this.autoConnect,
      timeoutSeconds: timeoutSeconds ?? this.timeoutSeconds,
      enableTestPrint: enableTestPrint ?? this.enableTestPrint,
    );
  }

  /// التحقق من صحة الإعدادات
  bool get isValid {
    if (connectionType == 'network') {
      return printerIp != null && printerIp!.isNotEmpty;
    } else if (connectionType == 'bluetooth') {
      return bluetoothAddress != null && bluetoothAddress!.isNotEmpty;
    } else if (connectionType == 'usb') {
      return usbVendorId != null && usbProductId != null;
    }
    return false;
  }

  /// الحصول على عنوان الطابعة
  String? get printerAddress {
    switch (connectionType) {
      case 'network':
        return printerIp;
      case 'bluetooth':
        return bluetoothAddress;
      case 'usb':
        return '$usbVendorId:$usbProductId';
      default:
        return null;
    }
  }

  /// الحصول على اسم الطابعة للعرض
  String get displayName {
    if (printerName != null && printerName!.isNotEmpty) {
      return printerName!;
    }

    switch (connectionType) {
      case 'network':
        return 'طابعة شبكة (${printerIp ?? 'غير محدد'})';
      case 'bluetooth':
        return 'طابعة بلوتوث (${bluetoothAddress ?? 'غير محدد'})';
      case 'usb':
        return 'طابعة USB (${usbVendorId ?? 'غير محدد'})';
      default:
        return 'طابعة غير محددة';
    }
  }

  @override
  String toString() {
    return 'PrintSettingsModel('
        'printerName: $printerName, '
        'printerIp: $printerIp, '
        'printerPort: $printerPort, '
        'paperSize: $paperSize, '
        'printQuality: $printQuality, '
        'isThermalPrinter: $isThermalPrinter, '
        'connectionType: $connectionType, '
        'bluetoothAddress: $bluetoothAddress, '
        'usbVendorId: $usbVendorId, '
        'usbProductId: $usbProductId, '
        'autoConnect: $autoConnect, '
        'timeoutSeconds: $timeoutSeconds, '
        'enableTestPrint: $enableTestPrint'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PrintSettingsModel &&
        other.printerName == printerName &&
        other.printerIp == printerIp &&
        other.printerPort == printerPort &&
        other.paperSize == paperSize &&
        other.printQuality == printQuality &&
        other.isThermalPrinter == isThermalPrinter &&
        other.connectionType == connectionType &&
        other.bluetoothAddress == bluetoothAddress &&
        other.usbVendorId == usbVendorId &&
        other.usbProductId == usbProductId &&
        other.autoConnect == autoConnect &&
        other.timeoutSeconds == timeoutSeconds &&
        other.enableTestPrint == enableTestPrint;
  }

  @override
  int get hashCode {
    return Object.hash(
      printerName,
      printerIp,
      printerPort,
      paperSize,
      printQuality,
      isThermalPrinter,
      connectionType,
      bluetoothAddress,
      usbVendorId,
      usbProductId,
      autoConnect,
      timeoutSeconds,
      enableTestPrint,
    );
  }
}


