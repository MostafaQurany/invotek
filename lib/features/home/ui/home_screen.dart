import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/home/ui/widgets/invoice_home_animated_card.dart';
import 'package:invotek/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  bool _firstCardVisible = false;
  bool _secondCardVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _firstCardVisible = true;
        _secondCardVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: Icon(Icons.menu, color: colorScheme.onSurface, size: 24.sp),
        ),
        title: Image(image: AssetImage(AppImages.logoGreen), height: 40.h),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Welcome Header
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).welcome,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      S.of(context).chooseFeature,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 80.h,
                        child: InvoiceHomeAnimatedCard(
                          ontTap: () {},
                          offset: const Offset(-1, 0),
                          isVisible: _firstCardVisible,
                          title: S.of(context).usersPermissionsTitle,
                          description: S.of(context).usersPermissionsDesc,
                          image: AppImages.emailIcon,
                          color: colorScheme.primary,
                          textColor: colorScheme.onPrimary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: SizedBox(
                        height: 80.h,
                        child: InvoiceHomeAnimatedCard(
                          ontTap: () {},
                          offset: const Offset(1, 0),
                          isVisible: _secondCardVisible,
                          title: S.of(context).clientsProductsTitle,
                          description: S.of(context).clientsProductsDesc,
                          image: AppImages.invoiceMoneyIcon,
                          color: colorScheme.secondary,
                          textColor: colorScheme.onSecondary,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                            topLeft: Radius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 80.h,
                        child: InvoiceHomeAnimatedCard(
                          ontTap: () {},
                          offset: _firstCardVisible
                              ? Offset(0, 0)
                              : Offset(-1, 0),
                          isVisible: _secondCardVisible,
                          title: S.of(context).expensesTitle,
                          description: S.of(context).expensesDesc,
                          image: AppImages.invoiceMoneyIcon,
                          color: colorScheme.tertiary,
                          textColor: colorScheme.onTertiary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10.w),
                    Expanded(
                      child: SizedBox(
                        height: 80.h,
                        child: InvoiceHomeAnimatedCard(
                          ontTap: () {},
                          offset: _secondCardVisible
                              ? Offset(0, 0)
                              : Offset(1, 0),
                          isVisible: _secondCardVisible,
                          title: S.of(context).taxInvoicesTitle,
                          description: S.of(context).taxInvoicesDesc,
                          image: AppImages.invoiceMoneyIcon,
                          color: colorScheme.error,
                          textColor: colorScheme.onError,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(children: []),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
