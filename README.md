# TPE-WEB2-2025
Trabajo Especial Web2 de Brandon Leiva y Tomas Gonzalez

## Integrantes
- Brandon Leiva: brandonjeremias1@hotmail.com
- Tomas Gonzalez: tomasgonzalez429030@gmail.com

---

## Descripción del proyecto
Nuestra página web es una **tienda de gorras y llantas** que ofrece variedad en distintos talles, colores y precios.  
El sitio está desarrollado en **PHP** utilizando **Smarty** como motor de plantillas y **MySQL** como base de datos.

---

## Estructura de la base de datos

Actualmente, contamos con **tres tablas**:

### 1. `categorias`
Atributos:  
- `id_categorias` (PK)  
- `nombre_categoria`  
- `descripcion`  

### 2. `productos`
Atributos:  
- `id_productos` (PK)  
- `id_categorias` (FK)  
- `nombre_producto`  
- `precio`  
- `talle`  
- `color`  

### 3. `usuario`
Atributos:  
- `id_usuario` (PK)  
- `nombre_usuario`  
- `email`  
- `pass` (hashed)  

> Las tablas `productos` y `categorias` se relacionan mediante `id_categorias`.

---

## Requisitos

- **Servidor web:** Apache (XAMPP recomendado)  
- **PHP:** >= 7.4  
- **MySQL / MariaDB**  
- **Smarty** (ya incluido en el proyecto en `libs/Smarty.class.php`)

---

## Instalación

1. **Clonar o descargar el proyecto** en la carpeta `htdocs` de XAMPP:

   ```bash
   git clone https://github.com/negroleiba/TPE-WEB2-2025.git
