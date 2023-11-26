import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KhaltiPaymentPage extends StatefulWidget {
  @override
  State<KhaltiPaymentPage> createState() => _KhaltiPaymentPageState();
}

class _KhaltiPaymentPageState extends State<KhaltiPaymentPage> {
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
          color: Color(0xff000000),),
        title: const Text(
          'Renew Page',
          style: TextStyle(color: Color(0xff000000)),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter amount to pay',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text('Renewal Date: 24 August, 2023',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              ),
              SizedBox(height: 30,),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 50,
                  color: const Color(0xff0c4c94),
                  child: const Text(
                    'Pay Now',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  onPressed: () {
                    payWithKhaltiInApp();
                  })
            ],
          ),
        ),
      ),
    );
  }

  payWithKhaltiInApp() {
    KhaltiScope.of(context).pay(
        config: PaymentConfig(amount: 1000,
            productIdentity: "Product Identity",
            productName: "Renew"),
        preferences: [PaymentPreference.khalti],
        onSuccess: onSuccess,
        onFailure: onFailure,
        onCancel: onCancel);
  }

  void onSuccess(PaymentSuccessModel success) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(title: const Text('Payment Successful'),
        actions: [SimpleDialogOption(child: const Text('OK'), onPressed: () {
          Navigator.pop(context);
        },)
        ],);
    });
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(failure.toString());
  }

  void onCancel() {
    debugPrint("Cancelled");
  }
}
