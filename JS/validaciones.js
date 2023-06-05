document.addEventListener('DOMContentLoaded', function() {
  var nombreApoderadoInput = document.getElementById('nombreApoderado');

  nombreApoderadoInput.addEventListener('input', function() {
    var nombreApoderado = nombreApoderadoInput.value.trim();

    if (nombreApoderado.length < 2 || /\d/.test(nombreApoderado)) {
      nombreApoderadoInput.setCustomValidity('Ingrese un nombre válido');
    } else {
      nombreApoderadoInput.setCustomValidity('');
    }
  });

  var rutApoderadoInput = document.getElementById('rutApoderado');

  rutApoderadoInput.addEventListener('input', function() {
    var rutApoderado = rutApoderadoInput.value.trim();
    
    if (!/^(\d{1,8}|\d{1,8}-\d{1}|d{1})-[\dkK]$/.test(rutApoderado)) {
      rutApoderadoInput.setCustomValidity('Ingrese un RUT válido. Ejemplo: 12345678-9');
    } else {
      rutApoderadoInput.setCustomValidity('');
    }
  });
  
  var abonoInput = document.getElementById('abono');

  abonoInput.addEventListener('input', function() {
    var abono = parseInt(abonoInput.value);
    
    if (isNaN(abono) || abono < 70000) {
      abonoInput.setCustomValidity('El abono debe ser de al menos 70000.');
    } else {
      abonoInput.setCustomValidity('');
    }
  });

  var correoApoderadoInput = document.getElementById('correoApoderado');

  correoApoderadoInput.addEventListener('input', function() {
    var correoApoderado = correoApoderadoInput.value.trim();

    if (!/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/.test(correoApoderado)) {
      correoApoderadoInput.setCustomValidity('Ingrese un correo válido.');
    } else {
      correoApoderadoInput.setCustomValidity('');
    }
  });
});
