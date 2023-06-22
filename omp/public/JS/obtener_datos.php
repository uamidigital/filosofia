<?php
// Conexión a la base de datos
//
$conn = new mysqli("localhost", "root", "", "ejemplo");
// Consulta para obtener los datos de MySQL
$query = "SELECT id, descripcion FROM nodos";
$result = $conn->query($query);

//
$data = [
  "nodes" => [],
  "links" => []
];

  while ($row = $result->fetch_assoc()) {
    $data["nodes"][] = [
      "id" => $row["id"],
      "message" => $row["descripcion"]
    ];
  
  }


header("Content-type: application/json");
echo json_encode($data);

// Cierra la conexión a la base de datos
$conn->close();
?>
