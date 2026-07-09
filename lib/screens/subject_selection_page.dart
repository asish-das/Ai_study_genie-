import 'package:flutter/material.dart';

class SelectSubjectScreen extends StatefulWidget {
  const SelectSubjectScreen({super.key});

  @override
  State<SelectSubjectScreen> createState() => _SelectSubjectScreenState();
}

class _SelectSubjectScreenState extends State<SelectSubjectScreen> {
  List<String> selected = ["Computer Science", "Mathematics"];

  List subjects = [
    ["Computer Science", Icons.terminal],

    ["Mathematics", Icons.calculate],

    ["Biology", Icons.biotech],

    ["Physics", Icons.science],

    ["Aerospace", Icons.rocket_launch],
  ];

  List humanities = [
    ["World History", Icons.history_edu],

    ["Psychology", Icons.psychology],

    ["Philosophy", Icons.gavel],

    ["Literature", Icons.menu_book],
  ];

  List languages = ["Spanish", "Mandarin", "French", "Latin", "Japanese"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f9fb),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),

        decoration: BoxDecoration(
          color: const Color(0xfff7f9fb),

          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.06)),
          ],

          borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              mainAxisSize: MainAxisSize.min,

              children: [
                const Icon(Icons.chevron_left),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Previous",
                    style: TextStyle(fontWeight: FontWeight.w600, color: Color.fromARGB(255, 50, 53, 57)),
                  ),
                ),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff004ac6),

                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 15,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),

              onPressed: () {},

              child: const Row(
                children: [
                  Text("Continue", style: TextStyle(color: Colors.white)),

                  SizedBox(width: 8),

                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // APP BAR
            Container(
              height: 64,

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(
                children: [
                  const Icon(Icons.arrow_back, color: Color(0xff004ac6)),

                  const SizedBox(width: 16),

                  const Text(
                    "Select Subjects",

                    style: TextStyle(
                      fontSize: 24,

                      fontWeight: FontWeight.bold,

                      color: Color(0xff004ac6),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 120),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Choose the areas you want to excel in. StudyGenie AI will personalize your learning path based on these interests.",

                      style: TextStyle(
                        fontSize: 16,

                        height: 1.5,

                        color: Color(0xff434655),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // SEARCH
                    TextField(
                      decoration: InputDecoration(
                        filled: true,

                        fillColor: Color(0xfff2f4f6),

                        prefixIcon: Icon(Icons.search),

                        hintText: "Search for subjects, courses, or topics...",

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),

                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    sectionTitle("STEM", "POPULAR"),

                    grid(subjects),

                    const SizedBox(height: 30),

                    const Text(
                      "Humanities",

                      style: TextStyle(
                        fontSize: 24,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    grid(humanities),

                    const SizedBox(height: 35),

                    languageBox(),

                    const SizedBox(height: 25),

                    businessBox(),

                    const SizedBox(height: 25),

                    customBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title, String tag) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,

          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        Text(
          tag,

          style: const TextStyle(
            color: Color(0xff004ac6),

            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget grid(List list) {
    return GridView.builder(
      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),

      itemCount: list.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        crossAxisSpacing: 15,

        mainAxisSpacing: 15,
      ),

      itemBuilder: (context, index) {
        bool active = selected.contains(list[index][0]);

        return GestureDetector(
          onTap: () {
            setState(() {
              active
                  ? selected.remove(list[index][0])
                  : selected.add(list[index][0]);
            });
          },

          child: Container(
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: active
                  ? const Color(0xff2563eb).withOpacity(.05)
                  : Colors.white,

              borderRadius: BorderRadius.circular(14),

              border: Border.all(
                width: 2,

                color: active ? const Color(0xff004ac6) : Colors.transparent,
              ),

              boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.05)),
              ],
            ),

            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: active
                            ? const Color(0xff2563eb)
                            : const Color(0xffe0e3e5),

                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Icon(
                        list[index][1],

                        color: active ? Colors.white : const Color(0xff434655),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      list[index][0],

                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                if (active)
                  const Positioned(
                    right: 0,

                    child: Icon(Icons.check_circle, color: Color(0xff004ac6)),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget languageBox() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(
        color: const Color(0xfff2f4f6),

        borderRadius: BorderRadius.circular(18),
      ),

      child: Wrap(
        spacing: 12,

        runSpacing: 12,

        children: languages
            .map((e) => Chip(label: Text(e), backgroundColor: Colors.white))
            .toList(),
      ),
    );
  }

  Widget businessBox() {
    return Container(
      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(
        color: const Color(0xff004ac6),

        borderRadius: BorderRadius.circular(18),
      ),

      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Business",

            style: TextStyle(
              color: Colors.white,

              fontSize: 24,

              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "Explore Economics, Finance, and Entrepreneurship.",

            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget customBox() {
    return Container(
      height: 160,

      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(
        color: Colors.black87,

        borderRadius: BorderRadius.circular(18),
      ),

      child: const Align(
        alignment: Alignment.bottomLeft,

        child: Column(
          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Custom Subject?",

              style: TextStyle(
                color: Colors.white,

                fontSize: 24,

                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "Upload your own syllabus or textbook to start learning.",

              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
