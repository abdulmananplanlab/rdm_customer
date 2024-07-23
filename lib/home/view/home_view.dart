part of 'view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const BaseScaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        title: 'Home',
        leading: ,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
