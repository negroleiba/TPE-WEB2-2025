<?php

require_once './Apps/Models/tyresModel.php';
require_once './Apps/Views/tyresView.php';

class tyresController{
  private $model;
  private $view;

  public function __construct(){

    $this->model = new tyresModel();
    $this->view = new tyresView();
  }

  public function showHome(){
    session_start();
    $this->view->showHead();
    $categorias = $this->model->queryCategories();
    if (!empty($_SESSION) && $_SESSION['logged']){
      $this->view->showCRUD($_SESSION['userName'],$categorias);
      //$this->view->renderListProduct($products,$_SESSION['logged']);
    }else{
      $this->view->showHeader($categorias);
    }
    $this->view->bodyHome();
    $this->view->showFooter();
  }

  public function showListProducts() {
    session_start();
    $this->view->showHead();

    $products = $this->model->getListProducts();
    $categorias = $this->model->queryCategories();
    $log = $_SESSION['logged'] ?? false;

    // 🔹 Mostrar nav según el estado de login
    if (!empty($_SESSION) && $_SESSION['logged']) {
        $this->view->showCRUD($_SESSION['userName'], $categorias);
    } else {
        $this->view->showHeader($categorias);
    }

    // 🔹 Mostrar la lista
    $this->view->renderListProduct($products, $log);
    $this->view->showFooter();
}


  public function filterBy($filter){
    session_start();
    $products = $this->model->filterBy($filter);
    $this->view->showHead();
    //$this->view->showHeader();
    $categories = $this->model->queryCategories();
    if (!empty($_SESSION) && $_SESSION['logged']){
      $this->view->showCRUD($_SESSION['userName'],$categories);
      //$this->view->renderListProduct($products,$_SESSION['logged']);
    }else{
      $this->view->showHeader($categories);
      //$this->view->renderListProduct($products,false);
    }
    $this->view->renderListProductBy($products,$filter);
    $this->view->showFooter();
  }
  public function addItem(){
    session_start();
    $this->view->showHead();
    $categorias = $this->model->queryCategories();
    $this->view->showCRUD($_SESSION['userName'],$categorias);
    $this->view->addItemForm($categorias);
    $this->view->showFooter();
  }
 public function btnagregarItem() {
    session_start();
    $this->view->showHead();
    $categories = $this->model->queryCategories();
    $this->view->showCRUD($_SESSION['userName'], $categories);

    if (!empty($_POST) && isset($_POST['nombre_producto'], $_POST['talle'], $_POST['categorias'], $_POST['precio'], $_POST['color'])) {
        $nombre = $_POST['nombre_producto'];
        $talle = $_POST['talle'];
        $categoria = $_POST['categorias'];
        $precio = $_POST['precio'];
        $color = $_POST['color'];

        $this->model->btnagregarItem($nombre, $precio, $talle, $color, $categoria);
    } else {
        echo 'Complete los cuadros';
    }

    $log = $_SESSION['logged'];
    $products = $this->model->getListProducts();
    $this->view->renderListProduct($products, $log);
    $this->view->showFooter();
}

  // Editar producto (formulario)
 public function editItem($getEdit){
        session_start();
        $this->view->showHead();

        if (empty($getEdit['idProduct'])) {
            echo "ID de producto inválido";
            return;
        }

        $idProduct = $getEdit['idProduct'];
        $product = $this->model->btnSeeMore($idProduct);

        if (!$product) {
            echo "Producto no encontrado";
            return;
        }

        $categories = $this->model->queryCategories();

        $this->view->editItemForm(
        $product->nombre_producto, // nombre
        $product->talle,           // talle
        $product->color,           // color
        $product->precio,          // precio
        $product->id_categorias,   // categoría
        $idProduct,                // id
        $categories                // lista categorías
    );

        $this->view->showFooter();
    }


  public function editCat($getCat){
    session_start();
    $this->view->showHead();
    $categories = $this->model->queryCategories();
    $this->view->showCRUD($_SESSION['userName'],$categories);
    $idCat = $_GET['id'];
    $categoria = $_GET['categoria'];
    $this->view->editcatForm($categoria,$idCat);
    $this->view->showFooter();
  }
  public function btneditItem(){
      session_start();
      $this->view->showHead();

      $idProduct = trim($_POST['idProduct']);
      $nombre = trim($_POST['nombre_producto']);
      $talle = trim($_POST['talle']);
      $color = trim($_POST['color']);
      $precio = trim($_POST['precio']);
      $categoria = trim($_POST['categorias']);

      if ($idProduct === "" || $nombre === "" || $talle === "" || $color === "" || $precio === "" || $categoria === "") {
          echo "Complete todos los campos";
          return;

      }

      $idProduct = $_POST['idProduct'];
      $nombre = $_POST['nombre_producto'];
      $talle = $_POST['talle'];
      $color = $_POST['color'];
      $precio = $_POST['precio'];
      $categoria = $_POST['categorias'];

      $this->model->editItemForm($nombre, $precio, $talle, $color, $categoria, $idProduct);

      echo "Producto editado correctamente!";
      $this->view->showFooter();
  }

  public function btneditCat($getCat){
    session_start();
    $this->view->showHead();
    $categories = $this->model->queryCategories();
    $this->view->showCRUD($_SESSION['userName'],$categories);
    // var_dump($getCat);
    // die;
    $idCat = $_GET['idCat'];
    $categoria = $_GET['categoria'];
    $this->model->editCatForm($categoria,$idCat);
    $this->view->showFooter();
  }

  public function eraseItem($getItem){
    session_start();
    $this->view->showHead();
    $categories = $this->model->queryCategories();
    $this->view->showCRUD($_SESSION['userName'],$categories);
    $id=$getItem['idProduct'];
    $this->model->eraseItem($id);
    $log=$_SESSION['logged'];
    $products = $this->model->getListProducts();
    $this->view->renderListProduct($products,$log);
    $this->view->showFooter();
  }

  public function adminCategories(){
    session_start();
    $this->view->showHead();
    $categories = $this->model->queryCategories();
    $this->view->showCRUD($_SESSION['userName'],$categories);
    $this->view->adminCategories($categories,$_SESSION['logged']);
    $this->view->showFooter();
  }
  public function addCat(){
    session_start();
    $this->view->showHead();
    $categories = $this->model->queryCategories();
    $this->view->showCRUD($_SESSION['userName'],$categories);
    $this->view->addCateg();
    $this->view->showFooter();
  }
  public function btnagregarCat($getCat){
    session_start();
    $this->view->showHead();
    $this->model->btnagregarCat($getCat['categoria']);
    $categories = $this->model->queryCategories();
    $this->view->showCRUD($_SESSION['userName'],$categories);
    $this->view->adminCategories($categories,$_SESSION['userName']);
    $this->view->showFooter();
  }
  public function eraseCat($getCat){
    session_start();
    $this->view->showHead();
    // var_dump($getCat);
    // die;
    $id=$getCat['id'];
    $cat=$getCat['categoria'];
    $productByCat= $this->model->filterBy($cat);
    $categories = $this->model->queryCategories();
    $this->view->showCRUD($_SESSION['userName'],$categories);
    if(!$productByCat){
      $this->model->eraseCat($id);
    }else{
      // echo 'NO NO esa categoria tiene articulos!!';
      $this->view->errorEraseCat();
    }
    $this->view->adminCategories($categories,$_SESSION['userName']);
    $this->view->showFooter();
  }

  public function about(){
    session_start();
    $this->view->showHead();
    $categories = $this->model->queryCategories();
    if (!empty($_SESSION) && $_SESSION['logged']){
      $this->view->showCRUD($_SESSION['userName'],$categories);
    }else{
      $this->view->showHeader($categories);
    }
    $this->view->about();
    $this->view->showFooter();

  }
  public function seeMoreItem(){
    session_start();
    $this->view->showHead();

    $id = $_GET['id'] ?? null;

    if ($id) {
        $product = $this->model->btnSeeMore($id);

        if ($product) {
            $this->view->seeMore($product);
        } else {
            echo "Producto no encontrado.";
        }
    } else {
        echo "ID de producto inválido.";
    }

    $this->view->showFooter();
}
}