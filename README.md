# AppNation Flutter Developer Case Study - TR

🚀 Bu uygulama, AppNation şirketinin Flutter Developer pozisyonu başvurusu için geliştirilmiş bir örnek projedir.

## Proje Detayları

- **State Management:** Bloc kullanılmıştır. Cubit kullanılmamıştır.
- **Routing:** Proje içerisinde routing sistemi kullanılmıştır.

### Uygulama Süreci

1. Uygulama açıldığında splash ekran görüntülenir ve köpek türleri ile ilgili API'den bilgiler çekilene kadar bekler.
2. Köpek türleri çekildikten sonra resimler paralel olarak alınır ve splash ekranı kapatılır.
3. Ana ekran, üstte basit bir app bar ve aşağıda bir bottom bar içerir. Kullanıcı bottom barda anasayfayı ve ayarlar ekranını açabilir.
   - **Anasayfa:**
     - Köpek cinsleri, fotoğrafları ve cins isimleriyle listelenir. Üstteki input ile cinsler filtrelenir.
     - Input kaydırılabilir ve uzatılabilir.
     - Öğelere tıklandığında bottom sheet çıkar ve Generate butonu ile bir cinse ait random bir fotoğraf gösterilir.
   - **Ayarlar:**
     - İşletim sistemi versiyonu, native kodlar ile Method Channel kullanılarak çekilip gösterilir.

### Kullanılan Paketler

```yaml
dependencies:
  bloc: ^8.1.3
  flutter_bloc: ^8.1.4
  dio: ^5.4.1
  path_provider: ^2.1.2
  flutter_svg: ^2.0.5
```

## Proje Yapısı


```
└── 📁lib
    └── 📁core
        └── 📁assets
            └── assets.dart
            └── icons.dart
        └── 📁base
            └── 📁manager
                └── network_manager.dart
        └── 📁constants
            └── app_color.dart
            └── app_statics.dart
            └── app_strings.dart
            └── app_text_style.dart
        └── 📁enum
            └── loading_status.dart
            └── service_path.dart
        └── 📁extensions
            └── 📁context
                └── context_extension.dart
            └── 📁string
                └── string_extension.dart
            └── 📁widget
                └── widget_extension.dart
        └── 📁routes
            └── routes.dart
    └── 📁data
        └── 📁models
            └── dog_breed_model.dart
            └── settings_item_model.dart
        └── 📁services
            └── dog_service.dart
    └── main.dart
    └── 📁presentation
        └── 📁home
            └── 📁bloc
                └── home_bloc.dart
                └── home_event.dart
                └── home_state.dart
            └── home_view.dart
            └── 📁widgets
                └── custom_textfield_widget.dart
                └── divider_widget.dart
                └── dog_alert_dialog_widget.dart
                └── dog_card_widget.dart
                └── no_result_widget.dart
                └── random_image_dailog_widget.dart
        └── 📁main
            └── 📁bloc
                └── main_bloc.dart
                └── main_event.dart
                └── main_state.dart
            └── main_view.dart
            └── 📁widgets
                └── custom_bottom_navbar_widget.dart
                └── custom_paint_widget.dart
        └── 📁settings
            └── 📁bloc
                └── settings_bloc.dart
                └── settings_event.dart
                └── settings_state.dart
            └── settings_view.dart
            ├── widgets
        └── 📁splash
            └── 📁bloc
                └── splash_bloc.dart
                └── splash_event.dart
                └── splash_state.dart
            └── splash_view.dart

```

## Notlar

- Proje için Figma tasarımının yanı sıra, Dog API'nin dökümantasyonu da incelenmiştir.
- Uygulama prototipi, Figma'daki tasarıma uygun olarak çalıştırılarak gözlemlenmiştir.

Uygulama geliştirme süreci ile ilgili herhangi bir sorunuz varsa, lütfen bana bildirin. Teşekkür ederim! 🙌

---


# AppNation Flutter Developer Case Study - EN

🚀 This application is an example project developed for the Flutter Developer position application at AppNation company.

## Project Details

- **State Management:** Bloc is used. Cubit is not used.
- **Routing:** Routing system is implemented within the project.

### Application Flow

1. When the application is opened, a splash screen is displayed, and it waits until information about dog breeds is fetched from the API.
2. After fetching dog breeds, images are fetched in parallel, and the splash screen is closed.
3. The main screen consists of a simple app bar at the top and a bottom bar at the bottom. Users can open the home page and settings screen from the bottom bar.
   - **Home Page:**
     - Dog breeds are listed with their photos and names. They can be filtered using the input at the top.
     - The input can be scrolled and extended.
     - Clicking on items will bring up a bottom sheet, and a random photo for that breed will be generated and shown to the user.
   - **Settings:**
     - The operating system version is retrieved using native code in the ios and android folders without using any package. It is displayed in this section.

### Used Packages

```yaml
dependencies:
  bloc: ^8.1.3
  flutter_bloc: ^8.1.4
  dio: ^5.4.1
  path_provider: ^2.1.2
  flutter_svg: ^2.0.5
```

## Project Structure
```
└── 📁lib
    └── 📁core
        └── 📁assets
            └── assets.dart
            └── icons.dart
        └── 📁base
            └── 📁manager
                └── network_manager.dart
        └── 📁constants
            └── app_color.dart
            └── app_statics.dart
            └── app_strings.dart
            └── app_text_style.dart
        └── 📁enum
            └── loading_status.dart
            └── service_path.dart
        └── 📁extensions
            └── 📁context
                └── context_extension.dart
            └── 📁string
                └── string_extension.dart
            └── 📁widget
                └── widget_extension.dart
        └── 📁routes
            └── routes.dart
    └── 📁data
        └── 📁models
            └── dog_breed_model.dart
            └── settings_item_model.dart
        └── 📁services
            └── dog_service.dart
    └── main.dart
    └── 📁presentation
        └── 📁home
            └── 📁bloc
                └── home_bloc.dart
                └── home_event.dart
                └── home_state.dart
            └── home_view.dart
            └── 📁widgets
                └── custom_textfield_widget.dart
                └── divider_widget.dart
                └── dog_alert_dialog_widget.dart
                └── dog_card_widget.dart
                └── no_result_widget.dart
                └── random_image_dailog_widget.dart
        └── 📁main
            └── 📁bloc
                └── main_bloc.dart
                └── main_event.dart
                └── main_state.dart
            └── main_view.dart
            └── 📁widgets
                └── custom_bottom_navbar_widget.dart
                └── custom_paint_widget.dart
        └── 📁settings
            └── 📁bloc
                └── settings_bloc.dart
                └── settings_event.dart
                └── settings_state.dart
            └── settings_view.dart
            ├── widgets
        └── 📁splash
            └── 📁bloc
                └── splash_bloc.dart
                └── splash_event.dart
                └── splash_state.dart
            └── splash_view.dart
```

## Notes

- In addition to the Figma design, the documentation of the Dog API has been reviewed.
- The application prototype has been observed to run in accordance with the Figma design.

If you have any questions about the application development process, please let me know. Thank you! 🙌


