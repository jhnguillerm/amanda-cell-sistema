function loadForm(row) {
    var id_proveedor = $(row).find(".td_id_proveedor").text();
    var nombre = $(row).find(".td_nombre").text();
    var direccion = $(row).find(".td_direccion").text();
    var numero = $(row).find(".td_numero").text();
    var correo = $(row).find(".td_correo").text();
    
    $("#txtIdProveedor").val(id_proveedor);
    $("#txtIdProveedor-hidden").val(id_proveedor);
    $("#txtNombre").val(nombre);
    $("#txtDireccion").val(direccion);
    $("#txtNumero").val(numero);
    $("#txtCorreo").val(correo);
}

$(document).ready(function() {
    $("#modal-proveedor").on("hidden.bs.modal", function() {
        $('form')[0].reset();
    });
    
    $(document).on('click', '.btn-editar-proveedor', function() {
        $("#div-id_proveedor").show();
        $("#btn-agregar-proveedor").hide();
        $("#btn-actualizar-proveedor").show();
        loadForm($(this).closest('tr'));
    });
    
    $(document).on('click', '.btn-modal-eliminar-proveedor', function () {
        var idProveedor = $(this).data('id');
        var nombreProveedor = $(this).data('nombre');
        $("#proveedor-id").text(idProveedor);
        $("#proveedor-nombre").text(nombreProveedor);

        $("#btn-eliminar-proveedor").on("click", function () {
            $.ajax({
                url: "/amanda-cell-sistema/SvProveedor",
                method: "POST",
                data: {
                    action: "delete",
                    txtIdProveedor: idProveedor
                },
                success: function (response) {
                    location.reload();
                },
                error: function (error) {
                    console.error("Error al eliminar proveedor: " + error);
                }
            });
        });
    });
    
    $("#abrir-modal-proveedor").click(function() {
        $("#div-id_proveedor").hide();
        $("#btn-agregar-proveedor").show();
        $("#btn-actualizar-proveedor").hide();
    });
});