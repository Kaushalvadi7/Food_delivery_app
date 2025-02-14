import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/pages/delivery_progress_page.dart';
import 'package:lottie/lottie.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}
class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //user wants to pay
  void userTappedPay(){
    if(formKey.currentState!.validate()){
      //only show dialog if form is valid
      showDialog(context: context, builder: (context) => AlertDialog(
        title: const Text("Confirm Payment"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Card Number: $cardNumber"),
              Text("Card Number: $expiryDate"),
              Text("Card Number: $cardHolderName"),
              Text("Card Number: $cvvCode"),
            ],
          ),
        ),
        actions: [
          // cancel button
          TextButton(onPressed: () => Navigator.pop(context),
              child:  const  Text("Cansel")),
          // Confirm payment button
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close confirmation dialog
              showLottieAnimation(); // Show animation and navigate
            },
            child: const Text("Yes"),
          ),

        ],
      ),
      );
    }
  }

  void showLottieAnimation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                Lottie.asset(
                'assets/animation/food_delivery.json',
                width: 400,
                height: 400,
                repeat: false,
              ),
              const SizedBox(height: 10),
              const Text("Processing your payment...",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context); // Close the Lottie dialog FIRST
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DeliveryProgressPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
        centerTitle: true,
      ) ,
      body: SafeArea(
        child: SingleChildScrollView (
          child: Column(
            children: [
            //Credit card
              CreditCardWidget(
                cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  onCreditCardWidgetChange: (p0) {},),

              //credit card form
              CreditCardForm(
                    cardNumber : cardNumber,
                    expiryDate : expiryDate,
                    cardHolderName : cardHolderName,
                    cvvCode : cvvCode,
                    onCreditCardModelChange: (data) {
                          setState(() {
                            cardNumber = data.cardNumber;
                            expiryDate = data.expiryDate;
                            cardHolderName = data.cardHolderName;
                            cvvCode = data.cvvCode;
                            isCvvFocused = data.isCvvFocused;
                          });
                    },
                    formKey: formKey,
              ),
              const SizedBox(height: 20,),
              MyButton(
                onTap: userTappedPay,
                text: "Pay Now",
              ),
              const SizedBox(height: 15,)
            ],

          ),
        ),
      ),
    );
  }
}
