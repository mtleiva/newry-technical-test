# Cuestionario de Tecnologías Web - Respuestas

## 1. ¿Qué es HTML?

**HTML** (HyperText Markup Language) es el lenguaje de marcado estándar utilizado para crear y estructurar el contenido de páginas web. Es la base fundamental de cualquier sitio web y define la estructura semántica del contenido mediante el uso de etiquetas (tags).

### Características principales:

- **Lenguaje de marcado**: No es un lenguaje de programación, sino un lenguaje declarativo que utiliza etiquetas para definir elementos
- **Estructura jerárquica**: Organiza el contenido en una estructura de árbol (DOM - Document Object Model)
- **Semántica**: HTML5 introduce etiquetas semánticas que dan significado al contenido (`<header>`, `<nav>`, `<article>`, `<section>`, `<footer>`)
- **Multiplataforma**: Funciona en cualquier navegador y dispositivo

### Ejemplo básico:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Página Web</title>
</head>
<body>
    <header>
        <h1>Bienvenido a mi sitio</h1>
        <nav>
            <ul>
                <li><a href="#inicio">Inicio</a></li>
                <li><a href="#servicios">Servicios</a></li>
                <li><a href="#contacto">Contacto</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <article>
            <h2>Título del artículo</h2>
            <p>Este es un párrafo de ejemplo con contenido.</p>
        </article>
    </main>
    
    <footer>
        <p>&copy; 2024 Mi Sitio Web</p>
    </footer>
</body>
</html>
```

### Propósito:
HTML define **qué** es cada elemento (encabezado, párrafo, imagen, enlace), pero no cómo se ve visualmente (eso es responsabilidad de CSS) ni cómo se comporta (eso es responsabilidad de JavaScript).

---

## 2. ¿Qué es JavaScript?

**JavaScript** es un lenguaje de programación interpretado, dinámico y orientado a objetos que se ejecuta principalmente en el navegador web. Es el lenguaje que da interactividad y comportamiento dinámico a las páginas web.

### Características principales:

- **Lenguaje de programación completo**: Soporta programación orientada a objetos, funcional e imperativa
- **Interpretado**: Se ejecuta directamente en el navegador sin necesidad de compilación
- **Dinámico**: Las variables no tienen tipos fijos y pueden cambiar en tiempo de ejecución
- **Event-driven**: Responde a eventos del usuario (clicks, teclas, movimientos del mouse)
- **Asíncrono**: Soporta operaciones asíncronas mediante callbacks, promesas y async/await
- **Multiplataforma**: Además del navegador, se ejecuta en servidores (Node.js), aplicaciones móviles, desktop, etc.

### Capacidades:

- Manipular el DOM (agregar, modificar, eliminar elementos HTML)
- Responder a eventos del usuario
- Realizar peticiones HTTP (AJAX, Fetch API)
- Validar formularios
- Crear animaciones
- Almacenar datos localmente (LocalStorage, SessionStorage)
- Comunicación en tiempo real (WebSockets)

### Ejemplo básico:

```javascript
// Variables y tipos de datos
let nombre = "Juan";
const edad = 30;
let activo = true;

// Funciones
function saludar(nombre) {
    return `Hola, ${nombre}!`;
}

// Arrow functions (ES6+)
const calcularArea = (base, altura) => base * altura;

// Manipulación del DOM
document.addEventListener('DOMContentLoaded', function() {
    const boton = document.getElementById('miBoton');
    
    boton.addEventListener('click', function() {
        alert('¡Botón clickeado!');
        document.querySelector('h1').textContent = 'Título modificado';
    });
});

// Petición asíncrona con Fetch API
async function obtenerDatos() {
    try {
        const response = await fetch('https://api.ejemplo.com/datos');
        const datos = await response.json();
        console.log(datos);
    } catch (error) {
        console.error('Error:', error);
    }
}

// Programación orientada a objetos
class Usuario {
    constructor(nombre, email) {
        this.nombre = nombre;
        this.email = email;
    }
    
    saludar() {
        console.log(`Hola, soy ${this.nombre}`);
    }
}

const usuario = new Usuario('María', 'maria@email.com');
usuario.saludar();
```

### Propósito:
JavaScript define **cómo se comporta** la página web, añadiendo interactividad, lógica de negocio y comunicación con servidores.

---

## 3. ¿Qué es CSS?

**CSS** (Cascading Style Sheets - Hojas de Estilo en Cascada) es un lenguaje de diseño utilizado para definir la presentación visual y el estilo de documentos HTML. Controla cómo se ven los elementos en la página.

### Características principales:

- **Separación de contenido y presentación**: Permite mantener el HTML limpio y enfocado en la estructura
- **Cascada**: Los estilos se aplican en cascada según especificidad y orden
- **Selectores**: Permiten seleccionar elementos específicos para aplicar estilos
- **Responsive Design**: Media queries permiten adaptar el diseño a diferentes tamaños de pantalla
- **Animaciones y transiciones**: CSS3 permite crear efectos visuales sin JavaScript
- **Flexbox y Grid**: Sistemas modernos de layout para diseños complejos

### Sintaxis básica:

```css
/* Selector de elemento */
h1 {
    color: #333;
    font-size: 2rem;
    font-family: 'Arial', sans-serif;
}

/* Selector de clase */
.boton-primario {
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.boton-primario:hover {
    background-color: #0056b3;
}

/* Selector de ID */
#encabezado-principal {
    background: linear-gradient(to right, #667eea, #764ba2);
    padding: 20px;
}

/* Flexbox para layout */
.contenedor {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
}

/* Grid para layouts complejos */
.galeria {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 15px;
}

/* Media queries para responsive design */
@media (max-width: 768px) {
    .contenedor {
        flex-direction: column;
    }
    
    h1 {
        font-size: 1.5rem;
    }
}

/* Animaciones */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.elemento-animado {
    animation: fadeIn 0.5s ease-in-out;
}

/* Variables CSS (Custom Properties) */
:root {
    --color-primario: #007bff;
    --espaciado: 1rem;
}

.tarjeta {
    background-color: var(--color-primario);
    padding: var(--espaciado);
}
```

### Propósito:
CSS define **cómo se ve** el contenido HTML, controlando colores, tipografía, espaciado, layout, animaciones y adaptabilidad a diferentes dispositivos.

---

## 4. ¿Qué es Bootstrap?

**Bootstrap** es un framework de CSS de código abierto desarrollado originalmente por Twitter. Es el framework front-end más popular del mundo para desarrollar sitios web responsive y mobile-first de manera rápida y eficiente.

### Características principales:

- **Sistema de Grid responsive**: Grid de 12 columnas que se adapta automáticamente a diferentes tamaños de pantalla
- **Componentes prediseñados**: Botones, formularios, navegación, modales, cards, etc.
- **Mobile-first**: Diseñado primero para dispositivos móviles
- **Personalizable**: Se puede personalizar mediante variables Sass
- **JavaScript incluido**: Componentes interactivos sin necesidad de escribir JavaScript
- **Compatibilidad cross-browser**: Funciona en todos los navegadores modernos
- **Documentación extensa**: Muy bien documentado con ejemplos

### Ventajas:

1. **Desarrollo rápido**: Componentes listos para usar
2. **Consistencia**: Diseño uniforme en toda la aplicación
3. **Responsive por defecto**: Adaptación automática a diferentes dispositivos
4. **Comunidad grande**: Muchos recursos, temas y plugins disponibles
5. **Mantenimiento activo**: Actualizaciones regulares

### Ejemplo de uso:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejemplo Bootstrap</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar responsive -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Mi Sitio</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Servicios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contacto</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Container con Grid System -->
    <div class="container mt-5">
        <div class="row">
            <!-- Columna que ocupa 12 espacios en móvil, 6 en tablet y desktop -->
            <div class="col-12 col-md-6 mb-4">
                <div class="card">
                    <img src="imagen1.jpg" class="card-img-top" alt="Imagen">
                    <div class="card-body">
                        <h5 class="card-title">Título de la tarjeta</h5>
                        <p class="card-text">Descripción del contenido de la tarjeta.</p>
                        <a href="#" class="btn btn-primary">Ver más</a>
                    </div>
                </div>
            </div>
            
            <div class="col-12 col-md-6 mb-4">
                <div class="card">
                    <img src="imagen2.jpg" class="card-img-top" alt="Imagen">
                    <div class="card-body">
                        <h5 class="card-title">Otra tarjeta</h5>
                        <p class="card-text">Más contenido interesante aquí.</p>
                        <a href="#" class="btn btn-success">Acción</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Formulario con estilos Bootstrap -->
        <div class="row mt-4">
            <div class="col-12 col-lg-8 mx-auto">
                <form>
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" placeholder="Tu nombre">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="tu@email.com">
                    </div>
                    <div class="mb-3">
                        <label for="mensaje" class="form-label">Mensaje</label>
                        <textarea class="form-control" id="mensaje" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Enviar</button>
                </form>
            </div>
        </div>

        <!-- Modal -->
        <button type="button" class="btn btn-info mt-4" data-bs-toggle="modal" data-bs-target="#miModal">
            Abrir Modal
        </button>

        <div class="modal fade" id="miModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Título del Modal</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p>Contenido del modal aquí.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle (incluye Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
```

### Clases útiles de Bootstrap:

- **Spacing**: `m-3` (margin), `p-4` (padding), `mt-2` (margin-top), `mb-3` (margin-bottom)
- **Display**: `d-flex`, `d-none`, `d-block`, `d-inline`
- **Colores**: `text-primary`, `bg-success`, `text-white`, `bg-danger`
- **Tipografía**: `fs-1` (font-size), `fw-bold` (font-weight), `text-center`
- **Grid**: `col-12`, `col-md-6`, `col-lg-4`, `row`, `container`
- **Flexbox**: `justify-content-center`, `align-items-center`, `flex-column`

### Propósito:
Bootstrap acelera el desarrollo web proporcionando componentes y estilos predefinidos, garantizando un diseño responsive y profesional sin necesidad de escribir mucho CSS desde cero.

---

## Resumen

| Tecnología | Propósito | Analogía |
|------------|-----------|----------|
| **HTML** | Estructura y contenido | Esqueleto de un edificio |
| **CSS** | Presentación visual | Pintura y decoración del edificio |
| **JavaScript** | Comportamiento e interactividad | Electricidad y sistemas del edificio |
| **Bootstrap** | Framework de diseño rápido | Kit de construcción prefabricado |

Estas cuatro tecnologías trabajan juntas para crear experiencias web modernas, interactivas y visualmente atractivas.


---

## 5. ¿Qué es MVC?

**MVC** (Model-View-Controller) es un patrón de arquitectura de software que separa una aplicación en tres componentes principales interconectados. Este patrón se utiliza para organizar el código de manera que sea más mantenible, escalable y testeable.

### Los tres componentes:

#### 1. **Model (Modelo)**
- Representa los datos y la lógica de negocio de la aplicación
- Gestiona el acceso a la base de datos
- Contiene las reglas de validación
- Notifica a la vista cuando los datos cambian
- **Responsabilidad**: "¿Qué datos tengo y cómo los manipulo?"

#### 2. **View (Vista)**
- Representa la interfaz de usuario (UI)
- Muestra los datos del modelo al usuario
- Envía las acciones del usuario al controlador
- No contiene lógica de negocio
- **Responsabilidad**: "¿Cómo muestro los datos al usuario?"

#### 3. **Controller (Controlador)**
- Actúa como intermediario entre el modelo y la vista
- Recibe las peticiones del usuario desde la vista
- Procesa la entrada del usuario
- Actualiza el modelo según sea necesario
- Selecciona qué vista mostrar
- **Responsabilidad**: "¿Cómo respondo a las acciones del usuario?"

### Flujo de trabajo MVC:

```
Usuario → Vista → Controlador → Modelo
                      ↓           ↓
                    Vista ← Datos actualizados
                      ↓
                   Usuario
```

1. El **usuario** interactúa con la **Vista** (hace clic en un botón, envía un formulario)
2. La **Vista** envía la acción al **Controlador**
3. El **Controlador** procesa la petición y actualiza el **Modelo** si es necesario
4. El **Modelo** realiza operaciones con los datos (consultas a BD, validaciones)
5. El **Controlador** selecciona la **Vista** apropiada y le pasa los datos del **Modelo**
6. La **Vista** renderiza los datos y se muestra al **usuario**

### Ventajas del patrón MVC:

1. **Separación de responsabilidades**: Cada componente tiene una función específica
2. **Mantenibilidad**: Cambios en la UI no afectan la lógica de negocio
3. **Reutilización**: Los modelos pueden usarse en diferentes vistas
4. **Testabilidad**: Cada componente puede probarse independientemente
5. **Desarrollo paralelo**: Diferentes equipos pueden trabajar en cada capa
6. **Escalabilidad**: Fácil agregar nuevas funcionalidades

### Ejemplo conceptual:

Imaginemos una aplicación de gestión de productos:

**Modelo (Product.cs)**:
```csharp
public class Product
{
    public int Id { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
    public int Stock { get; set; }
    
    // Lógica de negocio
    public bool IsAvailable() => Stock > 0;
    public decimal CalculateDiscount(decimal percentage) => Price * (1 - percentage / 100);
}
```

**Controlador (ProductController.cs)**:
```csharp
public class ProductController
{
    public IActionResult Index()
    {
        // Obtiene datos del modelo
        var products = GetAllProducts();
        
        // Pasa los datos a la vista
        return View(products);
    }
    
    public IActionResult Details(int id)
    {
        var product = GetProductById(id);
        return View(product);
    }
    
    [HttpPost]
    public IActionResult Create(Product product)
    {
        if (ModelState.IsValid)
        {
            SaveProduct(product);
            return RedirectToAction("Index");
        }
        return View(product);
    }
}
```

**Vista (Index.cshtml)**:
```html
@model List<Product>

<h1>Lista de Productos</h1>

<table>
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        @foreach (var product in Model)
        {
            <tr>
                <td>@product.Name</td>
                <td>@product.Price.ToString("C")</td>
                <td>@product.Stock</td>
                <td>
                    <a href="/Product/Details/@product.Id">Ver</a>
                    <a href="/Product/Edit/@product.Id">Editar</a>
                </td>
            </tr>
        }
    </tbody>
</table>
```

### Frameworks que implementan MVC:

- **ASP.NET MVC / ASP.NET Core MVC** (C#)
- **Ruby on Rails** (Ruby)
- **Django** (Python)
- **Laravel** (PHP)
- **Spring MVC** (Java)
- **Angular** (JavaScript/TypeScript - variante MVVM)

### Variantes del patrón:

- **MVP** (Model-View-Presenter): El Presenter tiene más control sobre la vista
- **MVVM** (Model-View-ViewModel): Usado en aplicaciones con data binding
- **MVT** (Model-View-Template): Usado en Django

**Ver el ejemplo completo de implementación en la carpeta `MVCExample/`**



---

## 6. ¿Qué es REST?

**REST** (Representational State Transfer) es un estilo de arquitectura de software para sistemas distribuidos, especialmente servicios web. Fue definido por Roy Fielding en su tesis doctoral en 2000. REST no es un protocolo ni un estándar, sino un conjunto de principios arquitectónicos.

### Principios fundamentales de REST:

#### 1. **Cliente-Servidor**
- Separación entre el cliente (interfaz de usuario) y el servidor (almacenamiento de datos)
- Permite que evolucionen independientemente

#### 2. **Sin estado (Stateless)**
- Cada petición del cliente al servidor debe contener toda la información necesaria
- El servidor no guarda el estado de la sesión del cliente
- Mejora la escalabilidad

#### 3. **Cacheable**
- Las respuestas deben indicar si pueden ser cacheadas o no
- Mejora el rendimiento y la escalabilidad

#### 4. **Interfaz uniforme**
- Identificación de recursos mediante URIs
- Manipulación de recursos mediante representaciones (JSON, XML)
- Mensajes auto-descriptivos
- HATEOAS (Hypermedia as the Engine of Application State)

#### 5. **Sistema en capas**
- La arquitectura puede estar compuesta por capas jerárquicas
- Cada capa solo conoce la capa con la que interactúa directamente

#### 6. **Código bajo demanda (opcional)**
- Los servidores pueden extender la funcionalidad del cliente enviando código ejecutable

### Métodos HTTP en REST:

| Método | Operación CRUD | Descripción | Idempotente |
|--------|----------------|-------------|-------------|
| **GET** | Read | Obtener un recurso o colección | Sí |
| **POST** | Create | Crear un nuevo recurso | No |
| **PUT** | Update | Actualizar un recurso completo | Sí |
| **PATCH** | Update | Actualizar parcialmente un recurso | No |
| **DELETE** | Delete | Eliminar un recurso | Sí |
| **HEAD** | - | Obtener metadatos sin el cuerpo | Sí |
| **OPTIONS** | - | Obtener métodos soportados | Sí |

### Códigos de estado HTTP:

#### 2xx - Éxito
- **200 OK**: Petición exitosa
- **201 Created**: Recurso creado exitosamente
- **204 No Content**: Éxito sin contenido en la respuesta

#### 3xx - Redirección
- **301 Moved Permanently**: Recurso movido permanentemente
- **304 Not Modified**: Recurso no modificado (cache)

#### 4xx - Errores del cliente
- **400 Bad Request**: Petición mal formada
- **401 Unauthorized**: No autenticado
- **403 Forbidden**: No autorizado
- **404 Not Found**: Recurso no encontrado
- **409 Conflict**: Conflicto con el estado actual

#### 5xx - Errores del servidor
- **500 Internal Server Error**: Error interno del servidor
- **503 Service Unavailable**: Servicio no disponible

### Diseño de URIs RESTful:

#### Buenas prácticas:

```
✅ Correcto:
GET    /api/products              - Obtener todos los productos
GET    /api/products/123          - Obtener producto con ID 123
POST   /api/products              - Crear nuevo producto
PUT    /api/products/123          - Actualizar producto 123
PATCH  /api/products/123          - Actualizar parcialmente producto 123
DELETE /api/products/123          - Eliminar producto 123

GET    /api/products/123/reviews  - Obtener reseñas del producto 123
POST   /api/products/123/reviews  - Crear reseña para producto 123

❌ Incorrecto:
GET    /api/getProducts           - No usar verbos en la URI
POST   /api/createProduct         - El método HTTP ya indica la acción
GET    /api/products/delete/123   - DELETE debe usarse como método HTTP
GET    /api/Products              - Usar minúsculas
```

#### Convenciones:

- Usar **sustantivos** en plural para colecciones: `/products`, `/users`
- Usar **minúsculas** y **guiones** para separar palabras: `/product-categories`
- Usar **jerarquías** para relaciones: `/users/123/orders`
- Usar **query parameters** para filtros: `/products?category=electronics&price_max=1000`
- **Versionar** la API: `/api/v1/products`

### Ejemplo de API RESTful:

```csharp
// Modelo
public class Product
{
    public int Id { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
    public string Category { get; set; }
}

// Controlador API
[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    // GET: api/products
    [HttpGet]
    public ActionResult<IEnumerable<Product>> GetAll()
    {
        var products = _repository.GetAll();
        return Ok(products);  // 200 OK
    }

    // GET: api/products/5
    [HttpGet("{id}")]
    public ActionResult<Product> GetById(int id)
    {
        var product = _repository.GetById(id);
        
        if (product == null)
            return NotFound();  // 404 Not Found
            
        return Ok(product);  // 200 OK
    }

    // POST: api/products
    [HttpPost]
    public ActionResult<Product> Create([FromBody] Product product)
    {
        if (!ModelState.IsValid)
            return BadRequest(ModelState);  // 400 Bad Request
        
        var created = _repository.Create(product);
        
        return CreatedAtAction(
            nameof(GetById), 
            new { id = created.Id }, 
            created);  // 201 Created
    }

    // PUT: api/products/5
    [HttpPut("{id}")]
    public IActionResult Update(int id, [FromBody] Product product)
    {
        if (id != product.Id)
            return BadRequest();  // 400 Bad Request
        
        var existing = _repository.GetById(id);
        if (existing == null)
            return NotFound();  // 404 Not Found
        
        _repository.Update(product);
        return NoContent();  // 204 No Content
    }

    // DELETE: api/products/5
    [HttpDelete("{id}")]
    public IActionResult Delete(int id)
    {
        var product = _repository.GetById(id);
        if (product == null)
            return NotFound();  // 404 Not Found
        
        _repository.Delete(id);
        return NoContent();  // 204 No Content
    }

    // GET: api/products/search?name=laptop&maxPrice=1000
    [HttpGet("search")]
    public ActionResult<IEnumerable<Product>> Search(
        [FromQuery] string name, 
        [FromQuery] decimal? maxPrice)
    {
        var products = _repository.Search(name, maxPrice);
        return Ok(products);  // 200 OK
    }
}
```

### Ejemplo de peticiones y respuestas:

#### GET - Obtener todos los productos
```http
GET /api/products HTTP/1.1
Host: api.ejemplo.com
Accept: application/json

Response:
HTTP/1.1 200 OK
Content-Type: application/json

[
    {
        "id": 1,
        "name": "Laptop",
        "price": 999.99,
        "category": "Electronics"
    },
    {
        "id": 2,
        "name": "Mouse",
        "price": 29.99,
        "category": "Accessories"
    }
]
```

#### POST - Crear un producto
```http
POST /api/products HTTP/1.1
Host: api.ejemplo.com
Content-Type: application/json

{
    "name": "Keyboard",
    "price": 79.99,
    "category": "Accessories"
}

Response:
HTTP/1.1 201 Created
Location: /api/products/3
Content-Type: application/json

{
    "id": 3,
    "name": "Keyboard",
    "price": 79.99,
    "category": "Accessories"
}
```

#### PUT - Actualizar un producto
```http
PUT /api/products/3 HTTP/1.1
Host: api.ejemplo.com
Content-Type: application/json

{
    "id": 3,
    "name": "Mechanical Keyboard",
    "price": 129.99,
    "category": "Accessories"
}

Response:
HTTP/1.1 204 No Content
```

#### DELETE - Eliminar un producto
```http
DELETE /api/products/3 HTTP/1.1
Host: api.ejemplo.com

Response:
HTTP/1.1 204 No Content
```

### Ventajas de REST:

1. **Simplicidad**: Usa estándares HTTP existentes
2. **Escalabilidad**: Sin estado, fácil de escalar horizontalmente
3. **Flexibilidad**: Soporta múltiples formatos (JSON, XML, HTML)
4. **Independencia**: Cliente y servidor pueden evolucionar independientemente
5. **Cacheable**: Mejora el rendimiento
6. **Visible**: Fácil de depurar y monitorear

### REST vs SOAP:

| Característica | REST | SOAP |
|----------------|------|------|
| Protocolo | Estilo arquitectónico | Protocolo estricto |
| Formato | JSON, XML, HTML, texto | Solo XML |
| Complejidad | Simple | Complejo |
| Rendimiento | Más rápido | Más lento |
| Seguridad | HTTPS, OAuth | WS-Security |
| Estado | Sin estado | Puede tener estado |

### Herramientas para trabajar con REST:

- **Postman**: Cliente para probar APIs
- **Swagger/OpenAPI**: Documentación de APIs
- **curl**: Cliente de línea de comandos
- **Insomnia**: Cliente alternativo a Postman
- **REST Client** (VS Code): Extensión para probar APIs

**Ver el ejemplo completo de implementación en la carpeta `RESTExample/`**

---

## Conclusión

Las tecnologías web modernas (HTML, CSS, JavaScript, Bootstrap) junto con patrones arquitectónicos como MVC y REST permiten crear aplicaciones web robustas, escalables y mantenibles. Cada tecnología y patrón tiene su propósito específico y trabajan en conjunto para proporcionar experiencias de usuario excepcionales.
