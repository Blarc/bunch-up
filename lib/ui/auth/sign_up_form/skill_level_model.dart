import 'package:flutter/material.dart';

class SkillLevel {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color color;

  const SkillLevel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
  });

  // Predefined skill levels
  static const SkillLevel beginner = SkillLevel(
    id: 'beginner',
    name: 'Beginner',
    description: 'Just starting out or new to the sport',
    icon: Icons.sentiment_satisfied_alt,
    color: Colors.green,
  );

  static const SkillLevel intermediate = SkillLevel(
    id: 'intermediate',
    name: 'Intermediate',
    description: 'Some experience and comfortable with basics',
    icon: Icons.thumb_up_alt,
    color: Colors.blue,
  );

  static const SkillLevel advanced = SkillLevel(
    id: 'advanced',
    name: 'Advanced',
    description: 'Highly skilled and experienced player',
    icon: Icons.star,
    color: Colors.orange,
  );

  static const SkillLevel competitive = SkillLevel(
    id: 'competitive',
    name: 'Competitive/Elite',
    description: 'Professional or competition level',
    icon: Icons.emoji_events,
    color: Colors.purple,
  );

  // List of all skill levels
  static const List<SkillLevel> allLevels = [
    beginner,
    intermediate,
    advanced,
    competitive,
  ];

  // Get skill level by ID
  static SkillLevel? getById(String id) {
    try {
      return allLevels.firstWhere((level) => level.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get skill level by name
  static SkillLevel? getByName(String name) {
    try {
      return allLevels.firstWhere(
            (level) => level.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SkillLevel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'SkillLevel{id: $id, name: $name, description: $description}';
  }
}