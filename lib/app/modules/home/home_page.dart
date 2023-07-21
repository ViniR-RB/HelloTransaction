import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hellotransaction/app/modules/home/states.dart';
import 'package:hellotransaction/app/modules/home/widgets/icon_buttons_action.dart';
import 'package:hellotransaction/app/modules/home/widgets/list_icon_button.dart';
import 'package:hellotransaction/app/modules/home/widgets/list_transactions.dart';

import '../../core/app_state.dart';
import 'event.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = Modular.get<HomeController>();
    _controller.inputController.add(HomeFetchTransactionsEvent());
  }

  @override
  void dispose() {
    _controller.inputController.close();
    super.dispose();
  }

  toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2a61ee),
        title: Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: size.width / 2.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Hi,Momon!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(
                            height: 2,
                          ),
                          Text("joedoe@gmail.com",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ]),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 14, right: 8),
            child: Stack(
              children: [
                CustomButtonAction(
                  opacity: 0.2,
                  icon: Icons.notifications_outlined,
                  onTap: () => log('On Tap Notifications'),
                ),
                Positioned(
                  left: 26,
                  top: 14,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.amber[900],
                    child: const Text(''),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 14, right: 8),
            child: CustomButtonAction(
              opacity: 0.2,
              icon: Icons.refresh,
              onTap: () =>
                  _controller.inputController.add(HomeFetchTransactionsEvent()),
            ),
          ),
        ],
      ),
      body: StreamBuilder<AppState>(
        stream: _controller.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final states = snapshot.data;
            if (states is HomeStateLoadingGetTransactions) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (states is HomeStateLoadedGetTransactions) {
              return LayoutBuilder(
                builder: (context, contrains) {
                  return Stack(
                    children: [
                      Container(
                        color: const Color(0xFF2A61EE),
                        width: contrains.maxWidth,
                        height: contrains.maxHeight / 2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Wallet Balance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              RichText(
                                  text: const TextSpan(
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                    TextSpan(text: '\$12,890'),
                                    TextSpan(
                                        text: '.00',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500))
                                  ])),
                              const ListIconButton(),
                            ]),
                      ),
                      AnimatedContainer(
                        margin: EdgeInsets.only(
                            top: isExpanded == false
                                ? contrains.maxHeight / 2.4
                                : 0),
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                              )),
                          height: contrains.maxHeight,
                          width: contrains.maxWidth,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Transactions',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 30),
                                      ),
                                      InkWell(
                                        onTap: toggleExpanded,
                                        child: const Text(
                                          'See all',
                                          style: TextStyle(
                                              color: Color(0xFF3A6CEF),
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                child: ListTransactions(
                                  transactions: states.transactions,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else if (states is HomeStateErrorGetTransactions) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(states.message,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white)),
                    ElevatedButton(
                      onPressed: () => _controller.inputController
                          .add(HomeFetchTransactionsEvent()),
                      child: const Text('Tente Novamente'),
                    )
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
