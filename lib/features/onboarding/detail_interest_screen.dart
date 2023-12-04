import 'package:flutter/material.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/authentication/widgets/app_bar.dart';

Map<String, List<String>> interestsData = {
  "Music": [
    "Rap",
    "R&B& soul",
    "Grammy Awards",
    "Pop",
    "K-pop",
    "Music Industry",
    "Music News",
    "Regge",
    "HipHop",
    "Rap",
    "R&B& soul",
    "Grammy Awards",
    "Pop",
    "K-pop",
    "Music Industry",
    "Music News",
    "Regge",
    "HipHop",
  ],
  "Entertainment": [
    "Anime",
    "Harry Porter",
    "Movies",
    "Indiana Johns",
    "Squeeze Game",
    "Spring of Seoul"
  ],
  "Travel": ["Camping", "료칸", "Japan"],
};

class DetailedInterestScreen extends StatefulWidget {
  final List<String> selectedInterests;

  const DetailedInterestScreen({Key? key, required this.selectedInterests})
      : super(key: key);

  @override
  State<DetailedInterestScreen> createState() => _DetailedInterestScreenState();
}

class _DetailedInterestScreenState extends State<DetailedInterestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size32,
                    vertical: Sizes.size24,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.v32,
                      Text(
                        "What do you want to see on Twitter?",
                        style: TextStyle(
                          fontSize: Sizes.size28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Gaps.v16,
                      Text(
                        "Interests are used to personalize your experience and will be visible on your profile.",
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size2,
                          color: Colors.black54,
                        ),
                      ),
                      Gaps.v24,
                    ],
                  ),
                ),
              ]),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var index = 0;
                  index < widget.selectedInterests.length;
                  index++) ...[
                // Display the first section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.selectedInterests[index],
                      style: const TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v20,
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var interest in interestsData[
                                    widget.selectedInterests[index]] ??
                                [])
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Wrap(
                                  children: [
                                    Chip(
                                      label: Text(
                                        interest,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Gaps.v16,
                  ],
                ),

                // Display the second section below the first section
              ],
            ],
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size40,
                  vertical: Sizes.size12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade400,
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.black,
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
/*
class DetailedInterestScreen extends StatefulWidget {
  final List<String> selectedInterests;

  const DetailedInterestScreen({Key? key, required this.selectedInterests})
      : super(key: key);

  @override
  State<DetailedInterestScreen> createState() => _DetailedInterestScreenState();
}

class _DetailedInterestScreenState extends State<DetailedInterestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size32,
                    vertical: Sizes.size24,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.v32,
                      Text(
                        "What do you want to see on Twitter?",
                        style: TextStyle(
                          fontSize: Sizes.size28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Gaps.v16,
                      Text(
                        "Interests are used to personalize your experience and will be visible on your profile.",
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size2,
                          color: Colors.black54,
                        ),
                      ),
                      Gaps.v24,
                    ],
                  ),
                ),
              ]),
            ),
          ];
        },
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var key in widget.selectedInterests) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      key,
                      style: const TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 200, // Adjust the height as needed
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var interest in interestsData[key] ?? [])
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                  label: Text(interest),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Gaps.v16,
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*
class DetailedInterestScreen extends StatefulWidget {
  final List<String> selectedInterests;

  const DetailedInterestScreen({Key? key, required this.selectedInterests})
      : super(key: key);

  @override
  State<DetailedInterestScreen> createState() => _DetailedInterestScreenState();
}

class _DetailedInterestScreenState extends State<DetailedInterestScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          // scrollDirection: Axis.horizontal,
          child: Container(
            // width: MediaQuery.of(context).size.width * 1.5, // 화면의 1.5배로 설정
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
                  "Interests are used to personalize your experience and will be visible on your profile.",
                  style: TextStyle(
                    fontSize: Sizes.size16 + Sizes.size2,
                    color: Colors.black54,
                  ),
                ),
                Gaps.v24,
                for (var key in widget.selectedInterests) ...[
                  Text(
                    key,
                    style: const TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    spacing: Sizes.size8,
                    runSpacing: Sizes.size8,
                    children: [
                      for (var interest in interestsData[key] ?? [])
                        Chip(
                          label: Text(interest),
                        ),
                    ],
                  ),
                  Gaps.v16,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/