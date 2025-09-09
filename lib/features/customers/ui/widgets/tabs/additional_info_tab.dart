import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/customers/ui/widgets/forms/custom_text_field.dart';
import 'package:invotek/features/customers/ui/widgets/forms/form_section_card.dart';
import 'package:invotek/features/customers/ui/widgets/forms/status_dropdown.dart';
import 'package:invotek/generated/l10n.dart';

class AdditionalInfoTab extends StatelessWidget {
  final TextEditingController responsiblePersonController;
  final TextEditingController notesController;
  final String selectedStatus;
  final ValueChanged<String?> onStatusChanged;
  final Map<String, String> validationErrors;

  const AdditionalInfoTab({
    super.key,
    required this.responsiblePersonController,
    required this.notesController,
    required this.selectedStatus,
    required this.onStatusChanged,
    this.validationErrors = const {},
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Additional Information Card
          FormSectionCard(
            title: s.customerAdditionalInfo,
            icon: Icons.info_outline,
            children: [
              // Status
              StatusDropdown(
                selectedStatus: selectedStatus,
                onChanged: onStatusChanged,
                errorText: validationErrors['status'],
              ),
              SizedBox(height: 16.h),

              // Responsible Person
              CustomTextField(
                controller: responsiblePersonController,
                label: s.customerResponsiblePerson,
                hint: 'Enter responsible person',
                icon: Icons.person_pin_outlined,
              ),
              SizedBox(height: 16.h),

              // Notes
              CustomTextField(
                controller: notesController,
                label: s.customerNotes,
                hint: 'Enter notes',
                icon: Icons.note_outlined,
                maxLines: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
