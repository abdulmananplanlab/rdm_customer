part of 'models.dart';

enum TabItem {
  home(AssetIcons.home),
  search(AssetIcons.search_icon),
  favoriteItems(AssetIcons.favourite_listing_icon),
  more(AssetIcons.more_option_icon),
  ;

  const TabItem(this.icon);
  final AssetIcons icon;

  String get title {
    switch (this) {
      case TabItem.home:
        return 'Home';
      case TabItem.search:
        return 'Search';
      case TabItem.favoriteItems:
        return 'Favorites';
      case TabItem.more:
        return 'More';
      default:
        return '';
    }
  }

  String get path => 'tab/$name';

  int get $index => items.indexOf(this);

  static const List<TabItem> items = [
    home,
    search,
    favoriteItems,
    more,
    // blank,
  ];

  static TabItem? fromName(String? name) => name?.notBlank == null
      ? null
      : items.firstWhereOrNull((e) => e.name == name);
}

extension IterableExtension<T> on Iterable<T> {
  /// The first element satisfying [test], or `null` if there are none.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
