import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'add_new_card.dart';

class CardExpiredScreen extends StatelessWidget {
  const CardExpiredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Card Expired")),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.string(
                    cardExpiredIllustration, // ✅ sudah benar
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),

              const Spacer(flex: 2),

              ErrorInfo(
                title: "Card Expired!",
                description:
                    "Your card has expired. Please add a new card to continue.",
                btnText: "Add New Card",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNewCard(),
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

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.btnText,
    required this.press,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(description, textAlign: TextAlign.center),
        const SizedBox(height: 40),

        button ??
            ElevatedButton(
              onPressed: press,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: Text(btnText ?? "Retry"),
            ),
      ],
    );
  }
}

// ✅ NAMA SUDAH BENAR (Illustration)
const cardExpiredIllustration = '''
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
<circle cx="100" cy="100" r="80" fill="#E2E2E2"/>
</svg>
''';