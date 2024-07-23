part of 'view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: CustomAppBar(
        title: 'Home',
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
