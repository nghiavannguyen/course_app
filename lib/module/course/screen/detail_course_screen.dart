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
      appBar: AppBar(
        title: const Text("Course Detail"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // TODO: Share logic
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          // ===== Phần đầu: Video hoặc placeholder =====
          // _buildVideoHeader(context),
          SizedBox(
            child: YoutubeVideoPlayer(
              youtubeUrl: "https://www.youtube.com/watch?v=kqtD5dpn9C8",
            ),
          ),

          // ===== TabBar (Lectures, Downloads, More) =====
          Container(
            color: Theme.of(context).canvasColor.withOpacity(0.1),
            child: TabBar(
              controller: _tabController,
              labelColor: Theme.of(context).textTheme.bodyLarge?.color,
              unselectedLabelColor: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6),
              indicatorColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: "Lectures"),
                Tab(text: "Downloads"),
                Tab(text: "More"),
              ],
            ),
          ),

          // ===== Nội dung TabBarView =====
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Lectures
                _buildLecturesTab(context),
                // Tab 2: Downloads
                _buildDownloadsTab(context),
                // Tab 3: More
                _buildMoreTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================
  // WIDGET: Phần đầu video
  // ============================
  Widget _buildVideoHeader(BuildContext context) {
    return Container(
      // color: Theme.of(context).canvasColor.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder video (tỷ lệ 16:9)
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                // Ảnh dummy mô phỏng video
                Image.network(
                  "https://dummyimage.com/600x400",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Nút play ở giữa (demo)
                Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white.withOpacity(0.8),
                    size: 64,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Tiêu đề Lecture
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Lecture : $videoTitle",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 8),

          // Nút "Get Started"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  // TODO: Bắt đầu xem
                },
                child: Text(
                  "Get Started",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Tên khoá học + Tác giả
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              courseTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              courseAuthor,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
        ],
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
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
