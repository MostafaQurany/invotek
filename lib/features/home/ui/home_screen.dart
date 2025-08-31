import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/theme/app_colors.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: Icon(Icons.menu, color: AppColors.primary, size: 24.sp),
        ),
        title: Image(image: AssetImage(AppImages.logoGreen), height: 40.h),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
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
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      S.of(context).chooseFeature,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                          color: AppColors.primary,
                          textColor: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
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
                          color: Colors.lightBlue,
                          textColor: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Center(
            //     child: AnimatedOpacity(
            //       opacity: _opacity,
            //       duration: const Duration(milliseconds: 800),
            //       curve: Curves.easeInOut,
            //       child: InvoiceHomeCards(
            //         title: "Invoice",
            //         description: "Create and manage invoices",
            //         onTap: () {},
            //         color: AppColors.primary,
            //         textColor: AppColors.white,
            //         borderColor: AppColors.primary,
            //         borderRadius: BorderRadius.circular(10),
            //         width: 0.5.sw,
            //       ),
            //     ),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                          color: Colors.orange,
                          textColor: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
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
                          color: Colors.deepOrange,
                          textColor: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
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
                padding: const EdgeInsets.all(8.0),
                child: Row(children: []),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
