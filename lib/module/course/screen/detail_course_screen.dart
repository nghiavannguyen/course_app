import 'package:core_utils/core_utils.dart';
import 'package:course_app/common/ui/app_app_bar.dart';
import 'package:course_app/module/course/widget/youtube_video_player.dart';
import 'package:flutter/material.dart';

class DetailCourseScreen extends StatefulWidget {
  const DetailCourseScreen({super.key});

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // DUMMY DATA
  final String videoTitle = "Important : Source Code Repository required for course";
  final String courseTitle = "Python OOP : Object Oriented Programming in Python";
  final String courseAuthor = "Deepali Srivastava";
  final String videoDuration = "06:55 mins";
  final List<SectionModel> sections = [
    SectionModel(
      title: "Section 1 - Introduction",
      lectures: [
        LectureItem(
          index: 1,
          title: "Important : Source Code Repository required for course",
          type: LectureType.video,
          durationOrQuestions: "Video - 06:55 mins",
        ),
        LectureItem(
          index: 2,
          title: "Introduction to Object Oriented Python",
          type: LectureType.video,
          durationOrQuestions: "Video - 06:55 mins",
        ),
      ],
    ),
    SectionModel(
      title: "Section 2 - Classes and Objects",
      lectures: [
        LectureItem(
          index: 3,
          title: "Classes and Objects",
          type: LectureType.video,
          durationOrQuestions: "Video - 14:06 mins",
        ),
        LectureItem(
          index: 4,
          title: "Classes and Objects ...... continued",
          type: LectureType.video,
          durationOrQuestions: "Video - 12:45 mins",
        ),
        LectureItem(
          index: 5,
          title: "Quiz - 1",
          type: LectureType.quiz,
          durationOrQuestions: "Quiz - 10 questions",
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar tạm thời với nút back, có thể tuỳ chỉnh theo nhu cầu
      appBar: AppAppBar(
        title: "Course Detail",
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // TODO: Share logic
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: YoutubeVideoPlayer(
                youtubeUrl: "https://www.youtube.com/watch?v=kqtD5dpn9C8",
              ),
            ),
            const SizedBox(height: 16),
            // TabBar
            Container(
              color: Theme.of(context).canvasColor.withOpacity(0.1),
              child: TabBar(
                controller: _tabController,
                labelColor: Theme.of(context).textTheme.bodyLarge?.color,
                unselectedLabelColor:
                    Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6),
                indicatorColor: context.primary,
                tabs: const [
                  Tab(text: "Lectures"),
                  Tab(text: "Downloads"),
                  Tab(text: "More"),
                ],
              ),
            ),
            // TabBarView
            SizedBox(
              height: MediaQuery.of(context).size.height, // Đảm bảo có chiều cao
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildLecturesTab(context),
                  _buildDownloadsTab(context),
                  _buildMoreTab(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================
  // WIDGET: Tab "Lectures"
  // ============================
  Widget _buildLecturesTab(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: sections.map((section) {
          return _buildSectionWidget(context, section);
        }).toList(),
      ),
    );
  }

  // Hiển thị 1 section + danh sách bài giảng
  Widget _buildSectionWidget(BuildContext context, SectionModel section) {
    return ExpansionTile(
      // Section title
      title: Text(
        section.title,
        style: context.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      // Danh sách bài giảng
      children: section.lectures.map((lecture) {
        return ListTile(
          leading: Icon(
            lecture.type == LectureType.video ? Icons.play_circle_fill : Icons.quiz,
          ),
          title: Text(
            "${lecture.index} ${lecture.title}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            lecture.durationOrQuestions,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7),
                ),
          ),
          trailing: const Icon(Icons.download_outlined),
          onTap: () {
            // TODO: Xem bài giảng
          },
        );
      }).toList(),
    );
  }

  // ============================
  // WIDGET: Tab "Downloads"
  // ============================
  Widget _buildDownloadsTab(BuildContext context) {
    return Center(
      child: Text(
        "No downloads yet",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  // ============================
  // WIDGET: Tab "More"
  // ============================
  Widget _buildMoreTab(BuildContext context) {
    return Center(
      child: Text(
        "More info here",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

// ===================================================================
// MODELs
// ===================================================================
enum LectureType { video, quiz }

class LectureItem {
  final int index;
  final String title;
  final LectureType type;
  final String durationOrQuestions;

  LectureItem({
    required this.index,
    required this.title,
    required this.type,
    required this.durationOrQuestions,
  });
}

class SectionModel {
  final String title;
  final List<LectureItem> lectures;

  SectionModel({
    required this.title,
    required this.lectures,
  });
}
