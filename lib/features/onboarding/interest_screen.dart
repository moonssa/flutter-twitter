import 'package:flutter/material.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/authentication/widgets/app_bar.dart';
import 'package:twitter/features/onboarding/detail_interest_screen.dart';
import 'package:twitter/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Fashion & beauty",
  "Outdoors",
  "Arts & culture",
  "Animation & comics",
  "Businiss & finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
  "AI",
  "AAA",
  "BBB",
  "CCC",
  "DDD",
];

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _selectedInterests = [];
  int _selectedCount = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onInterestSelected(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
      _selectedCount = _selectedInterests.length;
    });
  }

  void _onSubmit() {
    if (_selectedCount < 3) return;
    print(_selectedInterests);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            DetailedInterestScreen(selectedInterests: _selectedInterests),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size32,
              vertical: Sizes.size24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                const Text(
                  "What do you want to see on Twitter?",
                  style: TextStyle(
                    fontSize: Sizes.size28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v16,
                const Text(
                  "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                  style: TextStyle(
                    fontSize: Sizes.size16 + Sizes.size2,
                    color: Colors.black54,
                  ),
                ),
                Gaps.v24,
                Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: [
                    for (var interest in interests)
                      InterestButton(
                          interest: interest,
                          onSelected: () {
                            _onInterestSelected(interest);
                          }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: Sizes.size6,
            // top: Sizes.size12,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$_selectedCount/3 selected",
                style: const TextStyle(
                  fontSize: Sizes.size20,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: _onSubmit,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size40,
                    vertical: Sizes.size12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: _selectedCount >= 3
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade400,
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
