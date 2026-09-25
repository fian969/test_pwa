import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/navigation/app_router.dart';
import 'package:flutter_setup_clean_architectute/features/dashboard/presentation/widgets/dashboard_widgets.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _greeting;
  late String _currentDate;

  @override
  void initState() {
    super.initState();
    _updateDateTime();
  }

  void _updateDateTime() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour < 12) {
      _greeting = 'Pagi, Selamat datang!';
    } else if (hour < 17) {
      _greeting = 'Siang, apa kabar?';
    } else if (hour < 21) {
      _greeting = 'Sore, tetap semangat!';
    } else {
      _greeting = 'Malam, istirahat yang cukup ya!';
    }

    _currentDate =
        DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            floating: true,
            pinned: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              _greeting,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.calmBlue,
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Date Info
                Text(
                  _currentDate,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.grey1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),

                // Featured Documentation Card
                _FeaturedDocumentationCard(),
                SizedBox(height: 24.h),

                // Quick Stats Section
                const SectionHeader(title: 'Statistik Anda'),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: StatisticCard(
                        icon: Icons.file_copy,
                        label: 'Fitur',
                        value: '10',
                        color: AppColors.calmBlue,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: StatisticCard(
                        icon: Icons.bookmark,
                        label: 'Tersimpan',
                        value: '3',
                        color: AppColors.calmBlueLight,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: StatisticCard(
                        icon: Icons.history,
                        label: 'Riwayat',
                        value: '6',
                        color: AppColors.calmBlueDark,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                // Quick Access Section
                const SectionHeader(title: 'Akses Cepat'),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: ActionButton(
                        icon: Icons.help_outline,
                        label: 'Tutorial',
                        color: AppColors.calmBlue,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: ActionButton(
                        icon: Icons.settings,
                        label: 'Pengaturan',
                        color: AppColors.calmBlueLight,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: ActionButton(
                        icon: Icons.feedback,
                        label: 'Feedback',
                        color: AppColors.calmBlueMuted,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: ActionButton(
                        icon: Icons.info,
                        label: 'Dokumentasi',
                        color: AppColors.calmBlueDark,
                        onTap: () {
                          context.router.push(const DocumentationRoute());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                // Info Section
                const SectionHeader(title: 'Fitur Terbaru'),
                SizedBox(height: 12.h),
                FeatureCard(
                  title: 'Calendar Picker Widget',
                  description:
                      'Widget untuk memilih tanggal dengan tampilan kalender modern',
                  category: 'Widgets',
                  icon: '📅',
                  categoryColor: AppColors.calmBlue,
                  onTap: () {
                    context.router.push(const DocumentationRoute());
                  },
                ),
                SizedBox(height: 12.h),
                FeatureCard(
                  title: 'Glasmorphism UI',
                  description:
                      'Desain modern dengan efek glass dan blur background',
                  category: 'Design',
                  icon: '✨',
                  categoryColor: AppColors.calmBlueDark,
                  onTap: () {
                    context.router.push(const DocumentationRoute());
                  },
                ),
                SizedBox(height: 32.h),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// Featured Documentation Card
class _FeaturedDocumentationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientGlassCard(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.calmBlue.withAlpha(220),
          AppColors.calmBlueDark.withAlpha(200),
        ],
      ),
      borderRadius: 24,
      blurStrength: 20,
      padding: EdgeInsets.all(20.w),
      onTap: () {
        context.router.push(const DocumentationRoute());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dokumentasi Fitur',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Pelajari 10+ fitur dengan contoh kode',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(200),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.book,
                  color: AppColors.calmBlue,
                  size: 24.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(250),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '10 Fitur',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.calmBlue,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(250),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Chat Support',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.calmBlue,
                  ),
                ),

              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 16.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
