import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/domain/entit/expense_category_model.dart';
import 'package:invotek/features/expenses/ui/widgets/cards/form_card_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/modern_form_field_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/modern_date_field_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/modern_category_field_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/modern_payment_method_field_widget.dart';
import 'package:invotek/generated/l10n.dart';

class AddExpenseFormSection extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController amountController;
  final TextEditingController referenceNumberController;
  final TextEditingController notesController;
  final ExpenseCategoryModel? selectedCategory;
  final String selectedPaymentMethod;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final Function(ExpenseCategoryModel?) onCategoryChanged;
  final Function(String) onPaymentMethodChanged;

  const AddExpenseFormSection({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.amountController,
    required this.referenceNumberController,
    required this.notesController,
    required this.selectedCategory,
    required this.selectedPaymentMethod,
    required this.selectedDate,
    required this.onDateSelected,
    required this.onCategoryChanged,
    required this.onPaymentMethodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            // Basic Information Card
            FormCardWidget(
              title: S.of(context).basicInformation,
              icon: Icons.info_outline,
              children: [
                ModernFormFieldWidget(
                  controller: titleController,
                  label: S.of(context).expenseTitle,
                  hint: S.of(context).expenseTitleHint,
                  icon: Icons.title,
                  required: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).titleIsRequired;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                ModernFormFieldWidget(
                  controller: descriptionController,
                  label: S.of(context).description,
                  hint: S.of(context).descriptionHint,
                  icon: Icons.description_outlined,
                  maxLines: 3,
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // Financial Information Card
            FormCardWidget(
              title: S.of(context).financialDetails,
              icon: Icons.account_balance_wallet_outlined,
              children: [
                ModernFormFieldWidget(
                  controller: amountController,
                  label: S.of(context).amount,
                  hint: S.of(context).amountHint,
                  icon: Icons.attach_money,
                  required: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  helperText: S.of(context).amountHelperText,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).amountIsRequired;
                    }
                    final amount = double.tryParse(value);
                    if (amount == null || amount <= 0) {
                      return S.of(context).pleaseEnterValidAmount;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                ModernDateFieldWidget(
                  selectedDate: selectedDate,
                  onTap: () => onDateSelected(selectedDate),
                  required: true,
                ),
                SizedBox(height: 16.h),
                ModernCategoryFieldWidget(
                  selectedCategory: selectedCategory,
                  onChanged: onCategoryChanged,
                  required: true,
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // Additional Information Card
            FormCardWidget(
              title: S.of(context).additionalInformation,
              icon: Icons.more_horiz,
              children: [
                ModernPaymentMethodFieldWidget(
                  selectedPaymentMethod: selectedPaymentMethod,
                  onChanged: onPaymentMethodChanged,
                ),
                SizedBox(height: 16.h),
                ModernFormFieldWidget(
                  controller: referenceNumberController,
                  label: S.of(context).referenceNumber,
                  hint: S.of(context).referenceNumberHint,
                  icon: Icons.confirmation_number_outlined,
                ),
                SizedBox(height: 16.h),
                ModernFormFieldWidget(
                  controller: notesController,
                  label: S.of(context).notes,
                  hint: S.of(context).notesHint,
                  icon: Icons.note_outlined,
                  maxLines: 3,
                ),
              ],
            ),

            SizedBox(height: 28.h),
          ],
        ),
      ),
    );
  }
}
