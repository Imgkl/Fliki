import 'dart:convert';
import 'dart:io';
import 'package:flikipedia/enums/loading_states_enum.dart';
import 'package:flikipedia/model/search_result.dart';
import 'package:flikipedia/screens/search_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class SearchProvider extends ChangeNotifier {
  SearchResult searchResult;
  bool emptyResult = false;
  bool isLoading = false;
  bool isCache = false;
  int screen = 0;
  LOADING_STATES loadingStates = LOADING_STATES.IDLE;

  SearchProvider get searchProvider => SearchProvider();

  deleteAllCache() async {
    //Deleting the cache files which is stored in the temporary directory
    var cacheDir = (await getTemporaryDirectory()).path;
    Directory(cacheDir).delete(recursive: true);
  }

  searchApi(String substring, BuildContext ctx) async {
    this.loadingStates = LOADING_STATES.IDLE;
    isLoading = true;
    notifyListeners();
    String fileName = "$substring.json";
    var cacheDir = await getTemporaryDirectory();
    if (await File(cacheDir.path + "/" + fileName).exists()) {
      print("Loading from cache");
      var jsonData = File(cacheDir.path + "/" + fileName).readAsStringSync();
      searchResult = SearchResult.fromJson(json.decode(jsonData));
      isLoading = false;
      notifyListeners();
      if (searchResult.query != null) {
        isCache = true;
        notifyListeners();
        Navigator.push(
            ctx,
            CupertinoPageRoute(
              builder: (context) => SearchResultScreen(
                searchResult: searchResult,
                resultQuery: substring,
              ),
            ));
        Fluttertoast.showToast(
            msg: "This is a cached response.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        notifyListeners();
      } else {
        this.loadingStates = LOADING_STATES.EMPTY;
        notifyListeners();
      }
    } else {
      print("fetching from API");
      var sepString = substring.trim().split(' ');
      var searchString = sepString.join('_');
      await http
          .get(
              "https://en.wikipedia.org//w/api.php?action=query&format=json&prop=extracts%7Cpageimages%7Cpageterms%7Cinfo&inprop=url&generator=prefixsearch&formatversion=2&piprop=thumbnail&pithumbsize=600&wbptterms=description&gpssearch=$searchString&exsentences=5&exintro=1&explaintext=1&gpslimit=50")
          .then((value) async {
        this.isLoading = false;
        notifyListeners();
        searchResult = SearchResult.fromJson(json.decode(value.body));
        var jsonResponse = value.body;
        var tempDir = await getTemporaryDirectory();
        File file = new File(tempDir.path + "/" + fileName);
        file.writeAsString(jsonResponse, flush: true, mode: FileMode.write);
        if (searchResult.query != null) {
          Navigator.push(
              ctx,
              CupertinoPageRoute(
                builder: (context) => SearchResultScreen(
                  searchResult: searchResult,
                  resultQuery: substring,
                ),
              ));
        } else {
          this.loadingStates = LOADING_STATES.EMPTY;
          notifyListeners();
        }
      });
    }
  }
}
