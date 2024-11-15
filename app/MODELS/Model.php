<?php
// Clase abstracta que implementa serializable para poder pasarlo a json en caso de necesitarlo
abstract class Model implements JsonSerializable
{
  // "sobreescribimos" la función
  public function jsonSerialize()
  {
    // Creamos una instancia de reflection, que nos permitirá obtener las propiedades de el modelo que la llame
    $reflection = new ReflectionClass($this);
    $properties = $reflection->getProperties();

    // Creamos el array que almacenará los datos
    $data = [];
    // Recorremos las propiedades, las hacemos accesibles, y construimos en espacios del array con el nombre de la propiediad
    // y el valor de la misma propiedad
    foreach ($properties as $property) {
      $property->setAccessible(true);
      $data[$property->getName()] = $property->getValue($this);
    }
    // devolvemos el array de datos
    return $data;
  }
}