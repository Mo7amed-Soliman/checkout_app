#  ✅ Checkout App

 ## Getting Started
   - This Flutter application integrates payment gateways Stripe and PayPal for processing online payments.
 ##  Learning Payment Gateway Integration
    - Stripe
    - Paypal
 ## 📱 UI 
 ![checkout_ui](https://github.com/user-attachments/assets/0bfb6507-a07f-480c-bd6e-8d38ee316089)
 
 ## 📁 File Structure
      lib
      ├── /Core
      │   ├── /chach (shared preferences)
      │   ├── /di    (dependency injection)
      │   ├── /networking
      │   ├── /utils
      │   └── /widgets
      └── /Features
          ├── checkout
          │   ├── /data
          |   |   ├── /models
          │   |   └── /repo
          │   ├── /ui
          |   |   ├── /manger
          │   |   └── /views
          └── /create customer
                
 ## 🛠 Dependencies
     dependencies:
      # networking
      dartz: ^0.10.1
      dio: ^5.6.0
      
      # state management
      flutter_bloc: ^8.1.6
      
      # payment gateway integration
      flutter_paypal_payment: ^1.0.6
      flutter_stripe: ^11.0.0
      
      # dependency injection
      get_it: ^7.7.0
      
      
      # simple data storage
      shared_preferences: ^2.3.2
      
      google_fonts: ^6.2.1        
      flutter_svg: ^2.0.10+1
      
## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/Mo7amed-Soliman/checkout_app.git
   ```
2. Navigate to the project directory:
   ```sh
   cd checkout_app
   ```
3. Get the dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```
## Contributing
1. Fork the repository.
2. Create a new branch:
   ```sh
   git checkout -b feature/your-feature-name
   ```
3. Make your changes and commit them:
   ```sh
   git add .
   git commit -m "Add your message"
   ```
4. Push to the branch:
   ```sh
   git push origin feature/your-feature-name
   ```
5. pull request
