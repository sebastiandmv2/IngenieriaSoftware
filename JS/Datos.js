$(document).ready(function() {
  obtenerColegios();
  obtenerTodosEstudiantes();
  obtenerMetodosPago();

  $('#colegio').on('change', function() {
    var idColegio = $(this).val();
    obtenerCursos(idColegio);
  });

  $('#curso').on('change', function() {
    var idCurso = $(this).val();
    obtenerEstudiantesCurso(idCurso);
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
        options += "<option value=\"" + cursos[i].id_curso + "\">" + cursos[i].nombre_curso + "</option>";
      }
      $('#curso').html(options);
    },
    error: function(xhr, status, error) {
      console.log('Error al obtener los cursos:', error);
    }
  });
}

function obtenerTodosEstudiantes() {
  $.ajax({
    url: 'datos.php',
    type: 'GET',
    data: { datos: 'rutEstudiante' },
    success: function(response) {
      var estudiantes = JSON.parse(response);
      var options = "<option value=\"\">Seleccione</option>";
      for (var i = 0; i < estudiantes.length; i++) {
        options += "<option value=\"" + estudiantes[i].run_alumno + "\">" + estudiantes[i].run_alumno + "</option>";
      }
      $('#rutEstudiante').html(options);
    },
    error: function(xhr, status, error) {
      console.log('Error al obtener todos los estudiantes:', error);
    }
  });
}

function obtenerEstudiantesCurso(idCurso) {
  $.ajax({
    url: 'datos.php',
    type: 'GET',
    data: { datos: 'rutEstudiante', id_curso: idCurso },
    success: function(response) {
      var estudiantes = JSON.parse(response);
      var options = "<option value=\"\">Seleccione</option>";
      for (var i = 0; i < estudiantes.length; i++) {
        options += "<option value=\"" + estudiantes[i].run_alumno + "\">" + estudiantes[i].run_alumno + "</option>";
      }
      $('#rutEstudiante').html(options);
    },
    error: function(xhr, status, error) {
      console.log('Error al obtener los estudiantes del curso:', error);
    }
  });
}

function obtenerMetodosPago() {
  $.ajax({
    url: 'datos.php',
    type: 'GET',
    data: { datos: 'metodoPago' },
    success: function(response) {
      var metodosPago = JSON.parse(response);
      var options = "";
      for (var i = 0; i < metodosPago.length; i++) {
        options += "<option value=\"" + metodosPago[i].nombre_metodo + "\">" + metodosPago[i].nombre_metodo + "</option>";
      }
      $('#metodoPago').html(options);
    },
    error: function(xhr, status, error) {
      console.log('Error al obtener los métodos de pago:', error);
    }
  });
}
