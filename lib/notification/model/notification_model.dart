class NotificationModel {
  const NotificationModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
  final String title;
  final String subtitle;
  final String imageUrl;

  static const List<NotificationModel> notification = [
    NotificationModel(
      title: 'Juanita Weaver submitted a new offer on your property',
      subtitle: '3 mins ago',
      imageUrl:
          'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    NotificationModel(
      title: 'Property listings has been rejected.',
      subtitle: '1 day ago',
      imageUrl: 'assets/images/reject_property.png',
    ),
    NotificationModel(
      title: 'James Smith has been verified as your Focal Person',
      subtitle: '2 day ago',
      imageUrl:
          'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    NotificationModel(
      title:
          'Jimmy John scheduled an inspection for your property on 10 September 2023',
      subtitle: '2 days ago',
      imageUrl:
          'https://images.pexels.com/photos/432059/pexels-photo-432059.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    NotificationModel(
      title: 'Joey Welch revised their submitted offer on your property.',
      subtitle: '1 week ago',
      imageUrl:
          'https://images.pexels.com/photos/1040880/pexels-photo-1040880.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    NotificationModel(
      title: 'Property listings has been approved.',
      subtitle: '1 day ago',
      imageUrl: 'assets/images/approved_property.png',
    ),
  ];
}
