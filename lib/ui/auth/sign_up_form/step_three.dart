import 'package:bunchup/domain/models/user/user.dart';
import 'package:bunchup/ui/auth/sign_up_form/user_form_state.dart';
import 'package:flutter/material.dart';

class SkillLevelUiModel {
  const SkillLevelUiModel({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
  });

  final String name;
  final String description;
  final IconData icon;
  final Color color;

  static const Map<SkillLevel, SkillLevelUiModel> _skillLevels = {
    SkillLevel.beginner: SkillLevelUiModel(
      name: 'Beginner',
      description: 'Just starting out or new to the sport',
      icon: Icons.sentiment_satisfied_alt,
      color: Colors.green,
    ),
    SkillLevel.intermediate: SkillLevelUiModel(
      name: 'Intermediate',
      description: 'Some experience and comfortable with basics',
      icon: Icons.thumb_up_alt,
      color: Colors.blue,
    ),
    SkillLevel.advanced: SkillLevelUiModel(
      name: 'Advanced',
      description: 'Highly skilled and experienced player',
      icon: Icons.star,
      color: Colors.orange,
    ),
    SkillLevel.competitive: SkillLevelUiModel(
      name: 'Competitive',
      description: 'Professional or competition level',
      icon: Icons.emoji_events,
      color: Colors.purple,
    ),
  };

  static SkillLevelUiModel get(SkillLevel skillLevel) {
    return _skillLevels[skillLevel]!;
  }

}

class SignUpFormStepThree extends StatefulWidget {
  const SignUpFormStepThree({
    required this.formKey,
    required this.formState,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final UserFormState formState;

  @override
  State<SignUpFormStepThree> createState() => _SignUpFormStepThreeState();
}

class _SignUpFormStepThreeState extends State<SignUpFormStepThree> {


  SkillLevel? _selectedSkillLevel;

  @override
  void initState() {
    super.initState();
    _selectedSkillLevel = widget.formState.skillLevel;
  }

  void _selectSkillLevel(SkillLevel skillLevel) {
    setState(() {
      _selectedSkillLevel = skillLevel;
      widget.formState.skillLevel = skillLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's Your Skill Level?",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This helps us find the best partners and events for you.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            if (_selectedSkillLevel == null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.orange[700]),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Please select your skill level',
                        style: TextStyle(color: Colors.orange[900]),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: SkillLevel.values.length,
              itemBuilder: (context, index) {
                final skillLevel = SkillLevel.values.elementAt(index);
                final skillLevelData = SkillLevelUiModel.get(skillLevel);
                final isSelected = _selectedSkillLevel == skillLevel;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () => _selectSkillLevel(skillLevel),
                    borderRadius: BorderRadius.circular(16),
                    child: Card(
                      elevation: isSelected ? 6 : 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: isSelected
                              ? skillLevelData.color
                              : Colors.grey[300]!,
                          width: isSelected ? 3 : 1,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: isSelected
                              ? skillLevelData.color.withOpacity(
                                  0.1,
                                )
                              : null,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? skillLevelData.color
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                skillLevelData.icon,
                                size: 32,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[600],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    skillLevelData.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: isSelected
                                          ? skillLevelData.color
                                          : Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    skillLevelData.description,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.check_circle,
                                color: skillLevelData.color,
                                size: 32,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
