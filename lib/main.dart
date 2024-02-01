import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

import 'consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Insta E-Wallet",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Insta E-Wallet',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontFamily: font),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Text(
                        '50  USD',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        'Total balance ',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                actionCircle(
                    icon: Icons.add_circle_outline_rounded,
                    title: 'Add',
                    color: Color.fromARGB(255, 138, 255, 142)),
                actionCircle(
                    icon: Icons.transform_rounded,
                    title: 'Send',
                    color: Color.fromARGB(255, 160, 190, 255)),
                actionCircle(
                    icon: Icons.transit_enterexit_rounded,
                    title: 'Withdrow',
                    color: Color.fromARGB(255, 255, 167, 160)),
              ],
            ),
            Divider(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Transactions',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 238, 238),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.add_box_rounded),
                      Text('20 USD'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '2024/2/5',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 87, 87, 87),
                                fontSize: 10),
                          ),
                          Text(
                            '2:50',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 87, 87, 87),
                                fontSize: 10),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )),
    ));
  }
}

Widget actionCircle(
    {String? title, required IconData icon, required Color color}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: InkWell(
        onTap: () {},
        child: CircleAvatar(
          radius: 45,
          backgroundColor: color,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  title.toString(),
                  style: TextStyle(
                      //color: const Color.fromARGB(255, 102, 102, 102),
                      color: Colors.white,
                      fontSize: 14),
                )
              ],
            ),
          ),
        )),
  );
}

// Aes0cD959sG5IirJVkNqJ_cAi7UdIvcITbTuvsp-ZEWNeavYHOucOFWg_tcfNqZllkF9VAvMkDUHR0ej
// Secrete
//EHMwH3AFVGhxTZbPtTPOTTGBp53cUrz6sNNoKBO0a71jO8DA3fsHdgWSOqFuYmE4qyIQlUNcIQKmDhgY
/*
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

String id =
    'Aes0cD959sG5IirJVkNqJ_cAi7UdIvcITbTuvsp-ZEWNeavYHOucOFWg_tcfNqZllkF9VAvMkDUHR0ej';
String secret =
    'EHMwH3AFVGhxTZbPtTPOTTGBp53cUrz6sNNoKBO0a71jO8DA3fsHdgWSOqFuYmE4qyIQlUNcIQKmDhgY';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PayPal Checkout",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckout(
                sandboxMode: true,
                clientId:id,
                secretKey: secret,
                returnURL: "success.snippetcoder.com",
                cancelURL: "cancel.snippetcoder.com",
                
                transactions: const [
                  {
                    "amount": {
                      "total": '70',
                      "currency": "USD",
                      "details": {
                        "subtotal": '70',
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                
                    "item_list": {
                      "items": [
                        {
                          "name": "Apple",
                          "quantity": 4,
                          "price": '5',
                          "currency": "USD"
                        },
                         {
                          "name": "Apple",
                          "quantity": 4,
                          "price": '5',
                          "currency": "USD"
                        },
                      ],
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  print("onSuccess: $params");
                },
                onError: (error) {
                  print("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                },
              ),
            ));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
            ),
          ),
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}


*/
