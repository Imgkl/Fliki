import 'dart:convert';
import 'package:flikipedia/custom_widgets/app_bar.dart';
import 'package:flikipedia/custom_widgets/gradient_circle.dart';
import 'package:flikipedia/custom_widgets/input_feild.dart';
import 'package:flikipedia/custom_widgets/loading_states.dart';
import 'package:flikipedia/custom_widgets/recent_history.dart';
import 'package:flikipedia/model/recents.model.dart';
import 'package:flikipedia/provider/search_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  String query = "";
  List<Recents> list = new List<Recents>();
  SharedPreferences sharedPreferences;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    //Getting the recents which is stored in Shared Pref
    loadSharedPreferencesAndData();
    super.initState();
  }

  void loadData() {
    //Loading the reselts data and mapping them to List of Type "Result"
    List<String> listString = sharedPreferences.getStringList('list');
    if (listString != null) {
      setState(() {
        list = listString
            .map((item) => Recents.fromMap(json.decode(item)))
            .toList();
      });
    } else {
      list = List<Recents>();
    }
  }

  removeData() async {
    //Remove all recents
    await sharedPreferences.clear();
    loadData();
  }

  void loadSharedPreferencesAndData() async {
    //Initializing the shared preferences
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  addItem(Recents item) {
    //Adding the item to the recents
    if (list.isEmpty || list[0].title != item.title) {
      list.insert(0, item);
    }
    saveData();
  }

  void saveData() {
    //Saving the recents data in the shared preferences
    List<String> stringList =
        list.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('list', stringList);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, searchProvider, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              GradientCircles(),
              LoadingStates(
                searchProvider: searchProvider,
              ),
              Column(
                children: [
                  Appbar(),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18.0, bottom: 120),
                        child: InputFeild(
                            textController: textController,
                            searchProvider: searchProvider,
                            addItem: () {
                              addItem(Recents(title: textController.text));
                            }),
                      ),
                    ),
                  ),
                  RecentHistory(
                    searchProvider: searchProvider,
                    recentList: list,
                    removeRecent: () => removeData(),
                    loadList: () => loadSharedPreferencesAndData(),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
