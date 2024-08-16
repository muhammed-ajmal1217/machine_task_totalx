import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';
import 'package:totalx/controlller/auth_controller.dart';
import 'package:totalx/view/home/home.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  String verificationId;
  String phoneNumber;

  OtpScreen({super.key, required this.verificationId, required this.phoneNumber});

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.23,
                    width: size.width * 0.36,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/otp.png'))),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'OTP Verification',
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      'Enter the verification code we just sent to your number +91 *******21.'),
                  const SizedBox(height: 10,),
                  Center(
                    child: PinCodeTextField(
                      controller: otpController,
                      pinTextStyle: const TextStyle(fontSize: 17, color: Colors.red),
                      maxLength: 6,
                      pinBoxWidth: size.width*0.13,
                      pinBoxHeight: size.height*0.08,
                      pinBoxRadius: 10,
                      highlightColor: Colors.red,
                      defaultBorderColor: Colors.grey,
                      onDone: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      verifyOtp(context, otpController.text, phoneNumber);
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                            'Verify',
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontWeight: FontWeight.w600),
                          )),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text("Don't Get OTP? Resend")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void verifyOtp(context, String userotp, String phonenumber) {
    final authPro = Provider.of<AuthProviders>(context, listen: false);
    authPro.verifyOtp(
        verificationId: verificationId,
        otp: userotp,
        phone: phonenumber,
        onSuccess: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
        });
  }
}
