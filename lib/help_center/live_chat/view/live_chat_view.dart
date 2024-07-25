part of 'view.dart';

class LiveChatView extends StatefulWidget {
  const LiveChatView({super.key});

  @override
  State<LiveChatView> createState() => _LiveChatViewState();
}

class _LiveChatViewState extends State<LiveChatView> {
  List<Message> messages = [
    Message(
      text: " Hi there! how can i help you?",
      isMe: false,
      time: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    Message(
      text:
          "i’m having some issues while scheduling my appointment for inspection.",
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
          trailing: CustomIconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
          titleStyle: context.sixteen600,
          subtitleStyle: context.twelve400,
          title: 'James Smith',
          subtitle: 'Support Agent',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: context.grey200),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                'Chat Started at 12:30 AM',
                style: context.twelve400.withColor(context.grey200),
              ),
            ),
          ),
          const VerticalSpacing(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              primary: true,
              shrinkWrap: true,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildMessage(messages[index], index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildMessageInputField(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message, int index) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          message.isMe
              ? const SizedBox.shrink()
              : const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/026/497/734/large_2x/businessman-on-isolated-png.png',
                  ),
                ),
          const HorizontalSpacing(),
          Flexible(
            child: Container(
              width: context.screenWidth * 0.7,
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
          ),
        ],
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
    this.image =
        'https://static.vecteezy.com/system/resources/previews/026/497/734/large_2x/businessman-on-isolated-png.png',
  });
  String text;
  String? image;
  bool isMe;
  DateTime time;
}
