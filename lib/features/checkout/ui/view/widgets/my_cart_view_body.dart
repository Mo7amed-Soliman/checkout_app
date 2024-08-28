import 'package:checkout_app/core/di/dependency_injection.dart';
import 'package:checkout_app/core/utils/app_assets.dart';
import 'package:checkout_app/core/utils/app_string.dart';
import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:checkout_app/core/utils/size_confige.dart';
import 'package:checkout_app/core/widgets/custom_bottom.dart';
import 'package:checkout_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:checkout_app/features/checkout/ui/manger/stripe_paymant_cubit/stripe_payment_cubit.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/bottom_sheet_widget.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/order_info_item.dart';
import 'package:checkout_app/features/checkout/ui/view/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppStyles.padding),
      child: Column(
        children: [
          SizedBox(height: getRelativeHeight(0.02)),
          const Expanded(
            child: Image(
              image: AssetImage(AppAssets.basketImage),
            ),
          ),
          SizedBox(height: getRelativeHeight(0.04)),
          const OrderInfoItem(
            title: AppString.orderSubtotal,
            value: r'115.0 $',
          ),
          const SizedBox(height: 3),
          const OrderInfoItem(
            title: AppString.discount,
            value: r'15.0 $',
          ),
          const SizedBox(height: 3),
          const OrderInfoItem(
            title: AppString.shipping,
            value: r'5.0 $',
          ),
          const Divider(
            thickness: 2,
            endIndent: 15,
            indent: 15,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(
            title: AppString.total,
            value: r'100.0 $',
          ),
          SizedBox(height: getRelativeHeight(0.07)),
          CustomBottom(
              text: AppString.completePayment,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => StripePaymentCubit(
                        getIt.get<CheckoutRepoImpl>(),
                      ),
                      child: const BottomSheetWidget(),
                    );
                  },
                );
              }),
          SizedBox(height: getRelativeHeight(0.03)),
        ],
      ),
    );
  }
}
