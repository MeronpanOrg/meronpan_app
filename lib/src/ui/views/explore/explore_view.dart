<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meronpan_app/src/ui/providers/explore/explore_provider.dart';
import 'package:meronpan_app/src/ui/providers/explore/state/explore_provider_state.dart';
import 'package:meronpan_app/src/ui/widgets/manga_cover.dart';

class ExploreView extends ConsumerStatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  ConsumerState<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends ConsumerState<ExploreView> {
  final ScrollController _scrollController = ScrollController();

  final _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = 'Search query';

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
                  SliverSafeArea(
                    sliver: SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      sliver: SliverAppBar(
                        leading:
                            !_isSearching ? const Icon(Icons.search) : null,
                        floating: true,
                  
                        backgroundColor: Colors.red,
                        shape: const StadiumBorder(),
                        title: Column(
                          children: [
                            _buildSearchField(),
                          ],
                        ),
                        actions: !_isSearching
                            ? [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.view_list_sharp),
                                ),
                                IconButton(
                                  onPressed: () {
                                    ref
                                        .read(exploreProvider.notifier)
                                        .refresh();
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
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  if (mangas.isEmpty) _buildLoadingSliver(),
                  if (mangas.isNotEmpty)
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // print(mangas[index].toJson());
                              // ref.read(selectedMangaProvider.notifier).state =
                              //     mangas[index];
                              // Navigator.pushNamed(context, '/manga');
                            },
                            child: GridTile(
                              child: Column(
                                children: [
                                  MangaCover(
                                    manga: mangas[index],
                                  ),
                                  Text(
                                    mangas[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: mangas.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        crossAxisCount: 3,
                        mainAxisExtent: 220,
                      ),
                    )
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
=======
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExploreView extends ConsumerWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverAppBar(
            backgroundColor: Colors.red,
            shape: const StadiumBorder(),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.view_list_sharp),
              ),
              IconButton(
                onPressed: () {
                  // ref.read(exploreProvider.notifier).refresh();
                },
                icon: const Icon(Icons.refresh),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card();
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              crossAxisCount: Platform.isWindows ? 6 : 3,
              mainAxisExtent: 220,
            ),
          ),
          const SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          )
>>>>>>> e88bd9e54e79f62e4ed6b1983960c206aa2d5180
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
              FocusScope.of(context).requestFocus(FocusNode());
            });
          }));
          setState(() {
            _isSearching = true;
          });
        }
      },
      onSubmitted: (query) {
        ref.read(exploreProvider.notifier).clean();
        ref.read(exploreProvider.notifier).getSearch(query);
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

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        hintText: 'Search manga...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black38),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 16.0),
      onSubmitted: (query) {},
    );
  }
}
