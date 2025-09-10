import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/products/ui/widgets/forms/custom_text_field.dart';
import 'package:invotek/features/products/ui/widgets/forms/form_section_card.dart';
import 'package:invotek/features/products/ui/widgets/forms/category_dropdown.dart';
import 'package:invotek/features/products/ui/widgets/forms/status_dropdown.dart';
import 'package:invotek/generated/l10n.dart';

class BasicInfoTab extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final String? selectedCategoryId;
  final String selectedStatus;
  final ValueChanged<String?> onCategoryChanged;
  final ValueChanged<String?> onStatusChanged;
  final Map<String, String> validationErrors;

  const BasicInfoTab({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.selectedCategoryId,
    required this.selectedStatus,
    required this.onCategoryChanged,
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
          // Basic Information Card
          FormSectionCard(
            title: s.basicInformation,
            icon: Icons.inventory_2_outlined,
            children: [
              // Product Name
              CustomTextField(
                controller: nameController,
                label: s.name,
                hint: 'Enter product name',
                icon: Icons.inventory_2,
                isRequired: true,
                errorText: validationErrors['name'],
              ),
              SizedBox(height: 16.h),

              // Description
              CustomTextField(
                controller: descriptionController,
                label: s.description,
                hint: 'Enter product description',
                icon: Icons.description_outlined,
                maxLines: 3,
              ),
              SizedBox(height: 16.h),

              // Category and Status Row
              Row(
                children: [
                  Expanded(
                    child: CategoryDropdown(
                      selectedCategoryId: selectedCategoryId,
                      onChanged: onCategoryChanged,
                      colorScheme: Theme.of(context).colorScheme,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: StatusDropdown(
                      selectedStatus: selectedStatus,
                      onChanged: onStatusChanged,
                      errorText: validationErrors['status'],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
