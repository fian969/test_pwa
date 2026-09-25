import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/navigation/app_router.dart';
import 'package:flutter_setup_clean_architectute/features/dashboard/presentation/widgets/qr_action_card.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

class QrActionShow extends StatelessWidget {
  const QrActionShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppColors.grey2,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            'Pilih Aksi Pembayaran',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: QrActionCard(
                  title: 'QRIS',
                  subtitle: 'Scan atau tampilkan QR',
                  icon: Assets.icons.payment.qris,
                  onTap: () {
                    context.router.maybePop();
                    context.router.push(const QrisRoute());
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: QrActionCard(
                  title: 'Bayar',
                  subtitle: 'Lanjut pembayaran cepat',
                  icon: Assets.icons.payment.nonCash,
                  onTap: () {
                    context.router.maybePop();
                    context.router.push(const PayRoute());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
