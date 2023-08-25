import 'package:flutter/material.dart';
import 'package:mindcraft_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getUserDetails();
    super.initState();
  }

  bool active = false;
  @override
  Widget build(BuildContext context) {
    // final providerValue = Provider.of<UserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "User details",
            style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Consumer<UserProvider>(builder: (context, provider, _) {
            if (provider.isLoading) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                children: [
                  ExpansionPanelList(
                    expansionCallback: (panelIndex, expanded) {
                      active = !active;
                      setState(() {});
                    },
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return const ListTile(
                              title: Text(
                                "List of Keys",
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 14),
                              ),
                            );
                          },
                          body: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: provider.userDetailsModel!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  provider.userDetailsModel![index].key,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins', fontSize: 12),
                                ),
                              );
                            },
                          ),
                          isExpanded: active,
                          canTapOnHeader: true),
                    ],
                  )
                ],
              );
            }
          }),
        ));
  }
}
