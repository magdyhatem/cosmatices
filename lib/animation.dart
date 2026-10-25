import 'package:flutter/cupertino.dart';
import 'package:premium_otp_input/flux_otp.dart';

class Animation_to extends StatelessWidget {
  const Animation_to({super.key});

  @override
  Widget build(BuildContext context) {
    return LiquidOtpVerificationView(
      length: 4,
      onCompleted: (value) {
        // Trigger verification
      },
      onResend: () {
        // Handle OTP resend
      },
    );
  }
}
