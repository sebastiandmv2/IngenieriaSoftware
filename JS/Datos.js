$(document).ready(function () {
    $.ajax({
      url: 'Pago.php',
      type: 'GET',
      data: { datos: 'colegio' },
      success: function (response) {
        $('#colegio').html(response);
      },
      error: function () {
        alert('Error al cargar los datos de colegio.');
      }
    });

    $.ajax({
      url: 'Pago.php',
      type: 'GET',
      data: { datos: 'rutEstudiante' },
      success: function (response) {
        $('#rutEstudiante').html(response);
      },
      error: function () {
        alert('Error al cargar los datos de rutEstudiante.');
      }
    });

    $.ajax({
      url: 'Pago.php',
      type: 'GET',
      data: { datos: 'curso' },
      success: function (response) {
        $('#curso').html(response);
      },
      error: function () {
        alert('Error al cargar los datos de curso.');
      }
    });

    $.ajax({
      url: 'Pago.php',
      type: 'GET',
      data: { datos: 'cuotas' },
      success: function (response) {
        $('#cuotas').html(response);
      },
      error: function () {
        alert('Error al cargar los datos de cuotas.');
      }
    });

    $.ajax({
      url: 'Pago.php',
      type: 'GET',
      data: { datos: 'metodoPago' },
      success: function (response) {
        $('#metodoPago').html(response);
      },
      error: function () {
        alert('Error al cargar los datos de metodoPago.');
      }
    });
  });
