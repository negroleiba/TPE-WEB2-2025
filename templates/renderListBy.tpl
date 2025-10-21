<div class="text-center text-warning">
  <h1>Lista de {$filter}s</h1><br>
</div>


<section class="conteiner">
  <div class="row g-0">
    <div class="col">

    </div>
    <div class="col-8">
      <table class="table table-dark table-striped table-sm">
        <thead>
          <tr class="text-center fs-2">
            <th class="text-warning" scope="col">Nombre</th>
            <th class="text-warning" scope="col">Talle</th>
            <th class="text-warning" scope="col">Precio</th>
          </tr>
          <thead>
          <tbody>

            {foreach from=$products item=product}

              <tr class="text-center fs-4">
                <td>{$product->nombre_producto}</td>
                <td>{$product->talle}</td>
                <td>{$product->precio}</td>

              </tr>

            {/foreach}
          </tbody>
      </table>
    </div>
    <div class="col">

    </div>
  </div>
</section>