$(document).ready(function() {
    $(document).on('click', '.btn-modal-eliminar', function () {
        var idCliente = $(this).data('id');
        var nombresCliente = $(this).data('nombre');
        $("#cliente-id").text(idCliente);
        $("#cliente-nombres").text(nombresCliente);

        $("#btn-eliminar").on("click", function () {
            $.ajax({
                url: "/amanda-cell-sistema/SvCliente",
                method: "POST",
                data: {
                    action: "delete",
                    txtIdCliente: idCliente
                },
                success: function (response) {
                    location.reload();
                },
                error: function (error) {
                    console.error("Error al eliminar cliente: " + error);
                }
            });
        });
    });
});

