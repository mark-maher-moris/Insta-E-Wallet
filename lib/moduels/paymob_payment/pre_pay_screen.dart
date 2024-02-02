import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_e_wallet/moduels/paymob_payment/controllers/payment_cubit_cubit.dart';
import 'package:insta_e_wallet/moduels/paymob_payment/controllers/payment_cubit_state.dart';
import 'package:insta_e_wallet/moduels/paymob_payment/paymob_consts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../screens/register_screen.dart';

class PrePayScreen extends StatefulWidget {
  PrePayScreen({super.key});

  @override
  State<PrePayScreen> createState() => _PrePayScreenState();
}

class _PrePayScreenState extends State<PrePayScreen> {
  final Completer<WebViewController> webViewController =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaymentCubit()..getAuthToken(),
        child: SafeArea(
            child: BlocConsumer<PaymentCubit, PaymentStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = PaymentCubit.get(context);
            return Scaffold(
              body: Column(
                children: [
                  Container(
                      width: 200,
                      child: MyTextFeild(
                        controller: controller,
                        validator: (v) {},
                        hint: 'Amount',
                        type: TextInputType.number,
                      )),
                  BigBtn(
                    title: 'B1',
                    onTap: () {
                      cubit.getOrderId(
                          firstName: 'MArk ',
                          email: 'markmaher933@gmail.com',
                          phoneNumber: '+201210153804',
                          totalPrice: controller.text ?? '20');
                    },
                  ),
                  BigBtn(
                    title: 'B2',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebView(
                              initialUrl: 'https://flutter.dev',
                              javascriptMode: JavascriptMode.unrestricted,
                              // onWebViewCreated: (WebViewController webViewController) {
                              //   webViewController.complete(webViewController);
                              // },
                              onProgress: (int progress) {
                                print(
                                    'WebView is loading (progress : $progress%)');
                              },
                              javascriptChannels: <JavascriptChannel>{
                                _toasterJavascriptChannel(context),
                              },
                              navigationDelegate: (NavigationRequest request) {
                                if (request.url
                                    .startsWith('https://www.youtube.com/')) {
                                  print('blocking navigation to $request}');
                                  return NavigationDecision.prevent;
                                }
                                print('allowing navigation to $request');
                                return NavigationDecision.navigate;
                              },
                              onPageStarted: (String url) {
                                print('Page started loading: $url');
                              },
                              onPageFinished: (String url) {
                                print('Page finished loading: $url');
                              },
                              gestureNavigationEnabled: true,
                              backgroundColor: const Color(0x00000000),
                            ),
                          ));
                    },
                  )
                ],
              ),
            );
          },
        )));
  }
}

JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      });
}
