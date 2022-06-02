import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OpenWeatherSearchPageBody extends HookConsumerWidget {
  const OpenWeatherSearchPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final textController =
    //     useTextEditingController.fromValue(TextEditingValue.empty);
    // textController.addListener(
    //   () {
    //     final viewModel = ref.read(openWeatherViewModelProvider.notifier);
    //     viewModel.onIntent(
    //       OpenWeatherSearchScreenIntent.search(
    //         searchTerm: textController.text,
    //       ),
    //     );
    //   },
    // );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/cloud.png'),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Climate",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: "Counts",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(
                      // controller: textController,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async {
                            try {} catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "City Not Found",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ));
                            }
                          },
                          icon: const Icon(Icons.search, color: Colors.black),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Search City Here",
                        hintStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ToggleButtons(
                          selectedColor: Colors.black,
                          fillColor: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text("English"),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text("Hindi"),
                            ),
                          ],
                          onPressed: (int index) {},
                          isSelected: const [true, false],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ToggleButtons(
                          selectedColor: Colors.black,
                          fillColor: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text("C"),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text("F"),
                            ),
                          ],
                          onPressed: (int index) {},
                          isSelected: const [true, false],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                child: Column(
                  children: [
                    Text(
                      // openWeatherViewModelProvider.name.toString(),
                      "Name",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    const Divider(),
                    const Card(
                      margin: EdgeInsets.only(
                        left: 30.0,
                      ),
                      child: Text.rich(TextSpan(
                        children: [
                          TextSpan(
                            text: "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                            ),
                          ),
                          TextSpan(
                            text: "\u00b0C\n",
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                      elevation: 0.0,
                    ),
                    const Divider(),
                    Image.asset('assets/images/city.png'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Card(
                elevation: 1.0,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                      ),
                      child: Row(
                        children: const [
                          Text(
                            "Weather Today",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Row(
                        children: const [
                          Text.rich(TextSpan(
                            children: [
                              TextSpan(
                                text: "",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50,
                                ),
                              ),
                              TextSpan(
                                text: "\u00b0C\n",
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "Feels Like",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "High/Low",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "/",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Humidity",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Pressure",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Visibility",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "mi",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Wind",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "mph",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
