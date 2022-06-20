import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../entity/models.dart';
import '../../../../presenter/bloc.dart';

import '../../../widgets/widgets.dart';
import 'ads_list_item.dart';

class AdsListView extends StatefulWidget {
  final String? superCategoryName;

  const AdsListView({
    Key? key,
    this.superCategoryName,
  }) : super(key: key);

  @override
  State<AdsListView> createState() => _AdsListViewState();
}

class _AdsListViewState extends State<AdsListView>
    with AutomaticKeepAliveClientMixin<AdsListView> {
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
    super.build(context);
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
              MediaQuery.removePadding(
                context: context,
                removeLeft: true,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      print('hello');
                      setState(() {});
                    },
                    child: ListView(
                      controller: _scrollController,
                      children: widget.superCategoryName != null
                          ? adsList
                              .where((ads) =>
                                  ads.superCategory == widget.superCategoryName)
                              .toList()
                              .map(
                                (adsItem) => AdsListItem(
                                  adsItem: adsItem,
                                ),
                              )
                              .toList()
                          : adsList
                              .map(
                                (adsItem) => AdsListItem(
                                  adsItem: adsItem,
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: UpScrollButton(
                  scrollUp: scrollUp,
                  toggleButton: toggleButton,
                  showButton: showButton,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
