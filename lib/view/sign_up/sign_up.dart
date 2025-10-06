import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int currentStep = 0;
  final PageController _pageController = PageController();

  // Form controllers
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();

  bool agreedToTerms = false;
  String selectedLanguage = 'English';

  void nextStep() {
    if (currentStep < 5) {
      setState(() {
        currentStep++;
      });
      _pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
      _pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Progress Indicator
            if (currentStep > 0)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: previousStep,
                    ),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: (currentStep + 1) / 6,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF1A73E8),
                        ),
                        minHeight: 4,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${currentStep + 1}/6',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

            // Content
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildPhoneNumberScreen(),
                  _buildOTPScreen(),
                  _buildPersonalInfoScreen(),
                  _buildSetupPinScreen(),
                  _buildBankAccountScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Welcome Screen

  // Phone Number Screen
  Widget _buildPhoneNumberScreen() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Enter your mobile number',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'We\'ll send you a verification code',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 40),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Country Code
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('🇮🇳', style: TextStyle(fontSize: 20)),
                    SizedBox(width: 4),
                    Text(
                      '+91',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),

              // Phone Number Input
              Expanded(
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: 'Mobile number',
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFF1A73E8),
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          // Terms and Conditions
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: agreedToTerms,
                onChanged: (value) {
                  setState(() {
                    agreedToTerms = value ?? false;
                  });
                },
                activeColor: const Color(0xFF1A73E8),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    'I agree to Google Pay\'s Terms of Service and Privacy Policy',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Continue Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (phoneController.text.length == 10 && agreedToTerms)
                  ? nextStep
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A73E8),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
                disabledBackgroundColor: Colors.grey.shade300,
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // OTP Verification Screen
  Widget _buildOTPScreen() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Enter verification code',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'We sent a 6-digit code to +91 ${phoneController.text}',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 40),

          // OTP Input Fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              return SizedBox(
                width: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFF1A73E8),
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 5) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              );
            }),
          ),

          const SizedBox(height: 24),

          // Resend Code
          Center(
            child: TextButton(
              onPressed: () {
                // Resend OTP logic
              },
              child: const Text(
                'Resend Code',
                style: TextStyle(
                  color: Color(0xFF1A73E8),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const Spacer(),

          // Verify Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A73E8),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Verify',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Personal Info Screen
  Widget _buildPersonalInfoScreen() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Tell us about yourself',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'This information helps us secure your account',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 40),

          // Name Input
          TextField(
            controller: nameController,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelText: 'Full Name',
              hintText: 'Enter your full name',
              prefixIcon: const Icon(Icons.person_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF1A73E8),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Email Input
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Address',
              hintText: 'Enter your email',
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF1A73E8),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Your email will be used for receipts and notifications',
                    style: TextStyle(fontSize: 13, color: Colors.blue.shade900),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Continue Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty)
                  ? nextStep
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A73E8),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
                disabledBackgroundColor: Colors.grey.shade300,
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Setup PIN Screen
  Widget _buildSetupPinScreen() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Set up your UPI PIN',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Create a 6-digit PIN to secure your transactions',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 40),

          // PIN Input
          TextField(
            controller: pinController,
            keyboardType: TextInputType.number,
            obscureText: true,
            maxLength: 6,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: 'Enter PIN',
              hintText: 'Enter 6-digit PIN',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: const Icon(Icons.visibility_off_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF1A73E8),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Confirm PIN Input
          TextField(
            controller: confirmPinController,
            keyboardType: TextInputType.number,
            obscureText: true,
            maxLength: 6,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: 'Confirm PIN',
              hintText: 'Re-enter your PIN',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: const Icon(Icons.visibility_off_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF1A73E8),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.warning_amber_outlined,
                  color: Colors.orange.shade700,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Never share your PIN with anyone, including Google Pay support',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.orange.shade900,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Continue Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  (pinController.text.length == 6 &&
                      confirmPinController.text.length == 6 &&
                      pinController.text == confirmPinController.text)
                  ? nextStep
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A73E8),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
                disabledBackgroundColor: Colors.grey.shade300,
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Bank Account Screen
  Widget _buildBankAccountScreen() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Link your bank account',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Select your bank to link with Google Pay',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 32),

          // Search Bank
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for your bank',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF1A73E8),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Popular Banks',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 16),

          // Bank List
          Expanded(
            child: ListView(
              children: [
                _buildBankItem('State Bank of India', 'SBI', Colors.blue),
                _buildBankItem('HDFC Bank', 'HDFC', Colors.red),
                _buildBankItem('ICICI Bank', 'ICICI', Colors.orange),
                _buildBankItem('Axis Bank', 'AXIS', Colors.purple),
                _buildBankItem(
                  'Kotak Mahindra Bank',
                  'KOTAK',
                  Colors.red.shade900,
                ),
                _buildBankItem(
                  'Punjab National Bank',
                  'PNB',
                  Colors.blue.shade900,
                ),
                _buildBankItem('Bank of Baroda', 'BOB', Colors.orange.shade800),
                _buildBankItem('Yes Bank', 'YES', Colors.blue.shade700),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Skip for Now Button
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                // Navigate to home
                _showSuccessDialog();
              },
              child: const Text(
                'Skip for Now',
                style: TextStyle(
                  color: Color(0xFF1A73E8),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF1A73E8)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBankItem(String name, String code, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            //color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              code.substring(0, 1),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          _showSuccessDialog();
        },
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  size: 50,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Account Created!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your Google Pay account has been successfully created',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigate to home screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A73E8),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Start Using Google Pay',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    nameController.dispose();
    emailController.dispose();
    pinController.dispose();
    confirmPinController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
