import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataStorageScreen extends StatefulWidget {
  const DataStorageScreen({super.key});

  @override
  State<DataStorageScreen> createState() => _DataStorageScreenState();
}

class _DataStorageScreenState extends State<DataStorageScreen> {
  String _cacheSize = '0 MB';
  String _dataSize = '0 MB';
  bool _isLoading = true;
  bool _isClearing = false;

  @override
  void initState() {
    super.initState();
    _calculateSizes();
  }

  Future<void> _calculateSizes() async {
    setState(() => _isLoading = true);
    try {
      final cacheSize = await _getCacheSize();
      final dataSize = await _getDataSize();
      setState(() {
        _cacheSize = _formatBytes(cacheSize);
        _dataSize = _formatBytes(dataSize);
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<int> _getCacheSize() async {
    try {
      final cacheDir = await getTemporaryDirectory();
      int totalSize = 0;
      if (await cacheDir.exists()) {
        await for (var entity in cacheDir.list(recursive: true)) {
          if (entity is File) {
            totalSize += await entity.length();
          }
        }
      }
      return totalSize;
    } catch (e) {
      return 0;
    }
  }

  Future<int> _getDataSize() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      int totalSize = 0;
      if (await appDir.exists()) {
        await for (var entity in appDir.list(recursive: true)) {
          if (entity is File) {
            totalSize += await entity.length();
          }
        }
      }
      // SharedPreferences size is usually small, we'll approximate it
      return totalSize;
    } catch (e) {
      return 0;
    }
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(2)} KB';
    } else {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
  }

  Future<void> _clearCache() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).clearCache),
        content: Text(S.of(context).clearCacheConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text(S.of(context).clear),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isClearing = true);
    try {
      final cacheDir = await getTemporaryDirectory();
      if (await cacheDir.exists()) {
        await for (var entity in cacheDir.list(recursive: true)) {
          if (entity is File) {
            await entity.delete();
          } else if (entity is Directory) {
            await entity.delete(recursive: true);
          }
        }
      }
      await _calculateSizes();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).cacheClearedSuccessfully),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).errorClearingCache),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isClearing = false);
      }
    }
  }

  Future<void> _clearAllData() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).clearAllData),
        content: Text(S.of(context).clearAllDataConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text(S.of(context).clear),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isClearing = true);
    try {
      // Clear cache
      final cacheDir = await getTemporaryDirectory();
      if (await cacheDir.exists()) {
        await for (var entity in cacheDir.list(recursive: true)) {
          if (entity is File) {
            await entity.delete();
          } else if (entity is Directory) {
            await entity.delete(recursive: true);
          }
        }
      }

      // Clear SharedPreferences (except critical data like language)
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString('language_code');
      await prefs.clear();
      if (languageCode != null) {
        await prefs.setString('language_code', languageCode);
      }

      await _calculateSizes();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).allDataClearedSuccessfully),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).errorClearingData),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isClearing = false);
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
          S.of(context).dataStorage,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            )
          : ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                // Storage Information Card
                SettingsCard(
                  title: S.of(context).storageInformation,
                  showDivider: true,
                  child: Column(
                    children: [
                      _buildStorageRow(
                        S.of(context).cacheSize,
                        _cacheSize,
                        Icons.storage,
                      ),
                      SizedBox(height: 12.h),
                      _buildStorageRow(
                        S.of(context).dataSize,
                        _dataSize,
                        Icons.folder,
                      ),
                      SizedBox(height: 16.h),
                      ActionButton(
                        text: S.of(context).refresh,
                        variant: ActionButtonVariant.secondary,
                        onPressed: _isClearing ? null : _calculateSizes,
                        fullWidth: true,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                // Clear Cache Card
                SettingsCard(
                  title: S.of(context).clearCache,
                  showDivider: true,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Text(
                          S.of(context).clearCacheDescription,
                          style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                      ActionButton(
                        text: S.of(context).clearCache,
                        variant: ActionButtonVariant.secondary,
                        isLoading: _isClearing,
                        onPressed: _isClearing ? null : _clearCache,
                        fullWidth: true,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                // Clear All Data Card
                SettingsCard(
                  title: S.of(context).clearAllData,
                  showDivider: true,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Text(
                          S.of(context).clearAllDataDescription,
                          style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ),
                      ActionButton(
                        text: S.of(context).clearAllData,
                        variant: ActionButtonVariant.danger,
                        isLoading: _isClearing,
                        onPressed: _isClearing ? null : _clearAllData,
                        fullWidth: true,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32.h),
              ],
            ),
    );
  }

  Widget _buildStorageRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 24.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            label,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: AppTextTheme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

