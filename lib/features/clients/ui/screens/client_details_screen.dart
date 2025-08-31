import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/clients/demo/entit/client_model.dart';
import 'package:invotek/features/clients/ui/screens/edit_client_screen.dart';

class ClientDetailsScreen extends StatelessWidget {
  final Client client;

  const ClientDetailsScreen({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل العميل'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
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
            _buildHeaderCard(),
            SizedBox(height: 24.h),

            // Basic Information Section
            _buildSectionTitle('المعلومات الأساسية'),
            SizedBox(height: 16.h),
            _buildInfoCard([
              _buildInfoRow('الاسم', client.name, Icons.person),
              _buildInfoRow('البريد الإلكتروني', client.email, Icons.email),
              if (client.phone != null)
                _buildInfoRow('رقم الهاتف', client.phone!, Icons.phone),
              if (client.address != null)
                _buildInfoRow('العنوان', client.address!, Icons.location_on),
            ]),
            SizedBox(height: 24.h),

            // Company Information Section
            _buildSectionTitle('معلومات الشركة'),
            SizedBox(height: 16.h),
            _buildInfoCard([
              if (client.company != null)
                _buildInfoRow('اسم الشركة', client.company!, Icons.business),
              if (client.taxNumber != null)
                _buildInfoRow(
                  'الرقم الضريبي',
                  client.taxNumber!,
                  Icons.receipt,
                ),
              if (client.website != null)
                _buildInfoRow('الموقع الإلكتروني', client.website!, Icons.web),
            ]),
            SizedBox(height: 24.h),

            // Contact Person Section
            _buildSectionTitle('معلومات شخص الاتصال'),
            SizedBox(height: 16.h),
            _buildInfoCard([
              if (client.contactPerson != null)
                _buildInfoRow(
                  'اسم شخص الاتصال',
                  client.contactPerson!,
                  Icons.contact_phone,
                ),
              if (client.contactPhone != null)
                _buildInfoRow(
                  'هاتف شخص الاتصال',
                  client.contactPhone!,
                  Icons.phone_android,
                ),
              if (client.contactEmail != null)
                _buildInfoRow(
                  'بريد شخص الاتصال',
                  client.contactEmail!,
                  Icons.email_outlined,
                ),
            ]),
            SizedBox(height: 24.h),

            // Additional Information Section
            _buildSectionTitle('معلومات إضافية'),
            SizedBox(height: 16.h),
            _buildInfoCard([
              _buildInfoRow(
                'الحالة',
                client.status == 'active' ? 'نشط' : 'غير نشط',
                Icons.settings,
              ),
              _buildInfoRow(
                'تاريخ الإنشاء',
                _formatDate(client.createdAt),
                Icons.calendar_today,
              ),
              _buildInfoRow(
                'آخر تحديث',
                _formatDate(client.updatedAt),
                Icons.update,
              ),
              if (client.notes != null)
                _buildInfoRow('ملاحظات', client.notes!, Icons.note),
            ]),
            SizedBox(height: 32.h),

            // Action Buttons
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
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
            backgroundColor: Colors.white,
            child: Text(
              client.name.substring(0, 1).toUpperCase(),
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
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
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  client.email,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white.withOpacity(0.9),
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
                        ? Colors.green
                        : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    client.status == 'active' ? 'نشط' : 'غير نشط',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black87,
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
    return Row(
      children: [
        // Edit Button
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditClientScreenWithProvider(client: client),
                ),
              );
            },
            icon: const Icon(Icons.edit),
            label: const Text('تعديل'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
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
            icon: const Icon(Icons.delete, color: Colors.red),
            label: const Text('حذف', style: TextStyle(color: Colors.red)),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
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
            style: TextButton.styleFrom(foregroundColor: Colors.red),
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
