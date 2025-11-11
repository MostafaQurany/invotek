import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/utils/date_formatter.dart';
import 'package:invotek/features/clients/demo/entit/client_model.dart';
import 'package:invotek/features/clients/ui/screens/edit_client_screen.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/features/clients/constants/clients_permissions.dart';
import 'package:invotek/core/utils/permission_helper.dart';

class ClientDetailsScreen extends StatelessWidget {
  final Client client;

  const ClientDetailsScreen({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);
    final hasViewPermission = PermissionChecker.hasPermission(
      context,
      ClientsPermissions.view,
    );

    if (!hasViewPermission) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(s.clientsDetails),
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 64.sp,
                  color: colorScheme.error,
                ),
                SizedBox(height: 24.h),
                Text(
                  s.clientsNoPermissionToView,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  s.clientsNoPermissionToAct,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    final hasEditPermission = PermissionChecker.hasPermission(
      context,
      ClientsPermissions.edit,
    );
    final hasDeletePermission = PermissionChecker.hasPermission(
      context,
      ClientsPermissions.delete,
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(s.clientsDetails),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        scrolledUnderElevation: 1,
        elevation: 0,
        actions: [
          PermissionWidget(
            permission: ClientsPermissions.edit,
            fallback: const SizedBox.shrink(),
            child: IconButton(
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
              tooltip: hasEditPermission
                  ? null
                  : s.clientsNoPermissionToAct,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            _buildHeaderCard(context, s),
            SizedBox(height: 24.h),

            // Basic Information Section
            _buildSectionTitle(context, s.clientsBasicInfo),
            SizedBox(height: 16.h),
            _buildInfoCard(context, s, [
              _buildInfoRow(context, s.clientsName, client.name, Icons.person),
              _buildInfoRow(
                context,
                s.clientsEmail,
                client.email,
                Icons.email,
              ),
              if (client.phone != null)
                _buildInfoRow(
                  context,
                  s.clientsPhone,
                  client.phone!,
                  Icons.phone,
                ),
              if (client.address != null)
                _buildInfoRow(
                  context,
                  s.clientsAddress,
                  client.address!,
                  Icons.location_on,
                ),
            ]),
            SizedBox(height: 24.h),

            // Company Information Section
            _buildSectionTitle(context, s.clientsCompanyInfo),
            SizedBox(height: 16.h),
            _buildInfoCard(context, s, [
              if (client.company != null)
                _buildInfoRow(
                  context,
                  s.clientsCompanyName,
                  client.company!,
                  Icons.business,
                ),
              if (client.taxNumber != null)
                _buildInfoRow(
                  context,
                  s.clientsTaxNumber,
                  client.taxNumber!,
                  Icons.receipt,
                ),
              if (client.website != null)
                _buildInfoRow(
                  context,
                  s.clientsWebsite,
                  client.website!,
                  Icons.web,
                ),
            ]),
            SizedBox(height: 24.h),

            // Contact Person Section
            _buildSectionTitle(context, s.clientsContactPersonInfo),
            SizedBox(height: 16.h),
            _buildInfoCard(context, s, [
              if (client.contactPerson != null)
                _buildInfoRow(
                  context,
                  s.clientsContactPersonName,
                  client.contactPerson!,
                  Icons.contact_phone,
                ),
              if (client.contactPhone != null)
                _buildInfoRow(
                  context,
                  s.clientsContactPersonPhone,
                  client.contactPhone!,
                  Icons.phone_android,
                ),
              if (client.contactEmail != null)
                _buildInfoRow(
                  context,
                  s.clientsContactPersonEmail,
                  client.contactEmail!,
                  Icons.email_outlined,
                ),
            ]),
            SizedBox(height: 24.h),

            // Additional Information Section
            _buildSectionTitle(context, s.clientsAdditionalInfo),
            SizedBox(height: 16.h),
            _buildInfoCard(context, s, [
              _buildInfoRow(
                context,
                s.clientsStatus,
                client.status == 'active' ? s.clientsActive : s.clientsInactive,
                Icons.settings,
              ),
              _buildInfoRow(
                context,
                s.clientsCreatedAt,
                _formatDate(client.createdAt),
                Icons.calendar_today,
              ),
              _buildInfoRow(
                context,
                s.clientsUpdatedAt,
                _formatDate(client.updatedAt),
                Icons.update,
              ),
              if (client.notes != null)
                _buildInfoRow(context, s.clientsNotes, client.notes!, Icons.note),
            ]),
            SizedBox(height: 32.h),

            // Action Buttons
            _buildActionButtons(context, s),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, S s) {
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
                    client.status == 'active' 
                        ? s.clientsActive 
                        : s.clientsInactive,
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

  Widget _buildInfoCard(BuildContext context, S s, List<Widget> children) {
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

  Widget _buildActionButtons(BuildContext context, S s) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasEditPermission = PermissionChecker.hasPermission(
      context,
      ClientsPermissions.edit,
    );
    final hasDeletePermission = PermissionChecker.hasPermission(
      context,
      ClientsPermissions.delete,
    );

    return Row(
      children: [
        // Edit Button
        Expanded(
          child: PermissionWidget(
            permission: ClientsPermissions.edit,
            fallback: FilledButton.icon(
              onPressed: null,
              icon: Icon(Icons.lock),
              label: Text(s.clientsEditAction),
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
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
              label: Text(s.clientsEditAction),
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),

        // Delete Button
        Expanded(
          child: PermissionWidget(
            permission: ClientsPermissions.delete,
            fallback: OutlinedButton.icon(
              onPressed: null,
              icon: Icon(Icons.lock, color: colorScheme.error),
              label: Text(s.clientsDelete, 
                  style: TextStyle(color: colorScheme.error)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: colorScheme.error),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            child: OutlinedButton.icon(
              onPressed: () {
                _showDeleteConfirmation(context);
              },
              icon: Icon(Icons.delete, color: colorScheme.error),
              label: Text(s.clientsDelete, 
                  style: TextStyle(color: colorScheme.error)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: colorScheme.error),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(s.clientsDeleteConfirmation),
        content: Text(s.clientsDeleteConfirmationMessage(client.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(s.clientsCancel),
          ),
          TextButton(
            onPressed: () {
              // TODO: Delete client
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: colorScheme.error),
            child: Text(s.clientsDelete),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    return DateFormatter.apiStringToDisplayFormat(dateString) ?? dateString;
  }
}
