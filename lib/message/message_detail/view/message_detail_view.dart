part of 'view.dart';

class MessageDetailView extends StatefulWidget {
  const MessageDetailView({super.key});

  @override
  MessageDetailViewState createState() => MessageDetailViewState();
}

class MessageDetailViewState extends State<MessageDetailView> {
  List<Message> messages = [
    Message(
      text: ' Hi there!',
      isMe: false,
      time: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    Message(
      text:
          "I noticed your listing for the charming house on Elm Street. How's it going?",
      isMe: false,
      time: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    Message(
      text: "I'm doing well, thank you.",
      isMe: true,
      time: DateTime.now().subtract(const Duration(minutes: 3)),
    ),
    Message(
      text:
          "I'm delighted to hear you're interested in the property. It's been a lovely place to live.",
      isMe: true,
      time: DateTime.now().subtract(const Duration(minutes: 3)),
    ),

    // Add more messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white,
      appBar: CustomAppBar(
        customTitle: CustomListTile(
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/system/resources/previews/026/497/734/large_2x/businessman-on-isolated-png.png',
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: ShapeDecoration(
                    shadows: [
                      BoxShadow(
                        color: context.white,
                        spreadRadius: 4,
                      ),
                    ],
                    color: context.success500,
                    shape: CircleBorder(
                      side: BorderSide(
                        color: context.success500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          titleStyle: context.sixteen600,
          subtitleStyle: context.twelve400,
          title: 'James Smith',
          subtitle: 'Online',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The buyer has contacted about this property.',
              style: context.twelve400.withColor(context.grey300),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: context.grey200),
              ),
              // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/map_image.png',
                    height: 131,
                    width: 120,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomTitleSubtitle(
                            isSubtitle: false,
                            titleStyle: context.twelve600,
                            title: '429 HERITAGE DR, FORT MCMURRAY, AB T9K 1S4',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTitleSubtitle(
                                height: 0,
                                title: 'Units',
                                subtitle: '3 units',
                                titleStyle: context.twelve400
                                    .withColor(context.grey500),
                                subtitleStyle: context.twelve400,
                              ),
                              CustomTitleSubtitle(
                                height: 0,
                                title: 'Availability',
                                subtitle: 'For Sell',
                                titleStyle: context.twelve400
                                    .withColor(context.grey500),
                                subtitleStyle: context.twelve400,
                              ),
                            ],
                          ),
                          const CustomColorContainer(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomIconWithText(
                                  assetIcon: AssetIcon.monotone(
                                    AssetIcons.bedroom_icon,
                                  ),
                                  text: '2',
                                  sizeBoxWidth: 4,
                                  iconSize: 15,
                                ),
                                CustomIconWithText(
                                  assetIcon: AssetIcon.monotone(
                                    AssetIcons.bathroom_icon,
                                  ),
                                  text: '2',
                                  sizeBoxWidth: 4,
                                  iconSize: 15,
                                ),
                                CustomIconWithText(
                                  assetIcon: AssetIcon.monotone(
                                    AssetIcons.pool_icon,
                                  ),
                                  text: '1',
                                  sizeBoxWidth: 4,
                                  iconSize: 15,
                                ),
                                CustomIconWithText(
                                  assetIcon: AssetIcon.monotone(
                                    AssetIcons.square_feet,
                                  ),
                                  text: '6200 sq ft',
                                  sizeBoxWidth: 4,
                                  iconSize: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildMessage(messages[index], index);
                },
              ),
            ),
            _buildMessageInputField(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(Message message, int index) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        // width: 200,
        margin: EdgeInsets.only(bottom: index == 1 ? 16 : 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: message.isMe ? context.primary500 : Colors.transparent,
          border: message.isMe
              ? const Border()
              : Border.all(color: context.grey200),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          message.text,
          style: context.sixteen400
              .withColor(message.isMe ? context.white : context.grey900),
        ),
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: context.grey50,
        ),
        // color: Colors.white,
        child: CustomTextFormField(
          borderSide: BorderSide.none,
          focusedBorder: InputBorder.none,
          hintText: 'Type your message here...',
          suffixIcon: CustomElevatedButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            onPressed: () {},
            text: 'Send',
          ),
        ),
      ),
    );
  }

  // void _sendMessage(String text) {
  //   setState(() {
  //     messages.add(Message(text: text, isMe: true, time: DateTime.now()));
  //     // Simulate received message
  //     messages.add(
  //       Message(text: 'Received: $text', isMe: false, time: DateTime.now()),
  //     );
  //   });
  // }
}

class Message {
  Message({
    required this.text,
    required this.isMe,
    required this.time,
  });
  String text;
  bool isMe;
  DateTime time;
}
