import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meronpan_app/src/ui/providers/explore/explore_provider.dart';
import 'package:meronpan_app/src/ui/providers/explore/state/explore_provider_state.dart';
import 'package:meronpan_app/src/ui/views/explore/layouts/explore_view_android_layout.dart';

class ExploreView extends ConsumerStatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  ConsumerState<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends ConsumerState<ExploreView> {
  final ScrollController _scrollController = ScrollController();

  final _searchQueryController = TextEditingController();
  bool _isSearching = false;
  bool _wasSubmitted = false;

  void _onScroll() {
    if (_isBottom) {
      ref.read(exploreProvider.notifier).getPopulars();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exploreMangas = ref.watch(exploreProvider);

    return Scaffold(
      body: Stack(
        children: [
          Consumer(
            builder: (context, ref, child) {
              if (exploreMangas.status == ExploreStatus.failure) {
                return _buildError();
              }

              final mangas = exploreMangas.mangas;

              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    leading: !_isSearching ? const Icon(Icons.search) : null,
                    floating: true,
                    title: _buildSearchField(),
                    actions: !_isSearching
                        ? [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.view_list_sharp),
                            ),
                            IconButton(
                              onPressed: () {
                                ref.read(exploreProvider.notifier).refresh();
                              },
                              icon: const Icon(Icons.refresh),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                            ),
                          ]
                        : [],
                  ),
                  if (mangas.isEmpty) _buildLoadingSliver(),
                  if (mangas.isNotEmpty)
                    ExploreViewAndroidLayout(mangas: mangas)
                ],
              );
            },
          ),
          if (exploreMangas.status == ExploreStatus.ongoing &&
              exploreMangas.mangas.isNotEmpty)
            const Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                ),
              ),
            ),
        ],
      ),
      // floatingActionButton: FilterFAB(
      //   onPressed: () {
      //     showModalBottomSheet(
      //       enableDrag: true,
      //       isScrollControlled: true,
      //       context: context,
      //       builder: (context) {
      //         return const FilterDraggableScrollableSheet();
      //       },
      //     );
      //   },
      // ),
    );
  }

  SliverList _buildLoadingSliver() {
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        [
          _buildLoading(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        hintText: 'Search manga...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black38),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 16.0),
      onTap: () {
        if (!_isSearching) {
          ModalRoute.of(context)
              ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
            setState(() {
              _isSearching = false;
              _searchQueryController.text = '';

              if (_wasSubmitted) {
                ref.read(exploreProvider.notifier).refresh();
              }

              FocusScope.of(context).requestFocus(FocusNode());
            });
          }));
          setState(() {
            _isSearching = true;
            _wasSubmitted = false;
          });
        }
      },
      onSubmitted: (query) {
        ref.read(exploreProvider.notifier).clean();
        ref.read(exploreProvider.notifier).getSearch(query);
        setState(() {
          _wasSubmitted = true;
        });
      },
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError() {
    return const Center(
      child: Text('Imposible cargar mangas'),
    );
  }
}
