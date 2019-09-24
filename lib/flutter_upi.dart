import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterUpiApps {
  static const String PayTM = "net.one97.paytm";
  static const String GooglePay = "com.google.android.apps.nbu.paisa.user";
  static const String BHIMUPI = "in.org.npci.upiapp";
  static const String PhonePe = "com.phonepe.app";
  static const String MiPay = "com.mipay.wallet.in";
  static const String AmazonPay = "in.amazon.mShop.android.shopping";
  static const String TrueCallerUPI = "com.truecaller";
  static const String MyAirtelUPI = "com.myairtelapp";
}

class FlutterUpiResponse {
  String txnId;
  String responseCode;
  String ApprovalRefNo;
  String Status;
  String txnRef;

  FlutterUpiResponse(String responseString) {
    List<String> _parts = responseString.split('&');

    for (int i = 0; i < _parts.length; ++i) {
      String key = _parts[i].split('=')[0];
      String value = _parts[i].split('=')[1];
      if (key == "txnId") {
        txnId = value;
      } else if (key == "responseCode") {
        responseCode = value;
      } else if (key == "ApprovalRefNo") {
        ApprovalRefNo = value;
      } else if (key.toLowerCase() == "status") {
        Status = value;
      } else if (key == "txnRef") {
        txnRef = value;
      }
    }
  }
}

class FlutterUpi {
  static const MethodChannel _channel = const MethodChannel('flutter_upi');
  static Future<String> initiateTransaction(
      {@required String app,
      String pa,
      String pn,
      String mc,
      String tr,
      String tn,
      String am,
        String cu,
      String url,
       String payUrl}) async {
    final String response = await _channel.invokeMethod('initiateTransaction', {
      "app": app,
      'pa': pa,
      'pn': pn,
      'mc': mc,
      'tr': tr,
      'tn': tn,
      'am': am,
      'cu': cu,
      'url': url,
      'payUrl':payUrl,
    });
    return response;
  }
}
