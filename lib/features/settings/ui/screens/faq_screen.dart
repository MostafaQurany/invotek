import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<FAQItem> _allFAQs = [];
  List<FAQItem> _filteredFAQs = [];
  int? _expandedIndex;
  bool _faqsLoaded = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterFAQs);
    // Load FAQs after the first frame is built to ensure context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _loadFAQs(context);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadFAQs(BuildContext context) {
    if (_faqsLoaded) return; // Only load once
    
    // يمكن تحميل الأسئلة من API أو استخدام بيانات ثابتة
    _allFAQs.clear();
    _allFAQs.addAll([
      FAQItem(
        question: S.of(context).faqQuestion1,
        answer: S.of(context).faqAnswer1,
      ),
      FAQItem(
        question: S.of(context).faqQuestion2,
        answer: S.of(context).faqAnswer2,
      ),
      FAQItem(
        question: S.of(context).faqQuestion3,
        answer: S.of(context).faqAnswer3,
      ),
      FAQItem(
        question: S.of(context).faqQuestion4,
        answer: S.of(context).faqAnswer4,
      ),
      FAQItem(
        question: S.of(context).faqQuestion5,
        answer: S.of(context).faqAnswer5,
      ),
    ]);
    _filteredFAQs = List.from(_allFAQs);
    _faqsLoaded = true;
  }

  void _filterFAQs() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredFAQs = List.from(_allFAQs);
      } else {
        _filteredFAQs = _allFAQs
            .where((faq) =>
                faq.question.toLowerCase().contains(query) ||
                faq.answer.toLowerCase().contains(query))
            .toList();
      }
      _expandedIndex = null; // Reset expanded index when filtering
    });
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
          S.of(context).faq,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(16.w),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: S.of(context).searchFAQs,
                prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: AppColors.textSecondary),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
                filled: true,
                fillColor: AppColors.white,
              ),
            ),
          ),

          // FAQ List
          Expanded(
            child: _filteredFAQs.isEmpty
                ? Center(
                    child: EmptyStateWidget(
                      icon: Icons.search_off,
                      title: S.of(context).noFAQsFound,
                      description: S.of(context).tryDifferentSearchTerm,
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: _filteredFAQs.length,
                    itemBuilder: (context, index) {
                      final faq = _filteredFAQs[index];
                      final isExpanded = _expandedIndex == index;

                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: SettingsCard(
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            childrenPadding: EdgeInsets.only(
                              bottom: 16.h,
                              top: 8.h,
                            ),
                            initiallyExpanded: isExpanded,
                            onExpansionChanged: (expanded) {
                              setState(() {
                                _expandedIndex = expanded ? index : null;
                              });
                            },
                            title: Text(
                              faq.question,
                              style: AppTextTheme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            children: [
                              Text(
                                faq.answer,
                                style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textSecondary,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}


