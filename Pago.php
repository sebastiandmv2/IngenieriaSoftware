<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  // Obtener los datos enviados por el formulario
  $colegio = $_POST['colegio'];
  $curso = $_POST['curso'];
  $rutEstudiante = $_POST['rutEstudiante'];
  $cuotas = $_POST['cuotas'];
  $nombreApoderado = $_POST['nombreApoderado'];
  $rutApoderado = $_POST['rutApoderado'];
  $correoApoderado = $_POST['correoApoderado'];
  $metodoPago = $_POST['metodoPago'];

  // Aquí puedes agregar el código necesario para enviar el correo con los datos ingresados
  // Puedes utilizar la función mail() de PHP o una librería externa para enviar correos

  // Después de enviar el correo, puedes redirigir al usuario a una página de confirmación o mostrar el mensaje en una ventana emergente

  // Ejemplo básico de redirección a una página de confirmación
  header('Location: confirmacion.html');
  exit();
}
?>
