part of 'view.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white,
      appBar: const CustomAppBar(
        title: 'Message',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTitleSubtitle(
                title: 'Welcome! James',
                subtitle: 'All of your chats are available here.',
              ),
              const SizedBox(height: 16),
              const CustomTextFormField(
                hintText: 'Search messages...',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AssetIcon.monotone(
                    AssetIcons.search_icon,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<MessageDetailPage>(
                            builder: (_) => const MessageDetailPage(),
                          ),
                        );
                      },
                      child: CustomListTile(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        leading: Stack(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                'https://static.vecteezy.com/system/resources/previews/026/497/734/large_2x/businessman-on-isolated-png.png',
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: ShapeDecoration(
                                  shadows: [
                                    BoxShadow(
                                      color: context.white,
                                      spreadRadius: 6,
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
                        subtitleStyle: context.sixteen400,
                        title: 'Juanita Weaver',
                        subtitle: 'Is price negotiable?',
                        trailing: Text(
                          '2m ago',
                          style: context.sixteen400.withColor(context.grey500),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
