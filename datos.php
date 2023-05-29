<?php
$conexion = mysqli_connect("localhost", "ADM", "ADM123", "ontour");

if (!$conexion) {
    die("Error al conectar con la base de datos: " . mysqli_connect_error());
}

if (isset($_GET['datos'])) {
    $datos = $_GET['datos'];

    switch ($datos) {
        case 'colegio':
            $query = "SELECT nombre_colegio FROM colegio";
            break;

        case 'rutEstudiante':
            $query = "SELECT run_alumno FROM alumno";
            break;

        case 'curso':
            $query = "SELECT nombre_curso FROM curso";
            break;

        case 'metodoPago':
            $query = "SELECT nombre_metodo FROM metodo_pago";
            break;

        default:
            echo "Solicitud inválida.";
            break;
    }

    $resultado = mysqli_query($conexion, $query);

    if (!$resultado) {
        die("Error al obtener los datos: " . mysqli_error($conexion));
    }

    $options = "<option value=\"0\" disabled selected>Seleccione</option>";

    while ($fila = mysqli_fetch_assoc($resultado)) {
        $valor = $fila[key($fila)];
        $options .= "<option value=\"$valor\">$valor</option>";
    }

    mysqli_close($conexion);

    echo $options;
} else {
    echo "Solicitud no encontrada.";
}
?>