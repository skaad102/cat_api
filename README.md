# Cat Breeds App 🐱

Una aplicación Flutter que muestra información detallada sobre diferentes razas de gatos utilizando The Cat API.

## 📱 Features

- ✅ Lista de razas de gatos con búsqueda en tiempo real
- ✅ Detalles completos de cada raza (temperamento, origen, descripción, etc.)
- ✅ Galería de imágenes con carrusel interactivo
- ✅ Visor de imágenes en pantalla completa con zoom
- ✅ Navegación fluida con Go Router
- ✅ Arquitectura limpia con separación de capas
- ✅ Manejo de estado reactivo con GetX

## 🛠 Tecnologías Utilizadas

- **Flutter** 3.32.5
- **Dart** ^3.6.1
- **GetX** ^4.7.2 - State Management
- **Go Router** ^16.1.0 - Navegación
- **HTTP** ^1.5.0 - Comunicación con API
- **URL Launcher** ^6.3.2 - Abrir enlaces externos


## 📸 Screenshots

### Pantalla Principal
<img src="screenshot/img1.jpeg" width="300" alt="Lista de razas con búsqueda">

### Pantalla de Detalles
<img src="screenshot/img2.jpeg" width="300" alt="Detalles de la raza">

### Galería de Imágenes
<img src="screenshot/img3.jpeg" width="300" alt="Carrusel de imágenes">

## 🚀 Cómo ejecutar el proyecto

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/skaad102/cat_api.git
   cd app_cat_pragma
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

## 🧪 Testing

Para ejecutar los tests:
```bash
flutter test
```

## 📋 API Reference

La aplicación consume [The Cat API](https://thecatapi.com/) para obtener:
- Lista de razas de gatos
- Información detallada de cada raza
- Imágenes de gatos por raza

## 🔧 Configuración adicional

El proyecto incluye:
- Splash screen nativo
- Iconos de aplicación personalizados
- Configuración para Android e iOS
