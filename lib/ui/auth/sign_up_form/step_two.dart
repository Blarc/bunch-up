import 'package:bunchup/data/repositories/sport/sport_repository.dart';
import 'package:bunchup/domain/models/sport/sport.dart';
import 'package:bunchup/ui/auth/sign_up_form/user_form_state.dart';
import 'package:bunchup/ui/core/themes/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpFormStepTwo extends StatefulWidget {
  const SignUpFormStepTwo({
    required this.formKey,
    required this.formState,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final UserFormState formState;

  @override
  State<SignUpFormStepTwo> createState() => _SignUpFormStepTwoState();
}

class _SignUpFormStepTwoState extends State<SignUpFormStepTwo> {
  static const Map<String, IconData> sportIconMap = {
    'Football': Icons.sports_soccer,
    'Basketball': Icons.sports_basketball,
    'Tennis': Icons.sports_tennis,
    'Volleyball': Icons.sports_volleyball,
    'Baseball': Icons.sports_baseball,
    'Running': Icons.directions_run,
    'Swimming': Icons.pool,
    'Cycling': Icons.directions_bike,
    'Golf': Icons.golf_course,
    'Badminton': Icons.sports_tennis,
    'Table Tennis': Icons.sports_tennis,
    'Hockey': Icons.sports_hockey,
  };

  late Future<List<Sport>> _sportsFuture;

  @override
  void initState() {
    super.initState();
    final sportRepository = context.read<SportRepository>();
    _sportsFuture = sportRepository.getAllSports();
  }

  void _toggleSport(Sport sport) {
    setState(() {
      if (widget.formState.selectedSports.contains(sport)) {
        widget.formState.selectedSports.remove(sport);
      } else {
        widget.formState.selectedSports.add(sport);
      }
    });
  }

  bool _isSportSelected(Sport sport) {
    return widget.formState.selectedSports.contains(sport);
  }

  IconData _getIconForSport(String sportName) {
    return sportIconMap[sportName] ?? Icons.sports;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's Your Sport?",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Select the sports you're interested in",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            if (widget.formState.selectedSports.isEmpty)
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
                        'Please select at least one sport',
                        style: TextStyle(color: Colors.orange[900]),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            FutureBuilder<List<Sport>>(
              future: _sportsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Padding(
                      padding: Dimensions.of(context).edgeInsetsScreenSymmetric,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red[300],
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Failed to load sports',
                            style: TextStyle(color: Colors.red[700]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            snapshot.error.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text('No sports available'),
                    ),
                  );
                }

                final allSports = snapshot.data!;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: allSports.length,
                  itemBuilder: (context, index) {
                    final sport = allSports[index];
                    final isSelected = _isSportSelected(sport);

                    return InkWell(
                      onTap: () => _toggleSport(sport),
                      borderRadius: BorderRadius.circular(12),
                      child: Card(
                        elevation: isSelected ? 4 : 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.grey[300]!,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isSelected
                                ? Theme.of(
                                    context,
                                  ).primaryColor.withOpacity(0.1)
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _getIconForSport(sport.name),
                                size: 40,
                                color: isSelected
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey[600],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                sport.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
                                      : Colors.black87,
                                ),
                              ),
                              if (isSelected)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
