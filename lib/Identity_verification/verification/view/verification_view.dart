part of 'view.dart';

class DocumentVerificationScreen extends StatelessWidget {
  const DocumentVerificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Verification',
      ),
      backgroundColor: context.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomProgressBar(
                      selectedIndex: 1,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Step 1 of 5',
                      style: context.sixteen500.withColor(context.primary500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTitleSubtitle(
                      title: 'Upload Your Documents',
                      subtitle:
                          'Please provide the necessary documents for verification.',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const StatusListTile(
                      leadingText: 'Required Documents',
                      trailingText: 'Status',
                    ),
                    DocumentStatusWidget(
                      documentListTile: DocumentListTile.uploadDocument,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
            CustomElevatedButton.expanded(
              text: 'Upload Property Listing',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<RentAgreementPage>(
                    builder: (context) => const RentAgreementPage(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentStatusWidget extends StatelessWidget {
  const DocumentStatusWidget({
    super.key,
    required this.documentListTile,
  });
  final List<DocumentListTile> documentListTile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        shrinkWrap: true,
        primary: true,
        itemCount: documentListTile.length,
        itemBuilder: (context, index) {
          final items = documentListTile[index];
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: CustomListTile(
              width: 16,
              leading: Image.asset(
                'assets/images/file_icon.png',
                height: 48,
                width: 40,
                fit: BoxFit.cover,
              ),
              titleStyle: context.sixteen400,
              subtitleStyle: context.sixteen400.withColor(context.grey300),
              title: items.title,
              subtitle: items.subtitle,
              trailing: CustomElevatedButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                disabledBackgroundColor:
                    getColorBasedOnStatus(items.status).withOpacity(0.1),
                borderColor: getColorBasedOnStatus(items.status),
                disabledForegroundColor: getColorBasedOnStatus(items.status),
                text: items.status.name.capitalizeWords,
              ),
            ),
          );
        },
      ),
    );
  }
}

class StatusListTile extends StatelessWidget {
  const StatusListTile({
    super.key,
    required this.leadingText,
    required this.trailingText,
  });
  final String leadingText;
  final String trailingText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              leadingText,
              style: context.sixteen600,
            ),
            const Spacer(),
            Text(
              trailingText,
              style: context.sixteen600,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Divider(
          thickness: 1,
          color: context.grey300,
        ),
      ],
    );
  }
}

class DocumentListTile {
  const DocumentListTile({
    required this.title,
    required this.subtitle,
    required this.status,
  });
  final String title;
  final String subtitle;
  final VerificationStatus status;

  static List<DocumentListTile> uploadDocument = [
    const DocumentListTile(
      title: 'Passport',
      subtitle: '812KBs',
      status: VerificationStatus.approved,
    ),
    const DocumentListTile(
      title: "Image",
      subtitle: '312KBs',
      status: VerificationStatus.pending,
    ),
  ];
}

enum VerificationStatus {
  pending,
  approved,
  rejected,
}

Color getColorBasedOnStatus(VerificationStatus status) {
  if (status == VerificationStatus.approved) {
    return const Color(0xff4DAF50); // Green color
  } else if (status == VerificationStatus.rejected) {
    return const Color(0xffE00000); // Red color
  } else {
    return const Color(0xffF58300); // Default color for pending or unknown
  }
}
