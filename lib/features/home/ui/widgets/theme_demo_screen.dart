import 'package:flutter/material.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/screen_utils.dart';
import 'package:invotek/core/widgets/theme_aware_widgets.dart';

class ThemeDemoScreen extends StatefulWidget {
  const ThemeDemoScreen({super.key});

  @override
  State<ThemeDemoScreen> createState() => _ThemeDemoScreenState();
}

class _ThemeDemoScreenState extends State<ThemeDemoScreen> {
  final TextEditingController _textController = TextEditingController();
  bool _isDarkMode = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode
          ? Theme.of(context).copyWith(brightness: Brightness.dark)
          : Theme.of(context).copyWith(brightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          title: ThemeAwareText(
            'تجربة الثيمات',
            style: AppTextTheme.getTextTheme(
              _isDarkMode ? Brightness.dark : Brightness.light,
            ).titleLarge,
          ),
          actions: [
            ThemeAwareIcon(
              _isDarkMode ? Icons.light_mode : Icons.dark_mode,
              onPressed: _toggleTheme,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: ScreenUtils.responsivePadding(
            all: ScreenUtils.paddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Theme Info Card
              ThemeAwareCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ThemeAwareText(
                      'معلومات الثيم',
                      style: AppTextTheme.getTextTheme(
                        _isDarkMode ? Brightness.dark : Brightness.light,
                      ).headlineMedium,
                    ),
                    SizedBox(height: ScreenUtils.paddingSmall),
                    ThemeAwareText(
                      'النوع: ${_isDarkMode ? 'داكن' : 'فاتح'}',
                      style: AppTextTheme.getTextTheme(
                        _isDarkMode ? Brightness.dark : Brightness.light,
                      ).bodyMedium,
                    ),
                    ThemeAwareText(
                      'أبعاد الشاشة: ${ScreenUtils.screenWidth.toStringAsFixed(0)} × ${ScreenUtils.screenHeight.toStringAsFixed(0)}',
                      style: AppTextTheme.getTextTheme(
                        _isDarkMode ? Brightness.dark : Brightness.light,
                      ).bodyMedium,
                    ),
                    ThemeAwareText(
                      'نوع الجهاز: ${ScreenUtils.isTablet ? 'تابلت' : 'هاتف'}',
                      style: AppTextTheme.getTextTheme(
                        _isDarkMode ? Brightness.dark : Brightness.light,
                      ).bodyMedium,
                    ),
                  ],
                ),
              ),

              SizedBox(height: ScreenUtils.paddingLarge),

              // Text Styles Demo
              ThemeAwareText(
                'أنماط النصوص',
                style: AppTextTheme.getTextTheme(
                  _isDarkMode ? Brightness.dark : Brightness.light,
                ).headlineLarge,
              ),
              SizedBox(height: ScreenUtils.paddingMedium),

              ThemeAwareCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ThemeAwareText(
                      'عنوان رئيسي',
                      style: AppTextTheme.getTextTheme(
                        _isDarkMode ? Brightness.dark : Brightness.light,
                      ).headlineLarge,
                    ),
                    SizedBox(height: ScreenUtils.paddingSmall),
                    ThemeAwareText(
                      'عنوان فرعي',
                      style: AppTextTheme.getTextTheme(
                        _isDarkMode ? Brightness.dark : Brightness.light,
                      ).headlineMedium,
                    ),
                    SizedBox(height: ScreenUtils.paddingSmall),
                    ThemeAwareText(
                      'نص عادي',
                      style: AppTextTheme.getTextTheme(
                        _isDarkMode ? Brightness.dark : Brightness.light,
                      ).bodyMedium,
                    ),
                    SizedBox(height: ScreenUtils.paddingSmall),
                    ThemeAwareText(
                      'نص صغير',
                      style: AppTextTheme.getTextTheme(
                        _isDarkMode ? Brightness.dark : Brightness.light,
                      ).bodySmall,
                    ),
                    SizedBox(height: ScreenUtils.paddingSmall),
                    ThemeAwareText('رابط', style: AppTextTheme.linkText),
                    SizedBox(height: ScreenUtils.paddingSmall),
                    ThemeAwareText('نص خطأ', style: AppTextTheme.errorText),
                    SizedBox(height: ScreenUtils.paddingSmall),
                    ThemeAwareText('نص نجاح', style: AppTextTheme.successText),
                  ],
                ),
              ),

              SizedBox(height: ScreenUtils.paddingLarge),

              // Buttons Demo
              ThemeAwareText(
                'الأزرار',
                style: AppTextTheme.getTextTheme(
                  _isDarkMode ? Brightness.dark : Brightness.light,
                ).headlineLarge,
              ),
              SizedBox(height: ScreenUtils.paddingMedium),

              ThemeAwareButton(
                text: 'زر عادي',
                icon: Icons.check,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تم الضغط على الزر العادي')),
                  );
                },
              ),

              SizedBox(height: ScreenUtils.paddingSmall),

              ThemeAwareButton(
                text: 'زر مخطط',
                icon: Icons.info,
                isOutlined: true,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تم الضغط على الزر المخطط')),
                  );
                },
              ),

              SizedBox(height: ScreenUtils.paddingSmall),

              ThemeAwareButton(
                text: 'زر تحميل',
                isLoading: true,
                onPressed: null,
              ),

              SizedBox(height: ScreenUtils.paddingLarge),

              // Text Fields Demo
              ThemeAwareText(
                'حقول الإدخال',
                style: AppTextTheme.getTextTheme(
                  _isDarkMode ? Brightness.dark : Brightness.light,
                ).headlineLarge,
              ),
              SizedBox(height: ScreenUtils.paddingMedium),

              ThemeAwareTextField(
                labelText: 'اسم المستخدم',
                hintText: 'أدخل اسم المستخدم',
                controller: _textController,
                prefixIcon: Icon(Icons.person),
              ),

              SizedBox(height: ScreenUtils.paddingSmall),

              ThemeAwareTextField(
                labelText: 'كلمة المرور',
                hintText: 'أدخل كلمة المرور',
                obscureText: true,
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
              ),

              SizedBox(height: ScreenUtils.paddingSmall),

              ThemeAwareTextField(
                labelText: 'البريد الإلكتروني',
                hintText: 'أدخل البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email),
              ),

              SizedBox(height: ScreenUtils.paddingLarge),

              // Cards Demo
              ThemeAwareText(
                'البطاقات',
                style: AppTextTheme.getTextTheme(
                  _isDarkMode ? Brightness.dark : Brightness.light,
                ).headlineLarge,
              ),
              SizedBox(height: ScreenUtils.paddingMedium),

              ThemeAwareCard(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تم الضغط على البطاقة')),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ThemeAwareIcon(Icons.star, color: Colors.amber),
                        SizedBox(width: ScreenUtils.paddingSmall),
                        Expanded(
                          child: ThemeAwareText(
                            'بطاقة تفاعلية',
                            style: AppTextTheme.getTextTheme(
                              _isDarkMode ? Brightness.dark : Brightness.light,
                            ).titleLarge,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtils.paddingSmall),
                    ThemeAwareText(
                      'هذه بطاقة تفاعلية يمكن الضغط عليها',
                      style: AppTextTheme.getTextTheme(
                        _isDarkMode ? Brightness.dark : Brightness.light,
                      ).bodyMedium,
                    ),
                  ],
                ),
              ),

              SizedBox(height: ScreenUtils.paddingSmall),

              ThemeAwareCard(
                isLoading: true,
                child: SizedBox(
                  height: ScreenUtils.buttonHeightMedium,
                  child: Center(
                    child: ThemeAwareText(
                      'بطاقة تحميل',
                      style: AppTextTheme.getTextTheme(
                        _isDarkMode ? Brightness.dark : Brightness.light,
                      ).bodyMedium,
                    ),
                  ),
                ),
              ),

              SizedBox(height: ScreenUtils.paddingLarge),

              // Responsive Text Demo
              ThemeAwareText(
                'النصوص المتجاوبة',
                style: AppTextTheme.getTextTheme(
                  _isDarkMode ? Brightness.dark : Brightness.light,
                ).headlineLarge,
              ),
              SizedBox(height: ScreenUtils.paddingMedium),

              ThemeAwareCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ThemeAwareText(
                      'نص متجاوب صغير',
                      style: AppTextTheme.responsiveTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: _isDarkMode
                            ? AppColors.white
                            : AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: ScreenUtils.paddingSmall),
                    ThemeAwareText(
                      'نص متجاوب متوسط',
                      style: AppTextTheme.responsiveTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _isDarkMode
                            ? AppColors.white
                            : AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: ScreenUtils.paddingSmall),
                    ThemeAwareText(
                      'نص متجاوب كبير',
                      style: AppTextTheme.responsiveTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _isDarkMode
                            ? AppColors.white
                            : AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: ScreenUtils.paddingLarge),
            ],
          ),
        ),
      ),
    );
  }
}
