// ignore_for_file: constant_identifier_names

enum AssetIcons {
  documnet_management_icon,
  fund_balance_icon,
  offer_management_icon,
  rent_icon,
  email_icon,
  line,
  edit,
  password_eye,
  copy_icon,
  car_icon,
  camera_icon,
  approve_tick,
  close_tick,
  exclamation_icon,
  exclamation_icon_grey,

  live_photos,
  verified_circle,
  logout,
  square_feet,
  pool_icon,
  deals,

  help_center,
  photography_service,
  settings,
  dot,
  delete_icon,
  new_password_icon,
  download_icon,
  search_icon,
  tabler_plane,
  underground_subway_icon,
  direction_icon,
  cat_icon,
  heat_icon,
  water_icon,
  tabler_alert_circle_filled,
  ac_icon,
  dollor_icon,
  elevator_icon,
  furnished_icon,
  no_smoking_icon,
  swimming_pool_icon,
  wheelchair_icon,
  down_arrow,
  bedroom_icon,
  dollar_icon,
  area_icon,
  verified_shield_icon,
  star_icon,
  video,
  photos,
  virtual_tour,
  like_icon,
  share_icon,
  phone_icon,
  home_other,
  home,
  alert,
  pdf_image,
  us,
  app_logo,
  password_visibility,
  upload_icon,
  dropdown_icon,
  drop_up,
  gallery_icon,
  remove_icon,
  video_icon,
  new_message,

  authenticator_app,
  apple_icon,
  facebook_icon,
  google_icon,
  search,
  more_option_icon,
  mastercard_payment_icon,
  mail,
  messages,
  message_icon,
  menu,
  meet,

  blank,
  arrow_left,
  arrow_right,
  check_box,
  check_circle,
  cross_mark,
  check_mark,
  ArrowUpRight,
  listings,
  offers,
  inspections,
  calender_icon,
  filter_icon,
  heart_icon,
  grey_share_icon,
  red_cross_mark,
  favourite_listing_icon,
  bathroom_icon,
  visa_payment_icon,
  ;

  factory AssetIcons.fromName(String? name) => AssetIcons.values.firstWhere(
        (e) => e.name == name,
        orElse: () => AssetIcons.blank,
      );
}

enum AssetIconType {
  monotone,
  multicolor,
  ;

  static const all = values;
}

extension AssetIconsX on AssetIcons {
  static const String _basePath = 'assets/icons';

  String asset(AssetIconType type) => '$_basePath/$name.svg';
}
