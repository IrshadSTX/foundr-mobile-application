import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../services/event_services/event_join_services.dart';

class EventPaymentProvider with ChangeNotifier {
  Razorpay razorpay = Razorpay();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  void openCheckout(fee, eventId, joinLink, BuildContext context) async {
    String? token = await storage.read(key: 'token');
    final options = {
      'key': 'rzp_test_wyOr3rz1W1Hsvd',
      'amount': fee * 100,
      'name': 'Foundr',
      'description': 'Join the event',
      'prefill': {'contact': '9544072306', 'email': 'foundradmn@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {
        handlePaymentSuccess(response);
        EventJoinService().joinEvent(token!, eventId, joinLink).then(
              (value) => {
                if (value == false)
                  {Fluttertoast.showToast(msg: "Something went wrong!")}
                else if (value == true)
                  {
                    Fluttertoast.showToast(
                        msg: 'Link Send to your registerd Email')
                  }
              },
            );
      });
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse response) {
        handlePaymentError(response);
      });
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
          (ExternalWalletResponse response) {
        handleExternalWallet(response);
      });
    } on PaymentFailureResponse catch (e) {
      log(e.toString(), name: 'razorpay catch');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    // Fluttertoast.showToast(
    //     msg: "Payment successful with id ${response.paymentId!}");
    log("Payment success with signature ${response.signature}",
        name: 'success');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment failed with error ${response.message}");
    log("Payment error with code ${response.error}", name: 'error');
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "Payment made using ${response.walletName}");
    log("External wallet used: ${response.walletName}", name: 'wallet');
  }
}
