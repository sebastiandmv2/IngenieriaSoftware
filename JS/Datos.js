$(document).ready(function() {
  obtenerColegios();

  obtenerEstudiantes();
 
  obtenerMetodosPago();

  $('#colegio').on('change', function() {
    var idColegio = $(this).val();
    obtenerCursos(idColegio);
  });
});

function obtenerColegios() {
  $.ajax({
    url: 'datos.php',
    type: 'GET',
    data: { datos: 'colegio' },
    success: function(response) {
      var colegios = JSON.parse(response);
      var options = "<option value=\"\">Seleccione</option>";
      for (var i = 0; i < colegios.length; i++) {
        options += "<option value=\"" + colegios[i].id_colegio + "\">" + colegios[i].nombre_colegio + "</option>";
      }
      $('#colegio').html(options);
    },
    error: function(xhr, status, error) {
      console.log('Error al obtener los colegios:', error);
    }
  });
}


function obtenerCursos(idColegio) {
  $.ajax({
    url: 'datos.php',
    type: 'GET',
    data: { datos: 'curso', id_colegio: idColegio },
    success: function(response) {
      var cursos = JSON.parse(response);
      var options = "<option value=\"\">Seleccione</option>";
      for (var i = 0; i < cursos.length; i++) {
        options += "<option value=\"" + cursos[i].nombre_curso + "\">" + cursos[i].nombre_curso + "</option>";
      }
      $('#curso').html(options);
    },
    error: function(xhr, status, error) {
      console.log('Error al obtener los cursos:', error);
    }
  });
}


function obtenerEstudiantes() {
  $.ajax({
    url: 'datos.php',
    type: 'GET',
    data: { datos: 'rutEstudiante' },
    success: function(response) {
      $('#rutEstudiante').html(response);
    },
    error: function(xhr, status, error) {
      console.log('Error al obtener los estudiantes:', error);
    }
  });
}

function obtenerMetodosPago() {
  $.ajax({
    url: 'datos.php',
    type: 'GET',
    data: { datos: 'metodoPago' },
    success: function(response) {
      $('#metodoPago').html(response);
    },
    error: function(xhr, status, error) {
      console.log('Error al obtener los métodos de pago:', error);
    }
  });
}
