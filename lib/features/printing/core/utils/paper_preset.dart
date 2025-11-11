enum PaperPreset { mm58, mm80, mm80Wide }

extension PaperPresetExtension on PaperPreset {
  /// الحصول على عرض الورق بالبكسل
  /// Get paper width in pixels
  int get width {
    switch (this) {
      case PaperPreset.mm58:
        return 384;
      case PaperPreset.mm80:
        return 576;
      case PaperPreset.mm80Wide:
        return 712;
    }
  }

  /// الحصول على اسم الورق
  /// Get paper name
  String get name {
    switch (this) {
      case PaperPreset.mm58:
        return '58mm (384px)';
      case PaperPreset.mm80:
        return '80mm (576px)';
      case PaperPreset.mm80Wide:
        return '80mm Wide (712px)';
    }
  }

  /// تحديد حجم الخط بناءً على عرض الورق
  /// Get font size based on paper width
  double get fontSize {
    if (width <= 384) return 18; // 58mm
    if (width <= 576) return 20; // 80mm
    return 22; // 80mm wide (712px)
  }
}

