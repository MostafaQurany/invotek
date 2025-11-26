import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_section_header.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceFormReturnReasonSection extends StatelessWidget {
  final TextEditingController returnReasonController;
  final VoidCallback? onChanged;

  const InvoiceFormReturnReasonSection({
    super.key,
    required this.returnReasonController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InvoiceFormSectionHeader(title: s.returnReason),
        SizedBox(height: 12.h),
        TextField(
          controller: returnReasonController,
          decoration: InputDecoration(
            labelText: s.returnReason,
            hintText: s.enterReasonForReturn,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          maxLines: 3,
          onChanged: (_) => onChanged?.call(),
        ),
      ],
    );
  }
}

