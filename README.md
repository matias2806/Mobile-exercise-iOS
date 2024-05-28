# Mobile-exercise-iOS
This is a practice challenge provided by the company Conexa

[Exercise instruction](https://conexatech.notion.site/Mobile-Challenge-d1cd3b19418d45fd92780cc228c1ac86)

```
# Mobile Challenge

En esta instancia, queremos evaluar cómo aplicas tus conocimientos en aplicaciones mobile nativas. En este sentido, necesitamos que crees una aplicación de lectura de noticias.

## **Consideraciones importantes:**

- Envía el proyecto por correo electrónico en un plazo de 3 días.
- Diseña la interfaz a tu preferencia. La estética de la app no tendrá tanta importancia, pero asegúrate de posicionar correctamente los componentes de la interfaz de usuario y de que esté listo para usarse en pantallas de cualquier tamaño.
- Existen diversas maneras de resolver un mismo problema, queremos comprender tu razonamiento.

## **Introducción:**

La aplicación debe constar de 4 pantallas:

- Lista y buscador de noticias por título o contenido (Pantalla de Inicio)
- Detalles de la noticia seleccionada (Pantalla de Detalle)
- Lista de usuarios (Pantalla de Usuarios)
- Ubicación en el mapa del usuario (Pantalla de Mapa)

La app deberá ser una lista de noticias y una lista de usuarios. En la lista de usuarios debe mostrarse un botón que abra la pantalla de mapa, en donde con Google Maps debe mostrar la ubicación del usuario seleccionado. No hay restricciones en cuanto a los datos que se muestran tanto de las noticias como de los usuarios.

## **Requisitos técnicos:**

Usa Kotlin si estás aplicando para la posición Android y Swift si estás aplicando para la posición iOS.

No es preciso crear servicios back-end para las APIs. Utilizar la API pública JSONPlaceholder (https://www.jsonplaceholder.org/).

## **Documentación:**

Incluye un archivo README documentando tus decisiones (patrón de diseño, bibliotecas externas y otros). Esto nos facilitará entender tu razonamiento.

Cuando envíes tu solución al challenge, adjunta el proyecto en un archivo .ZIP junto al README mencionado.

## **Aspectos que evaluaremos:**

Arquitectura de la app

Buenas prácticas

Patrones de proyecto

Test unitarios
```

This project was built in 2 day, the views are built with SwiftUI.

The entities were created with the help of [app.quicktype.io](https://app.quicktype.io/)

The services are made natively without using third-party libraries such as [AlamoFire](https://github.com/Alamofire/Alamofire) 

The app has a tab bar to differentiate user flows from news flows.

# Evidence


|                     | Users flow                                                                                                       | News flow                                                                                                       |
|---------------------|-----------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| iPhone 15 Pro Max   | ![Simulator Screen Recording - iPhone 15 Pro Max - 2024-05-28 at 13 02 35](https://github.com/matias2806/Mobile-exercise-iOS/assets/36246975/3d460f20-58f8-410f-a578-9dbd6f2335ec) | ![Simulator Screen Recording - iPhone 15 Pro Max - 2024-05-28 at 13 01 58](https://github.com/matias2806/Mobile-exercise-iOS/assets/36246975/e3dceb19-6ede-4773-b98e-cfc04607694d) |
| iPhone SE (3rd generation) | ![Simulator Screen Recording - iPhone SE (3rd generation) - 2024-05-28 at 14 23 43](https://github.com/matias2806/Mobile-exercise-iOS/assets/36246975/22dee7f5-c228-48b8-9cf7-3d86c996a8e9) | ![Simulator Screen Recording - iPhone SE (3rd generation) - 2024-05-28 at 14 21 25](https://github.com/matias2806/Mobile-exercise-iOS/assets/36246975/71e8f201-0b40-4cff-ade3-31d8bbf458d3) |

# Test Coverage

![image](https://github.com/matias2806/Mobile-exercise-iOS/assets/36246975/e8331f10-539c-45b8-affa-1be9f0f82eca)


