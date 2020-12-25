import 'package:flikipedia/custom_widgets/dynamic_text.dart';
import 'package:flikipedia/enums/loading_states_enum.dart';
import 'package:flikipedia/provider/search_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingStates extends StatelessWidget {
  final SearchProvider searchProvider;

  const LoadingStates({Key key, this.searchProvider}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return searchProvider.isLoading
        ? Padding(
            padding: const EdgeInsets.only(top: 118.0),
            child: Align(
                alignment: Alignment.center,
                child: SpinKitDoubleBounce(
                  color: Colors.grey,
                  size: 60,
                )),
          )
        : searchProvider.loadingStates == LOADING_STATES.EMPTY
            ? Padding(
                padding: const EdgeInsets.only(top: 118.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text("No results found.",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: DynamicColor().getColor(0.3),
                            ))),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 118.0, left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Type what you are looking for...",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: DynamicColor().getColor(0.3),
                        ),
                  ),
                ),
              );
  }
}
