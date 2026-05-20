# 🗄️ Bases de Datos Relacionales

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Bases de Datos Relacionales**. Este espacio está dedicado a compilar recursos, teoría, talleres y prácticas relacionadas con el aprendizaje y dominio de las bases de datos relacionales. Incluye material interactivo en archivos de Google Colab (Jupyter Notebooks), ejercicios de álgebra relacional y otros recursos útiles.

---

## 📑 Tabla de Contenidos

- [Acerca del Proyecto](#acerca-del-proyecto)
- [Estructura del Repositorio](#estructura-del-repositorio)
- [Tecnologías y Herramientas](#tecnologías-y-herramientas)
- [Cómo usar este repositorio](#cómo-usar-este-repositorio)
- [Licencia](#licencia)

---

## 📖 Acerca del Proyecto

Este repositorio sirve como un portafolio y biblioteca de estudio para el manejo de Bases de Datos Relacionales. Contiene desde fundamentos teóricos hasta la aplicación práctica de conceptos avanzados como integraciones con bases de datos en la nube (ej. **Neon**) y extensiones para búsquedas vectoriales (**pgvector**).

## 📂 Estructura del Repositorio

El contenido está organizado de manera lógica para facilitar el aprendizaje progresivo:

- 📁 **[`teoria/`](https://github.com/tutosrive/db-relacionales-2026-1/tree/main/teoria)**: Apuntes, conceptos clave y fundamentos sobre modelado y diseño de bases de datos relacionales.
- 📁 **[`Practicas/`](https://github.com/tutosrive/db-relacionales-2026-1/tree/main/Practicas)**: Ejercicios guiados y casos de uso prácticos para asentar conocimientos.
- 📁 **[`Talleres/`](https://github.com/tutosrive/db-relacionales-2026-1/tree/main/Talleres)**: Material utilizado en sesiones prácticas y talleres extensos.
- 📁 **[`ejercicios/`](https://github.com/tutosrive/db-relacionales-2026-1/tree/main/ejercicios)**: Retos de SQL, ejercicios de álgebra relacional y casos propuestos.
- 📁 **[`Repasos/`](https://github.com/tutosrive/db-relacionales-2026-1/tree/main/Repasos)**: Material de revisión y resumen de temas clave.
- 📁 **[`Referencias Proyectos/`](https://github.com/tutosrive/db-relacionales-2026-1/tree/main/Referencias%20Proyectos)**: Guías y documentos base para la elaboración de proyectos finales o integradores.
- 📁 **[`resources/`](https://github.com/tutosrive/db-relacionales-2026-1/tree/main/resources)**: Imágenes, scripts de bases de datos, datasets u otros archivos complementarios.
- 📁 **[`OneDrive/`](https://github.com/tutosrive/db-relacionales-2026-1/tree/main/OneDrive)**: Archivos y copias de seguridad enlazadas o exportadas.

## 🛠️ Tecnologías y Herramientas

El material de este repositorio hace uso de las siguientes tecnologías:

*   **Lenguajes:** SQL, Álgebra Relacional, Python (en Notebooks), HTML.
*   **Entornos de Desarrollo y Práctica:** 
    *   Jupyter Notebook / Google Colab.
    *   [Relax - Relational Algebra Calculator](https://dbis-uibk.github.io/relax/).
*   **Bases de Datos:** PostgreSQL.
*   **Plataformas y Extensiones:** [Neon serverless Postgres](https://neon.tech/) y `pgvector` para soporte de bases de datos vectoriales.

## 🚀 Cómo usar este repositorio

En este repositorio encontrarás dos enfoques principales de práctica:

### 1. Entorno de Álgebra Relacional (Relax)
Varios de los ejercicios teóricos y prácticos están diseñados para resolverse utilizando álgebra relacional. Para desarrollarlos:
- Utiliza la calculadora web **[Relax (Relational Algebra Calculator)](https://dbis-uibk.github.io/relax/)**.
- Puedes tomar los esquemas y grupos de datos proporcionados en los ejercicios y cargarlos en la plataforma de Relax para empezar a escribir y probar tus consultas algebraicas directamente en el navegador.

### 2. Entorno de Google Colab / Jupyter Notebooks
La mayoría de los talleres y scripts de implementación práctica están desarrollados en archivos `.ipynb`. Para usarlos:
1. Navega hasta el archivo que deseas explorar (por ejemplo, en la carpeta de talleres).
2. Tienes dos opciones para ejecutarlos:
   - **Opción A (Recomendada):** Sube el archivo `.ipynb` directamente a [Google Colab](https://colab.research.google.com/) para ejecutar el código sin necesidad de instalaciones locales.
   - **Opción B:** Si prefieres trabajar en local y tienes Jupyter instalado:
     ```bash
     git clone https://github.com/tutosrive/db-relacionales-2026-1.git
     cd db-relacionales
     jupyter notebook
     ```
3. Asegúrate de configurar cualquier variable de entorno o cadena de conexión (`DATABASE_URL`) si el notebook requiere conectarse a una base de datos externa como Neon.

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](./LICENSE) para obtener más detalles.