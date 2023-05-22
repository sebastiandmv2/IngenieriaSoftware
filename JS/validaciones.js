// Validación de RUT Apoderado
const rutApoderadoInput = document.getElementById('rutApoderado');
rutApoderadoInput.addEventListener('input', () => {
  const rutApoderado = rutApoderadoInput.value;
  // Realizar validación y mostrar mensaje de error si es necesario
});

// Validación de correo electrónico
const correoApoderadoInput = document.getElementById('correoApoderado');
correoApoderadoInput.addEventListener('input', () => {
  const correoApoderado = correoApoderadoInput.value;
  // Realizar validación y mostrar mensaje de error si es necesario
});

// Validación del formulario completo antes de enviarlo
const paymentForm = document.getElementById('paymentForm');
paymentForm.addEventListener('submit', (event) => {
  if (!paymentForm.checkValidity()) {
    event.preventDefault(); // Evitar el envío del formulario si no es válido
    // Mostrar mensajes de validación faltante en los campos requeridos
  }
});
