import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/printing/core/models/invoice_language.dart';
import 'package:invotek/generated/l10n.dart';

class LanguageSelector extends StatelessWidget {
  final InvoiceLanguage value;
  final ValueChanged<InvoiceLanguage> onChanged;

  const LanguageSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).invoiceLanguage,
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
        SizedBox(height: 8.h),
        DropdownButton<InvoiceLanguage>(
          value: value,
          isExpanded: true,
          items: InvoiceLanguage.values.map((lang) {
            return DropdownMenuItem(
              value: lang,
              child: Text(lang.name),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
        ),
      ],
    );
  }
}

