import 'package:elter/entity/models/ads.dart';
import 'package:elter/presenter/bloc.dart';
import 'package:elter/view/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ads_list_item.dart';

class AdsListView extends StatefulWidget {
  final String? superCatName;
  const AdsListView({Key? key, this.superCatName}) : super(key: key);

  @override
  State<AdsListView> createState() => _AdsListViewState();
}

class _AdsListViewState extends State<AdsListView>
    with SingleTickerProviderStateMixin {
  bool showButton = false;

  void toggleButton() {
    setState(() {
      showButton = !showButton;
    });
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollUp() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        if (state is! AdsLoadedState) {
          return const LoadingIndicator();
        }
        final List<Ads> adsList = state.ads;
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            setState(() {
              if (notification.direction == ScrollDirection.forward) {
                showButton = false;
              } else if (notification.direction == ScrollDirection.reverse) {
                showButton = true;
              }
            });
            return true;
          },
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      child: MediaQuery.removePadding(
                    context: context,
                    removeLeft: true,
                    child: ListView(
                      controller: _scrollController,
                      children: widget.superCatName != null
                          ? adsList
                              .where((ads) =>
                                  ads.superCategory == widget.superCatName)
                              .toList()
                              .map(
                                (adsItem) => AdsListItem(adsItem: adsItem),
                              )
                              .toList()
                          : adsList
                              .map(
                                (adsItem) => AdsListItem(adsItem: adsItem),
                              )
                              .toList(),
                    ),
                  )),
                ],
              ),
              UpScrollButton(
                scrollUp: scrollUp,
                toggleButton: toggleButton,
                showButton: showButton,
              ),
            ],
          ),
        );
      },
    );
  }
}
