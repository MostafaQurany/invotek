import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/clients/demo/entit/client_model.dart';
import 'package:invotek/features/clients/ui/screens/edit_client_screen.dart';

class ClientDetailsScreen extends StatelessWidget {
  final Client client;

  const ClientDetailsScreen({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('تفاصيل العميل'),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        scrolledUnderElevation: 1,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: colorScheme.onSurface),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditClientScreenWithProvider(client: client),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            _buildHeaderCard(context),
            SizedBox(height: 24.h),

            // Basic Information Section
            _buildSectionTitle(context, 'المعلومات الأساسية'),
            SizedBox(height: 16.h),
            _buildInfoCard(context, [
              _buildInfoRow(context, 'الاسم', client.name, Icons.person),
              _buildInfoRow(
                context,
                'البريد الإلكتروني',
                client.email,
                Icons.email,
              ),
              if (client.phone != null)
                _buildInfoRow(
                  context,
                  'رقم الهاتف',
                  client.phone!,
                  Icons.phone,
                ),
              if (client.address != null)
                _buildInfoRow(
                  context,
                  'العنوان',
                  client.address!,
                  Icons.location_on,
                ),
            ]),
            SizedBox(height: 24.h),

            // Company Information Section
            _buildSectionTitle(context, 'معلومات الشركة'),
            SizedBox(height: 16.h),
            _buildInfoCard(context, [
              if (client.company != null)
                _buildInfoRow(
                  context,
                  'اسم الشركة',
                  client.company!,
                  Icons.business,
                ),
              if (client.taxNumber != null)
                _buildInfoRow(
                  context,
                  'الرقم الضريبي',
                  client.taxNumber!,
                  Icons.receipt,
                ),
              if (client.website != null)
                _buildInfoRow(
                  context,
                  'الموقع الإلكتروني',
                  client.website!,
                  Icons.web,
                ),
            ]),
            SizedBox(height: 24.h),

            // Contact Person Section
            _buildSectionTitle(context, 'معلومات شخص الاتصال'),
            SizedBox(height: 16.h),
            _buildInfoCard(context, [
              if (client.contactPerson != null)
                _buildInfoRow(
                  context,
                  'اسم شخص الاتصال',
                  client.contactPerson!,
                  Icons.contact_phone,
                ),
              if (client.contactPhone != null)
                _buildInfoRow(
                  context,
                  'هاتف شخص الاتصال',
                  client.contactPhone!,
                  Icons.phone_android,
                ),
              if (client.contactEmail != null)
                _buildInfoRow(
                  context,
                  'بريد شخص الاتصال',
                  client.contactEmail!,
                  Icons.email_outlined,
                ),
            ]),
            SizedBox(height: 24.h),

            // Additional Information Section
            _buildSectionTitle(context, 'معلومات إضافية'),
            SizedBox(height: 16.h),
            _buildInfoCard(context, [
              _buildInfoRow(
                context,
                'الحالة',
                client.status == 'active' ? 'نشط' : 'غير نشط',
                Icons.settings,
              ),
              _buildInfoRow(
                context,
                'تاريخ الإنشاء',
                _formatDate(client.createdAt),
                Icons.calendar_today,
              ),
              _buildInfoRow(
                context,
                'آخر تحديث',
                _formatDate(client.updatedAt),
                Icons.update,
              ),
              if (client.notes != null)
                _buildInfoRow(context, 'ملاحظات', client.notes!, Icons.note),
            ]),
            SizedBox(height: 32.h),

            // Action Buttons
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.primary, colorScheme.primary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 40.r,
            backgroundColor: colorScheme.surface,
            child: Text(
              client.name.substring(0, 1).toUpperCase(),
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: colorScheme.primary,
              ),
            ),
          ),
          SizedBox(width: 16.w),

          // Client Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  client.name,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  client.email,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: colorScheme.onPrimary.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: client.status == 'active'
                        ? colorScheme.primary
                        : colorScheme.error,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    client.status == 'active' ? 'نشط' : 'غير نشط',
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      title,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.primary,
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, List<Widget> children) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.outline.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorScheme.primary, size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        // Edit Button
        Expanded(
          child: FilledButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditClientScreenWithProvider(client: client),
                ),
              );
            },
            icon: Icon(Icons.edit),
            label: const Text('تعديل'),
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),

        // Delete Button
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              _showDeleteConfirmation(context);
            },
            icon: Icon(Icons.delete, color: colorScheme.error),
            label: Text('حذف', style: TextStyle(color: colorScheme.error)),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: colorScheme.error),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: Text('هل أنت متأكد من حذف العميل "${client.name}"؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Delete client
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: colorScheme.error),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}
