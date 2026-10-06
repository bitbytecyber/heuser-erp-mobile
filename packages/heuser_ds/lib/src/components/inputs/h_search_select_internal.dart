part of 'h_search_select.dart';

// The result sheet of HSearchSelect: search box, paged list, optional
// "not listed" escape hatch. Kept as a part so the pick type stays private.

class _Pick<T> {
  const _Pick.item(this.item) : other = false;
  const _Pick.other() : item = null, other = true;
  final T? item;
  final bool other;
}

class _SearchSheet<T> extends StatefulWidget {
  const _SearchSheet({
    required this.title,
    required this.fetchPage,
    required this.labelOf,
    required this.subtitleOf,
    required this.pageSize,
    required this.labels,
    required this.showOther,
  });
  final String? title;
  final Future<List<T>> Function(String query, int offset) fetchPage;
  final String Function(T item) labelOf;
  final String Function(T item)? subtitleOf;
  final int pageSize;
  final HSearchLabels labels;
  final bool showOther;

  @override
  State<_SearchSheet<T>> createState() => _SearchSheetState<T>();
}

class _SearchSheetState<T> extends State<_SearchSheet<T>> {
  String _query = '';
  Timer? _debounce;
  late final PagingController<int, T> _paging = PagingController<int, T>(
    getNextPageKey: (state) {
      final pages = state.pages;
      if (pages == null || pages.isEmpty) return 0;
      if (pages.last.length < widget.pageSize) return null;
      return state.keys!.last + widget.pageSize;
    },
    fetchPage: (offset) => widget.fetchPage(_query, offset),
  );

  @override
  void dispose() {
    _debounce?.cancel();
    _paging.dispose();
    super.dispose();
  }

  void _onQuery(String v) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      _query = v.trim();
      _paging.refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.8;
    return HBottomSheet(
      title: widget.title,
      scrollBody: false,
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                HSpace.x4,
                0,
                HSpace.x4,
                HSpace.x2,
              ),
              child: HTextField(
                hint: widget.labels.searchHint,
                leadingIcon: HIcons.search,
                onChanged: _onQuery,
                autofocus: true,
              ),
            ),
            Expanded(
              child: PagingListener<int, T>(
                controller: _paging,
                builder: (context, state, fetchNextPage) =>
                    PagedListView<int, T>(
                      state: state,
                      fetchNextPage: fetchNextPage,
                      padding: const EdgeInsets.only(bottom: HSpace.x4),
                      builderDelegate: PagedChildBuilderDelegate<T>(
                        itemBuilder: (context, item, index) => HListTile(
                          title: widget.labelOf(item),
                          subtitle: widget.subtitleOf?.call(item),
                          showChevron: false,
                          onTap: () =>
                              Navigator.of(context).pop(_Pick<T>.item(item)),
                        ),
                        firstPageProgressIndicatorBuilder: (_) => const Padding(
                          padding: EdgeInsets.all(HSpace.x6),
                          child: Center(child: HSpinner()),
                        ),
                        newPageProgressIndicatorBuilder: (_) => const Padding(
                          padding: EdgeInsets.all(HSpace.x4),
                          child: Center(child: HSpinner()),
                        ),
                        noItemsFoundIndicatorBuilder: (_) => HEmptyState(
                          compact: true,
                          icon: HIcons.search,
                          title: widget.labels.noResults,
                        ),
                        firstPageErrorIndicatorBuilder: (_) => HEmptyState(
                          compact: true,
                          icon: HIcons.offline,
                          tone: HTone.warning,
                          title: widget.labels.error,
                          actionLabel: widget.labels.retry,
                          onAction: _paging.refresh,
                        ),
                      ),
                    ),
              ),
            ),
            if (widget.showOther)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  HSpace.x4,
                  HSpace.x2,
                  HSpace.x4,
                  HSpace.x2,
                ),
                child: HButton.outline(
                  label: widget.labels.notListed,
                  icon: HIcons.edit,
                  onPressed: () =>
                      Navigator.of(context).pop(const _Pick<Never>.other()),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
