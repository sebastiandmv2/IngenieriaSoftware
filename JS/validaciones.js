var nombreApoderadoInput = document.getElementById('nombreApoderado');

nombreApoderadoInput.addEventListener('input', function() {
  var nombreApoderado = nombreApoderadoInput.value.trim();
  
  if (nombreApoderado.length < 2 || /\d/.test(nombreApoderado)) {
    nombreApoderadoInput.setCustomValidity('Ingrese Nombre valido');
  } else {
    nombreApoderadoInput.setCustomValidity('');
  }
});
var rutApoderadoInput = document.getElementById('rutApoderado');

rutApoderadoInput.addEventListener('input', function() {
  var rutApoderado = rutApoderadoInput.value.trim();
  
  if (!/^[0-9]+-[0-9kK]{1}$/.test(rutApoderado)) {
    rutApoderadoInput.setCustomValidity('Ingrese RUT valido.');
  } else {
    rutApoderadoInput.setCustomValidity('');
  }
});
var correoApoderadoInput = document.getElementById('correoApoderado');

correoApoderadoInput.addEventListener('input', function() {
  var correoApoderado = correoApoderadoInput.value.trim();
  
  if (!/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/.test(correoApoderado)) {
    correoApoderadoInput.setCustomValidity('Ingrese correo valido.');
  } else {
    correoApoderadoInput.setCustomValidity('');
  }
});
