import 'package:checkout_app/core/utils/app_assets.dart';
import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:checkout_app/core/utils/size_confige.dart';
import 'package:checkout_app/features/create_customer/ui/views/widgets/create_customer_form.dart';
import 'package:checkout_app/features/create_customer/ui/views/widgets/custom_skip_view.dart';
import 'package:flutter/material.dart';

class CreateCustomerViewBody extends StatelessWidget {
  const CreateCustomerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getRelativeHeight(0.01)),
              const CustomSkipView(),
              SizedBox(height: getRelativeHeight(0.1)),
              Center(
                child: Image.asset(
                  AppAssets.stripe,
                ),
              ),
              SizedBox(height: getRelativeHeight(0.06)),
              Text(
                'Create a Stripe Customer',
                style: AppStyles.latoMedium25.copyWith(
                  fontSize: 22,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: getRelativeHeight(0.03)),
              const CreateCustomerForm(),
            ],
          ),
        ),
      ),
    );
  }
}
