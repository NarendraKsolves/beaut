import 'package:flutter/material.dart';
import 'package:beaut/experience_choice_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  String _selectedDomain = '@gmail.com';
  String? _selectedGender;
  String? _selectedEthnicity;
  String? _selectedLocation;
  bool _notificationsEnabled = true;

  DateTime? _selectedDate;

  static const Color _primaryColor = Color(0xFF8B0020);

  final List<String> _domains = [
    '@gmail.com',
    '@yahoo.com',
    '@outlook.com',
    '@hotmail.com',
    '@icloud.com',
  ];

  final List<String> _genders = [
    'Male',
    'Female',
    'Non-binary',
    'Prefer not to say',
  ];

  final List<String> _ethnicities = [
    'Asian',
    'Black or African American',
    'Hispanic or Latino',
    'White',
    'Native American',
    'Pacific Islander',
    'Mixed / Multiracial',
    'Prefer not to say',
  ];

  final List<String> _locations = [
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'India',
    'Germany',
    'France',
    'Japan',
    'Brazil',
    'Other',
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  Future<void> _pickBirthday() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1920),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: _primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _birthdayController.text =
            '${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Center(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black87, width: 1.5),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: const Text('Join Beaut.ai'),
      ),
      body: Column(
        children: [
          // Scrollable form content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // Email
                  _buildLabel('Email'),
                  const SizedBox(height: 8),
                  _buildEmailField(),

                  const SizedBox(height: 20),

                  // Full name
                  _buildLabel('Full name'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: _fullNameController,
                    hintText: '',
                  ),

                  const SizedBox(height: 20),

                  // Birthday
                  _buildLabel('Birthday'),
                  const SizedBox(height: 8),
                  _buildBirthdayField(),

                  const SizedBox(height: 20),

                  // Gender
                  _buildLabel('Gender'),
                  const SizedBox(height: 8),
                  _buildDropdownField(
                    value: _selectedGender,
                    items: _genders,
                    onChanged: (val) => setState(() => _selectedGender = val),
                  ),

                  const SizedBox(height: 20),

                  // Ethnicity
                  _buildLabel('Ethnicity'),
                  const SizedBox(height: 8),
                  _buildDropdownField(
                    value: _selectedEthnicity,
                    items: _ethnicities,
                    onChanged: (val) =>
                        setState(() => _selectedEthnicity = val),
                  ),

                  const SizedBox(height: 20),

                  // Location
                  _buildLabel('Location'),
                  const SizedBox(height: 8),
                  _buildDropdownField(
                    value: _selectedLocation,
                    items: _locations,
                    onChanged: (val) => setState(() => _selectedLocation = val),
                  ),

                  const SizedBox(height: 28),

                  // Notifications section
                  const Text(
                    'Let us slide into your notifications with beauty gold.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Notification toggle card
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.black12, width: 1),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Turn on notifications by Beaut.ai',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                          width: 48,
                          child: Switch(
                            value: _notificationsEnabled,
                            onChanged: (val) {
                              setState(() => _notificationsEnabled = val);
                            },
                            activeColor: Colors.white,
                            activeTrackColor: const Color(0xFF34C759),
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.black26,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // Bottom: Join button + Terms
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Join For Free button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ExperienceChoiceScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Join For Free',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Terms text
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                      children: [
                        const TextSpan(
                            text: "By continuing, you're agreeing to our "),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Reusable Builder Methods ----------

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildEmailField() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.black26, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                hintText: 'ruby',
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 16),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedDomain,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                  size: 22,
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() => _selectedDomain = newValue);
                  }
                },
                items: _domains.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.black26, width: 1),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black26,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
      ),
    );
  }

  Widget _buildBirthdayField() {
    return GestureDetector(
      onTap: _pickBirthday,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.black26, width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _birthdayController.text.isEmpty
                    ? ''
                    : _birthdayController.text,
                style: TextStyle(
                  fontSize: 15,
                  color: _birthdayController.text.isEmpty
                      ? Colors.black26
                      : Colors.black,
                ),
              ),
            ),
            const Icon(
              Icons.calendar_today_outlined,
              color: Colors.black54,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.black26, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: const Text(
            'Please select',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black26,
              fontWeight: FontWeight.w400,
            ),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black54,
            size: 22,
          ),
          isExpanded: true,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }
}
