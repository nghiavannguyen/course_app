import 'package:flutter/material.dart';

class Suggestion {
  final String title;
  final String price;
  Suggestion({required this.title, required this.price});

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        title: json['title'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
      };
}

class CourseDetail {
  final String id;
  final String title;
  final String subtitle;
  final String instructor;
  final double rating;
  final int reviews;
  final int students;
  final String thumbnail;
  final String tag;
  final Color tagColor;
  final String price;
  final List<String> whatYouLearn;
  final List<String> curriculumSections;
  final int totalHours;
  final int totalLectures;
  final int totalQuizzes;
  final int totalArticles;
  final int totalResources;
  final String description;
  final List<Suggestion> suggestions;

  CourseDetail({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.instructor,
    required this.rating,
    required this.reviews,
    required this.students,
    required this.thumbnail,
    required this.tag,
    required this.tagColor,
    required this.price,
    required this.whatYouLearn,
    required this.curriculumSections,
    required this.totalHours,
    required this.totalLectures,
    required this.totalQuizzes,
    required this.totalArticles,
    required this.totalResources,
    required this.description,
    required this.suggestions,
  });

  factory CourseDetail.fromJson(Map<String, dynamic> json) => CourseDetail(
        id: json['id'],
        title: json['title'],
        subtitle: json['subtitle'],
        instructor: json['instructor'],
        rating: (json['rating'] as num).toDouble(),
        reviews: json['reviews'],
        students: json['students'],
        thumbnail: json['thumbnail'],
        tag: json['tag'],
        tagColor: Color(int.parse(json['tagColor'].replaceFirst('#', '0xFF'))),
        price: json['price'],
        whatYouLearn: List<String>.from(json['whatYouLearn']),
        curriculumSections: List<String>.from(json['curriculumSections']),
        totalHours: json['totalHours'],
        totalLectures: json['totalLectures'],
        totalQuizzes: json['totalQuizzes'],
        totalArticles: json['totalArticles'],
        totalResources: json['totalResources'],
        description: json['description'],
        suggestions: (json['suggestions'] as List)
            .map((e) => Suggestion.fromJson(e))
            .toList(),
      );
}
