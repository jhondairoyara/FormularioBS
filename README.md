# FormularioBS: Sistema de Registro de Usuarios para Blessing Store

![Spring Boot](https://img.shields.io/badge/Spring_Boot-2.7.x-green?style=for-the-badge&logo=spring)
![Spring MVC](https://img.shields.io/badge/Spring_MVC-5.3.x-blue?style=for-the-badge&logo=spring)
![Spring Data JPA](https://img.shields.io/badge/Spring_Data_JPA-5.3.x-informational?style=for-the-badge&logo=spring)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange?style=for-the-badge&logo=mysql)
![Maven](https://img.shields.io/badge/Maven-3.8.x-red?style=for-the-badge&logo=apachemaven)
![Apache Tomcat](https://img.shields.io/badge/Apache_Tomcat-10.x-blueviolet?style=for-the-badge&logo=apachetomcat)
![Java](https://img.shields.io/badge/Java-11+-orange?style=for-the-badge&logo=openjdk)

## 📝 Descripción del Proyecto

`FormularioBS` es una aplicación web backend desarrollada con **Spring Boot**, diseñada para gestionar el registro de nuevos usuarios para la plataforma "Blessing Store". Este proyecto ilustra un flujo de trabajo básico de una aplicación web moderna, desde la captura de datos del usuario a través de un formulario **JSP** hasta su persistencia en una base de datos **MySQL**, utilizando **Spring MVC** y **Spring Data JPA**.

### Características Principales:

* **Registro de Usuarios:** Permite a los usuarios ingresar su información personal (nombres, apellidos, teléfono, dirección, ID de ciudad y fecha de nacimiento) a través de un formulario web intuitivo.
* **Persistencia de Datos:** Almacena de forma segura los detalles del usuario en una base de datos MySQL.
* **Manejo de Relaciones:** Establece una relación `ManyToOne` entre la entidad `Usuario`, `Departamento` y `Ciudad`, garantizando la integridad referencial y una estructura de datos normalizada.
* **Validación de Datos:** Incorpora validaciones en el lado del servidor y en el cliente (HTML5 `required` para campos obligatorios).
* **Retroalimentación al Usuario:** Muestra mensajes de éxito o error claros tras el intento de registro.
* **Arquitectura Modular:** Sigue el patrón Modelo-Vista-Controlador (MVC) con una clara separación de responsabilidades, facilitando el mantenimiento y la escalabilidad.

## 🚀 Tecnologías Utilizadas

* **Backend:**
    * **Spring Boot 2.7:** Framework principal para el desarrollo rápido de aplicaciones Spring.
    * **Spring MVC:** Componente de Spring para construir aplicaciones web siguiendo el patrón MVC.
    * **Spring Data JPA:** Abstracción para el acceso a datos que simplifica la implementación de repositorios basados en JPA.
    * **Hibernate:** Implementación de JPA para Object-Relational Mapping (ORM).
    * **Java 11+:** Lenguaje de programación.
* **Base de Datos:**
    * **MySQL 8.0:** Sistema de gestión de bases de datos relacionales robusto y ampliamente utilizado.
    * **MySQL Connector/J:** Driver JDBC para la conectividad entre Java y MySQL.
* **Servidor de Aplicaciones:**
    * **Apache Tomcat 10:** Contenedor de servlets ligero y de alto rendimiento para desplegar la aplicación WAR.
* **Build Tool:**
    * **Apache Maven 3.8:** Herramienta para la gestión de dependencias y el ciclo de vida del proyecto.
* **Frontend (Mínimo):**
    * **JSP (JavaServer Pages):** Tecnología de vistas para la interfaz de usuario del formulario.
    * **HTML5, CSS3:** Estructura y estilos para una experiencia de usuario básica pero funcional.

## ⚙️ Configuración del Entorno de Desarrollo

Para configurar y ejecutar este proyecto localmente, necesitarás los siguientes componentes:

1.  **JDK (Java Development Kit):** Versión 11 o superior (ej. OpenJDK 17).
2.  **Apache Maven:** Versión 3.8 o superior.
3.  **MySQL Server:** Versión 8.0 o superior.
4.  **Apache Tomcat:** Versión 10.
5.  **Un IDE:** `NetBeans` (recomendado, ya que el proyecto fue desarrollado y probado en este entorno), IntelliJ IDEA o Eclipse.

## 💾 Configuración de la Base de Datos

El proyecto interactúa con una base de datos MySQL llamada `mydb`. Sigue estos pasos para configurar tu entorno de base de datos:

1.  **Crea la base de datos `mydb`:**
    ```sql
    CREATE DATABASE mydb;
    ```

2.  **Selecciona la base de datos `mydb`:**
    ```sql
    USE mydb;
    ```

3.  **Ejecuta el script SQL para crear las tablas:**
    El script `mydb.sql` (ubicado en la raíz del repositorio) contiene la definición completa de la base de datos de Blessing Store, incluyendo todas las tablas y datos de ejemplo. Tienes dos opciones para configurar el esquema:

    * **Opción A (Recomendada para un entorno de desarrollo completo): Ejecutar el script completo `mydb.sql`**
        Copia y pega el contenido completo del archivo `mydb.sql` en tu cliente MySQL (MySQL Workbench, phpMyAdmin, o consola) y ejecútalo.
        **Advertencia:** Este script crea la base de datos completa de Blessing Store, que contiene muchas tablas (`carrito`, `producto`, `pago`, etc.) que **no son directamente utilizadas por este módulo** de registro de usuarios. Sin embargo, ejecutar el script completo es el método más sencillo y seguro para asegurar que todas las tablas, incluyendo las que tienen relaciones de clave externa (como `ciudad` y `departamento`), existan y estén pobladas con datos de ejemplo necesarios. Las tablas principales para este módulo (`usuario`, `ciudad`, `departamento`) se encuentran hacia el final del script.

    * **Opción B (Para un esquema mínimo, solo si entiendes las dependencias): Crear las tablas manualmente**
        Si solo necesitas las tablas estrictamente necesarias para este módulo y sus relaciones, puedes crear las siguientes tablas en el orden especificado, ya que `ciudad` depende de `departamento` y `usuario` depende de `ciudad`.

        * **`departamento`:**
            ```sql
            CREATE TABLE departamento (
              Id_Departamento INT NOT NULL AUTO_INCREMENT,
              Nom_Departamento VARCHAR(100) NOT NULL,
              PRIMARY KEY (`Id_Departamento`)
            ) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

            -- Opcional: Insertar datos de ejemplo para departamentos (ej. si no ejecutas el script completo)
            INSERT INTO `departamento` (`Id_Departamento`, `Nom_Departamento`) VALUES
            (1,'Amazonas'),(2,'Antioquia'),(3,'Arauca'),(4,'Atlántico'),(5,'Bolívar'),(6,'Boyacá'),(7,'Caldas'),(8,'Caquetá'),
            (9,'Casanare'),(10,'Cauca'),(11,'Cesar'),(12,'Chocó'),(13,'Córdoba'),(14,'Cundinamarca'),(15,'Guaviare'),
            (16,'Guainía'),(17,'Huila'),(18,'La Guajira'),(19,'Magdalena'),(20,'Meta'),(21,'Nariño'),(22,'Norte de Santander'),
            (23,'Putumayo'),(24,'Quindío'),(25,'Risaralda'),(26,'San Andrés y Providencia'),(27,'Santander'),(28,'Sucre'),
            (29,'Tolima'),(30,'Valle del Cauca'),(31,'Vaupés'),(32,'Vichada');
            ```

        * **`ciudad`:**
            ```sql
            CREATE TABLE ciudad (
              Id_Ciudad INT NOT NULL AUTO_INCREMENT,
              Nom_Ciudad VARCHAR(100) NOT NULL,
              Id_Departamento INT NOT NULL,
              PRIMARY KEY (`Id_Ciudad`),
              KEY `Id_Departamento_idx` (`Id_Departamento`),
              CONSTRAINT `fk_Ciudad_Departamento` FOREIGN KEY (`Id_Departamento`) REFERENCES `departamento` (`Id_Departamento`)
            ) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;

            -- Opcional: Insertar datos de ejemplo para ciudades (ej. si no ejecutas el script completo)
            INSERT INTO `ciudad` (`Id_Ciudad`, `Nom_Ciudad`, `Id_Departamento`) VALUES
            (21,'Leticia',1),(22,'Medellín',2),(23,'Arauca',3),(24,'Barranquilla',4),(25,'Cartagena',5),(26,'Tunja',6),(27,'Manizales',7),
            (28,'Florencia',8),(29,'Yopal',9),(30,'Popayán',10),(31,'Valledupar',11),(32,'Quibdó',12),(33,'Montería',13),
            (34,'Bogotá',14),(35,'San José del Guaviare',15),(36,'Inírida',16),(37,'Neiva',17),(38,'Riohacha',18),
            (39,'Santa Marta',19),(40,'Villavicencio',20),(41,'Pasto',21),(42,'Cúcuta',22),(43,'Mocoa',23),(44,'Armenia',24),
            (45,'Pereira',25),(46,'San Andrés',26),(47,'Bucaramanga',27),(48,'Sincelejo',28),(49,'Ibagué',29),(50,'Cali',30),
            (51,'Mitú',31),(52,'Puerto Carreño',32);
            ```

        * **`usuario`:**
            ```sql
            CREATE TABLE usuario (
              Id_Usuario INT NOT NULL AUTO_INCREMENT,
              Nombres VARCHAR(50) COLLATE utf8mb4_spanish_ci NOT NULL,
              Apellidos VARCHAR(50) COLLATE utf8mb4_spanish_ci NOT NULL,
              Telefono VARCHAR(15) COLLATE utf8mb4_spanish_ci NOT NULL,
              Direccion VARCHAR(150) COLLATE utf8mb4_spanish_ci NOT NULL,
              Id_Ciudad INT NOT NULL,
              Fecha_Nacimiento DATE NOT NULL,
              PRIMARY KEY (`Id_Usuario`),
              KEY `Id_Ciudad_idx` (`Id_Ciudad`),
              CONSTRAINT `fk_Usuario_Ciudad` FOREIGN KEY (`Id_Ciudad`) REFERENCES `ciudad` (`Id_Ciudad`)
            ) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
            ```

4.  **Configura las credenciales de la base de datos:**
    Abre el archivo `application.properties` y ajusta las propiedades `spring.datasource.username` y `spring.datasource.password` para que coincidan con el usuario y contraseña de tu base de datos MySQL. También puedes verificar o modificar la `spring.datasource.url` si tu base de datos no está en `localhost:3306` o tiene un nombre diferente a `mydb`.

## 📂 Estructura del Proyecto

La estructura del proyecto sigue las convenciones de Maven para un proyecto Spring Boot, con la adición de los recursos web en `src/main/webapp/`.

Este es un desglose de los archivos y directorios clave en el repositorio:

* **`FormularioBS/`** (Directorio raíz del proyecto)
    * `.gitattributes` 📝 (Configuración de atributos de Git, como finales de línea)
    * `.gitignore` 🚫 (Define qué archivos y carpetas debe ignorar Git)
    * `.mvn/` 🛠️
        * `wrapper/`
            * `maven-wrapper.jar` (Permite la ejecución de Maven sin instalación global)
            * `maven-wrapper.properties`
    * `mvnw` 📜 (Script de ejecución del Maven Wrapper para sistemas Unix/macOS)
    * `mvnw.cmd` 📜 (Script de ejecución del Maven Wrapper para sistemas Windows)
    * `mydb.sql` 🗄️ (Script SQL para la creación de la base de datos)
    * `pom.xml` 📦 (Archivo de configuración principal de Maven)
    * `README.md` 📖 (Este documento)
    * `src/` 💻 (Contiene todo el código fuente y recursos)
        * `main/`
            * `java/` ☕ (Clases Java de la aplicación)
                * `FormularioBS/`
                    * `controlador/` 🚦 (Controladores Spring MVC `@Controller`)
                        * `UsuarioController.java`
                    * `dao/` 🗃️ (Repositorios Spring Data JPA)
                        * `UsuarioRepository.java`
                    * `modelo/` 📊 (Clases de entidad JPA `@Entity`)
                        * `Ciudad.java`
                        * `Usuario.java`
                    * `FormularioBsApplication.java` (Clase principal de la aplicación Spring Boot)
            * `resources/` 📁 (Recursos de configuración y estáticos)
                * `static/` 🖼️ (Recursos estáticos como CSS, JS, imágenes, fuentes)
                    * `fonts/` ✒️
                        * `Poppins-Medium.ttf`
                    * `img/` 🏞️
                        * `icon-blessing-store.png`
                    * `styles/` 🎨
                        * `fonts.css`
                        * `index.css`
                * `application.properties` ⚙️ (Archivo de configuración de Spring Boot)
            * `webapp/` 🌐 (Contenido web para JSPs)
                * `META-INF/`
                    * `context.xml`
                * `WEB-INF/`
                    * `jsp/` 📄 (Archivos JSP de la interfaz de usuario)
                        * `index.jsp` (Formulario principal)
                        * `registro_exito.jsp`
                        * `registro_error.jsp`
        * `test/` 🧪 (Código fuente de las pruebas)
            * `java/`
                * `FormularioBS/`
                    * `FormularioBsApplicationTests.java`