<?php

require_once('./config.php');
require_once './App/Views/tyresView.php';
class tyresModel{

  private $db;
  private $view;

    public function __construct()
    {
      $this->view = new tyresView();
      $this->getDBConnection();
    }


    private function getDBConnection()
    {
        global $dbconect;
        $host = $dbconect['host'];
        $db = $dbconect['db'];
        $charset = $dbconect['charset'];
        $user = $dbconect['user'];
        $pass = $dbconect['password'];

        $dbString = "mysql:host=$host;dbname=$db;charset=$charset";

        try {
            $this->db = new PDO($dbString, $user, $pass);
        } catch(PDOException $e) {
          $this->view->errorDBConect();
          die;
    }
}

  function singinUser($user){

    $db = $this->db;

    $query = $db->prepare('SELECT * FROM usuario u WHERE u.nombre_usuario = ?');
    $query->execute([$user]);
    $existUser = $query->fetch(PDO::FETCH_OBJ);
    return $existUser;
  }

  function queryCategories(){
    $db = $this->db;
    $query = $db->prepare('SELECT * FROM categorias');
    $query->execute();
    $categorias = $query->fetchAll(PDO::FETCH_OBJ);
    return $categorias;
  }


  /**
   *? Obtiene la lista de productos de la DB
   */
  function getListProducts(){
    $db = $this->db;
    $query = $db->prepare('SELECT * FROM productos p INNER JOIN categorias c ON p.id_categorias = c.id_categorias');
    $query->execute();
    $products = $query->fetchAll(PDO::FETCH_OBJ);
    return $products;
  }

  /**
   *? Filtra la lista de productos por categoria
   */

  function filterBy($filter){
    $db = $this->db;
    $query = $db->prepare('SELECT * FROM productos p INNER JOIN categorias c WHERE c.categoria = ? AND (p.id_categorias = c.id_categorias)');
    $query->execute([$filter]);
    $products = $query->fetchAll(PDO::FETCH_OBJ);
    return $products;
  }

  /**
   *? Agrega productos a la DB
   */
  function btnagregarItem($nombre,$precio,$talle,$color,$categoria){
    $db = $this->db;
    $query = $db->prepare('INSERT INTO productos (nombre_producto,precio,talle,color,id_categorias) VALUES (?,?,?,?,?,?)');
    $query->execute([$nombre,$precio,$talle,$color,$categoria]);
    $products = $query->fetchAll(PDO::FETCH_OBJ);
    return $products;
  }
  function editItemForm($nombre,$precio,$talle,$color,$categoria,$idProducto){
    $db = $this->db;
    $sentence = "UPDATE `productos` SET `productos`.`nombre_producto`=?,`productos`.`precio`=?,`productos`.`talle`=?,`productos`.`color`=?,`productos`.`id_categoria`=? WHERE `productos`.`id_productos`=?";
    $query = $db->prepare($sentence);
    $query->execute([$nombre,$precio,$talle,$color,$categoria,$idProducto]);
    $products = $query->fetchAll(PDO::FETCH_OBJ);
    return $products;
  }
  function editCatForm($categoria,$idCat){
    $db = $this->db;
    $sentence = "UPDATE `categorias` SET `categorias`.`nombre_categoria`=? WHERE `categorias`.`id_categorias`=?";
    $query = $db->prepare($sentence);
    $query->execute([$categoria,$idCat]);
    $categorias = $query->fetchAll(PDO::FETCH_OBJ);
    return $categorias;
  }

  function eraseItem($id){
    $db = $this->db;
    $sentence = "DELETE FROM `productos` WHERE `productos`.`id_productos`=?;";
    $query = $db->prepare($sentence);
    $query->execute([$id]);
    $products = $query->fetchAll(PDO::FETCH_OBJ);
    return $products;
  }
  function eraseCat($id){
    $db = $this->db;
    $sentence = "DELETE FROM `categorias` WHERE `categorias`.`id_categorias`=?;";
    $query = $db->prepare($sentence);
    $query->execute([$id]);
    $categorias = $query->fetchAll(PDO::FETCH_OBJ);
    return $categorias;
  }

  
  function addUser($nombreUsuario,$email,$pass){
    $pass = password_hash($pass, PASSWORD_BCRYPT);
    $db = $this->db;
    $query = $db->prepare("INSERT INTO usuarios (nombre_usuario,email,pass) VALUES (?,?,?)");
    $query->execute([$nombreUsuario, $email, $pass]);
  }
  
  function btnagregarCat($categoria){
    $db = $this->db;
    $query = $db->prepare('INSERT INTO categorias (nombre_categoria) VALUES (?)');
    $query->execute([$categoria]);
    $categorias = $query->fetchAll(PDO::FETCH_OBJ);
    return $categorias;
  }

  function btnSeeMore($talle,$color,$precio,$id_productos){
    $db = $this->db;
    $query= $db->prepare("SELECT 'talle'=?.'color'=?.'precio'=? FROM `productos` WHERE 'id_productos'=?");
    $query->execute([$talle,$color,$precio,$id_productos]);
    $products = $query->fetchAll(PDO::FETCH_OBJ);
    return $products;
  }


}