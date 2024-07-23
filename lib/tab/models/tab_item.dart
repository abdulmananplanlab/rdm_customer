part of 'models.dart';

enum TabItem {
  home(AssetIcons.home),
  listings(AssetIcons.listings),
  offers(AssetIcons.offers),
  inspections(AssetIcons.inspections),
  ;

  const TabItem(this.icon);
  final AssetIcons icon;

  String get title {
    switch (this) {
      case TabItem.home:
        return 'Home';
      case TabItem.listings:
        return 'Listings';
      case TabItem.offers:
        return 'Offers';
      case TabItem.inspections:
        return 'Inspections';
      default:
        return '';
    }
  }

  String get path => 'tab/$name';

  int get $index => items.indexOf(this);

  static const List<TabItem> items = [
    home,
    listings,
    offers,
    inspections,
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
