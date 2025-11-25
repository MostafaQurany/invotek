import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutContactScreen extends StatefulWidget {
  const AboutContactScreen({super.key});

  @override
  State<AboutContactScreen> createState() => _AboutContactScreenState();
}

class _AboutContactScreenState extends State<AboutContactScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  PackageInfo? _packageInfo;
  bool _isLoading = true;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadPackageInfo();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _loadPackageInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _packageInfo = packageInfo;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _sendEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final email = 'support@invotik.com';
      final subject = _subjectController.text.trim();
      final body = '''
Name: ${_nameController.text.trim()}
Email: ${_emailController.text.trim()}

Message:
${_messageController.text.trim()}
''';

      final uri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {
          'subject': subject,
          'body': body,
        },
      );

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).emailOpened),
              backgroundColor: AppColors.success,
            ),
          );
          _nameController.clear();
          _emailController.clear();
          _subjectController.clear();
          _messageController.clear();
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).cannotOpenEmail),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).errorOccurred),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _openPhone() async {
    try {
      final phone = 'tel:+962XXXXXXXXX';
      final uri = Uri.parse(phone);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).cannotOpenPhone),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).errorOccurred),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _openWhatsApp() async {
    try {
      final phone = '962XXXXXXXXX';
      final uri = Uri.parse('https://wa.me/$phone');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).cannotOpenWhatsApp),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).errorOccurred),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primary,
            size: 24.sp,
          ),
        ),
        title: Text(
          S.of(context).aboutUs,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.primary,
          tabs: [
            Tab(text: S.of(context).aboutUs),
            Tab(text: S.of(context).contactUs),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAboutTab(),
          _buildContactTab(),
        ],
      ),
    );
  }

  Widget _buildAboutTab() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        // App Logo/Icon Card
        SettingsCard(
          child: Column(
            children: [
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(16.w),
                child: CircleAvatar(
                  child: Image.asset(
                    AppImages.logoGreenSold,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Invotek',
                style: AppTextTheme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                S.of(context).aboutUsDescription,
                style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        // App Information Card
        SettingsCard(
          title: S.of(context).appInformation,
          showDivider: true,
          child: Column(
            children: [
              _buildInfoRow(S.of(context).appName, 'Invotek'),
              SizedBox(height: 12.h),
              _buildInfoRow(
                S.of(context).version,
                _packageInfo?.version ?? '1.0.0',
              ),
              SizedBox(height: 12.h),
              _buildInfoRow(
                S.of(context).buildNumber,
                _packageInfo?.buildNumber ?? '-',
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        // Company Information Card
        SettingsCard(
          title: S.of(context).companyInformation,
          showDivider: true,
          child: Column(
            children: [
              _buildInfoRow(S.of(context).companyName, 'Invotek'),
              SizedBox(height: 12.h),
              _buildInfoRow(
                S.of(context).copyright,
                '© ${DateTime.now().year} Invotek. All rights reserved.',
              ),
            ],
          ),
        ),

        SizedBox(height: 32.h),
      ],
    );
  }

  Widget _buildContactTab() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          // Contact Form Card
          SettingsCard(
            title: S.of(context).contactForm,
            showDivider: true,
            child: Column(
              children: [
                EditableField(
                  label: S.of(context).name,
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).nameRequired;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                EditableField(
                  label: S.of(context).email,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).emailRequired;
                    }
                    if (!value.contains('@')) {
                      return S.of(context).emailInvalid;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                EditableField(
                  label: S.of(context).subject,
                  controller: _subjectController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).subjectRequired;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                EditableField(
                  label: S.of(context).message,
                  controller: _messageController,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).messageRequired;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.h),
                ActionButton(
                  text: S.of(context).sendMessage,
                  variant: ActionButtonVariant.primary,
                  isLoading: _isSubmitting,
                  onPressed: _isSubmitting ? null : _sendEmail,
                  fullWidth: true,
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          // Quick Contact Card
          SettingsCard(
            title: S.of(context).quickContact,
            showDivider: true,
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.email,
                  title: S.of(context).email,
                  subtitle: 'support@invotik.com',
                  onTap: () async {
                    final uri = Uri.parse('mailto:support@invotik.com');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                ),
                Divider(height: 1, color: AppColors.border, indent: 56.w),
                SettingsTile(
                  icon: Icons.phone,
                  title: S.of(context).phone,
                  subtitle: '+962 XXXXXXXXX',
                  onTap: _openPhone,
                ),
                Divider(height: 1, color: AppColors.border, indent: 56.w),
                SettingsTile(
                  icon: Icons.chat,
                  title: S.of(context).whatsapp,
                  subtitle: S.of(context).contactViaWhatsApp,
                  onTap: _openWhatsApp,
                ),
              ],
            ),
          ),

          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

