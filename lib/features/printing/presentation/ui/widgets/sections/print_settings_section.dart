import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:invotek/features/printing/core/models/invoice_language.dart';
import 'package:invotek/features/printing/core/utils/paper_preset.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_cubit.dart';
import '../settings/print_settings_widget.dart';

/// Widget section لإعدادات الطباعة - يدير حالته الخاصة
class PrintSettingsSection extends StatefulWidget {
  const PrintSettingsSection({super.key});

  @override
  State<PrintSettingsSection> createState() => _PrintSettingsSectionState();
}

class _PrintSettingsSectionState extends State<PrintSettingsSection> {
  // Settings state
  PaperPreset _paperWidth = PaperPreset.mm80;
  int _sliceHeight = 400;
  InvoiceLanguage _invoiceLanguage = InvoiceLanguage.arabic;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final paperWidthStr = prefs.getString('printer_paper_width');
    final sliceHeight = prefs.getInt('printer_slice_height');
    final languageStr = prefs.getString('printer_invoice_language');

    if (paperWidthStr != null) {
      _paperWidth = PaperPreset.values.firstWhere(
        (e) => e.toString() == paperWidthStr,
        orElse: () => PaperPreset.mm80,
      );
    }
    if (sliceHeight != null) _sliceHeight = sliceHeight;

    if (languageStr != null) {
      _invoiceLanguage = InvoiceLanguage.values.firstWhere(
        (e) => e.toString() == languageStr,
        orElse: () => InvoiceLanguage.arabic,
      );
    }

    // تحديث الإعدادات في Cubit
    if (mounted) {
      context.read<PrinterCubit>().updateSettings(
        paperWidth: _paperWidth,
        sliceHeight: _sliceHeight,
        invoiceLanguage: _invoiceLanguage,
      );
    }

    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('printer_paper_width', _paperWidth.toString());
    await prefs.setInt('printer_slice_height', _sliceHeight);
    await prefs.setString(
      'printer_invoice_language',
      _invoiceLanguage.toString(),
    );
  }

  void _handlePaperWidthChanged(PaperPreset value) {
    setState(() => _paperWidth = value);
    context.read<PrinterCubit>().updateSettings(paperWidth: value);
    _saveSettings();
  }

  void _handleSliceHeightChanged(int value) {
    setState(() => _sliceHeight = value);
    context.read<PrinterCubit>().updateSettings(sliceHeight: value);
    _saveSettings();
  }

  void _handleLanguageChanged(InvoiceLanguage value) {
    setState(() => _invoiceLanguage = value);
    context.read<PrinterCubit>().updateSettings(invoiceLanguage: value);
    _saveSettings();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox.shrink(); // أو يمكن عرض loading indicator
    }

    return PrintSettingsWidget(
      paperWidth: _paperWidth,
      sliceHeight: _sliceHeight,
      invoiceLanguage: _invoiceLanguage,
      onPaperWidthChanged: _handlePaperWidthChanged,
      onSliceHeightChanged: _handleSliceHeightChanged,
      onLanguageChanged: _handleLanguageChanged,
    );
  }
}

