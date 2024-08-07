part of 'view.dart';

class IdentityVerificationScreen extends StatelessWidget {
  const IdentityVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: const CustomAppBar(
          title: 'Identity Verification',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomProgressBar(),
                const SizedBox(height: 24),
                Text(
                  'Step 1 of 5',
                  style: context.sixteen500.withColor(context.primary500),
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomTitleSubtitle(
                  title: 'Upload your Documents',
                  subtitle:
                      'Please provide the necessary documents for verification.',
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Required Documents',
                  style: context.sixteen600.withColor(context.grey900),
                ),
                const SizedBox(
                  height: 16,
                ),
                const DocumentTypeWidget(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Passport',
                  style: context.sixteen400.withColor(context.grey900),
                ),
                const SizedBox(
                  height: 8,
                ),
                DottedBorderWidget(
                  title: 'Choose File to Upload',
                  icon: AssetIcons.upload_icon,
                  isFullWidth: true,
                  isSubtitleTrue: true,
                  subtitle: 'PDF , JPG or PNG , Max size 5 MBs',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Facial Recognition',
                  style: context.sixteen400.withColor(context.grey900),
                ),
                const SizedBox(
                  height: 8,
                ),
                DottedBorderWidget(
                  title: 'Take a Photo',
                  icon: AssetIcons.camera_icon,
                  isFullWidth: true,
                  isSubtitleTrue: true,
                  subtitle: 'PDF , JPG or PNG , Max size 5 MBs',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomElevatedButton.expanded(
                  text: 'Submit & Continue',
                  trailing: const AssetIcon.monotone(
                    AssetIcons.arrow_right,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const DocumentVerificationPage();
                    }));
                  },
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ));
  }
}

class DocumentTypeWidget extends StatelessWidget {
  const DocumentTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> propertyTypes = const [
      'Passport',
      'Driver License',
      'Id Card ',
    ];
    return CustomTextWithTextFieldWidget(
      text: 'Select Document Type',
      hintText: 'Select',
      onTap: (BuildContext context) => showModalBottomSheet<int>(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.0),
          ),
        ),
        builder: (BuildContext context) {
          return CustomBottomSheet(
            mainAxisSize: MainAxisSize.min,
            showDragHandle: false,
            customTitle: const CustomBottomSheetTile(
              title: 'Select Document Type',
            ),
            content: ListView.builder(
              primary: true,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTextWidget(
                  title: propertyTypes[index],
                  onPressed: () {
                    Navigator.pop(context, index);
                  },
                );
              },
            ),
          );
        },
      ).then((value) {
        if (value != null) {
          // context
          //     .read<AddPropertyCubit>()
          //     .changePropertyType(state.propertyTypes[value]);
        }
      }),
      suffixIcon: const AssetIcon.multicolor(
        AssetIcons.dropdown_icon,
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    super.key,
    this.selectedIndex = 1,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            decoration: ShapeDecoration(
              color:
                  index >= selectedIndex ? context.grey100 : context.primary500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
