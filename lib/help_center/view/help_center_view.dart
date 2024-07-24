part of 'view.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: const CustomAppBar(
        title: 'Help Center',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ContactUsWidget(),
            const VerticalSpacing(of: 30),
            Divider(color: context.grey200),
            const VerticalSpacing(),
            const FrequentlyAskingWidget(),
          ],
        ),
      ),
    );
  }
}
