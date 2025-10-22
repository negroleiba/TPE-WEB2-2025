<section class="container mt-3 mb-3 col-12 col-md-8 col-lg-6 col-xl-5">
    <div class="card p-3 bg-success border-0">
    <form class="text-center p-3" action="index.php?action=btnagregarItem" method="POST">
      <h1>Nuevo Producto</h1>
      <label class="col-form-label" for="nombre_producto">Nombre:</label>
        <input class="form-control" type="text" name="nombre_producto" value="" placeholder="" id="nombre_producto" require="nombre_producto" /><br />
      <label class="col-form-label" for="talle">Talle:</label>
        <input class="form-control" type="text" name="talle" value="" placeholder="" id="talle" require="talle" /><br />
      
      <label class="col-form-label" for="nombre_categoria">Categoria:</label>
        <select name="categorias" id="categorias">
          <option value=""> </option>
          {foreach from=$categorias item=cat}
            <option value="{$cat->id_categorias}">{$cat->nombre_categoria}</option>
          {/foreach}
        </select><br>
      <label class="col-form-label" for="precio">Precio:</label>
        <input class="form-control" type="text" name="precio" value="" placeholder="" id="precio" require="precio" /><br />
      <label class="col-form-label" for="color">Color:</label>
        <input class="form-control" type="text" name="color" value="" placeholder="" id="color"/><br />
      

      <button class="btn btn-secondary" value="btnagregarItem" type="submit" name="action">Agregar</button>

      <!-- <button class="btn btn-info" value="btnbuscar" type="submit" name="action">Buscar</button> -->
      <!-- <button class="btn btn-primary" value="btneditar" type="submit" name="action">Editar</button> -->
      <!-- <button class="btn btn-danger" value="btneliminar" type="submit" name="action">Eliminar Materia</button> -->
      <!-- <button class="btn btn-light" value="btnlimpiar" type="submit" name="action">Limpiar</button> -->
      <!-- <button class="btn btn-light" value="btnarray" type="submit" name="action">array</button> -->
    </form>
    </div>
    </section>