<h1 class="text-center text-warning">Lista de productos</h1><br>
<section class="conteiner">
  <div class="row g-0">
    <div class="col">
    </div>
    <div class="col-10">
      <table class="table table-dark table-striped table-sm">
        <thead>
          <tr class="text-center fs-3">
            <th class="text-warning" scope="col">Nombre</th>
            <th class="text-warning" scope="col">Talle</th>
            <th class="text-warning" scope="col">Categoria</th>
            <th class="text-warning" scope="col">Accion</th>
            {if ($log)}
            {/if}
          </tr>
          <thead>
          <tbody>
            {foreach from=$products item=product}
              <tr class="text-center fs-5">
                <td>{$product->nombre_producto}</td>
                <td>{$product->talle}</td>
                <td>{$product->nombre_categoria}</td>
                <td>
                <button type="button" class="btn btn-info" name=action value="seeMore">See More</button>
                {if ($log)}
                  <button class="btn btn-secondary" type="submit" name="action" value="edit">Edit</button>
                  <button class="btn btn-danger" type="submit" name="action" value="erase">Erase</button>
                </td>
                  <td>
                    <form action="" method="GET">
                      <input type="hidden" name="idProduct" value="{$product->id_productos}">
                      <input type="hidden" name="producto" value="{$product->nombre_producto}">
                      <input type="hidden" name="talle" value="{$product->talle}">
                      <input type="hidden" name="color" value="{$product->color}">
                      <input type="hidden" name="precio" value="{$product->precio}">
                      <input type="hidden" name="categorias" value="{$product->nombre_categoria}">
                    </form>
                  </td>
                {/if}
              </tr>
              {/foreach}
            </tbody>
        </table>
      </div>
      <div class="col">
      </div>
    </div>
  </section>
