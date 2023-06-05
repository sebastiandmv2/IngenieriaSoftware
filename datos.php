<?php
$conexion = mysqli_connect("localhost", "123", "123", "ontour");

if (!$conexion) {
    die("Error al conectar con la base de datos: " . mysqli_connect_error());
}

if (isset($_GET['datos'])) {
    $datos = $_GET['datos'];

    switch ($datos) {
        case 'colegio':
            $query = "SELECT id_colegio, nombre_colegio FROM colegio";
            break;

            case 'rutEstudiante':
                $id_curso = $_GET['id_curso'];
                $query = "SELECT run_alumno FROM alumno WHERE id_curso = ?";
                        
                $stmt = mysqli_prepare($conexion, $query);
                mysqli_stmt_bind_param($stmt, 'i', $id_curso);
                mysqli_stmt_execute($stmt);
                $resultado = mysqli_stmt_get_result($stmt);
                        
                if (!$resultado) {
                    die("Error al obtener los datos: " . mysqli_error($conexion));
                }
                        
                $datos = array();
                        
                while ($fila = mysqli_fetch_assoc($resultado)) {
                    $datos[] = $fila;
                }
                        
                mysqli_stmt_close($stmt);
                        
                echo json_encode($datos);
                break;

        case 'curso':
            $id_colegio = $_GET['id_colegio'];
            $query = "SELECT id_curso, nombre_curso FROM curso WHERE id_colegio = $id_colegio";
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

    $datos = array();

    while ($fila = mysqli_fetch_assoc($resultado)) {
        $datos[] = $fila;
    }

    mysqli_close($conexion);

    echo json_encode($datos);
} else {
    echo "Solicitud no encontrada.";
}
?>