const getOptionChart1 = (data) => {
    return {
        title: {
            text: 'Productos por tipo',
            left: 'center'
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            top: '5%',
            left: 'center'
        },
        series: [
            {
                name: 'Access From',
                type: 'pie',
                radius: ['40%', '70%'],
                avoidLabelOverlap: false,
                itemStyle: {
                    borderRadius: 10,
                    borderColor: '#fff',
                    borderWidth: 2
                },
                label: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    label: {
                        show: true,
                        fontSize: 40,
                        fontWeight: 'bold'
                    }
                },
                labelLine: {
                    show: false
                },
                data: data // Utilizar los datos obtenidos del servlet
            }
        ]
    };
};

const getOptionChart2 = (data) => {
    // Definir nombres de los meses en español
    const mesesEnEspanol = [
        'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'
    ];

    // Mapear los números de mes a sus nombres en español
    const meses = data.map(item => mesesEnEspanol[item.month - 1]);
    const cantidadProductos = data.map(item => item.cantidad_productos);

    // Definir colores personalizados para las barras
    const coloresBarras = [
        '#5970ca', '#66cc7f', '#fac84c', '#ff664a', '#57c0eb', '#05a284', '#ff8439', '#c460a8', '#5970ca', '#66cc7f', '#04223f', '#04323f'
    ];

    return {
        title: {
            text: 'Ingreso de productos por mes',
            left: 'center'
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            data: meses
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                data: cantidadProductos,
                type: 'bar',
                // Aplicar colores personalizados a las barras
                itemStyle: {
                    color: function (params) {
                        return coloresBarras[params.dataIndex];
                    }
                }
            }
        ]
    };
};



const obtenerTiposProductos = () => {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: "/amanda-cell-sistema/obtenerTiposProductos",
            type: "GET",
            dataType: "json",
            success: function (data) {
                console.log("Datos obtenidos del servlet para el gráfico 1:", data);

                // Agrupar y sumar el stock por tipo
                const datosAgrupados = data.reduce((acumulador, producto) => {
                    const tipo = producto.name;
                    const stock = producto.value;

                    // Si el tipo ya existe en el acumulador, suma el stock
                    if (acumulador[tipo]) {
                        acumulador[tipo] += stock;
                    } else {
                        // Si no existe, crea una nueva entrada
                        acumulador[tipo] = stock;
                    }

                    return acumulador;
                }, {});

                // Convertir los datos agrupados en un formato compatible con getOptionChart1
                const datosFormateados = Object.keys(datosAgrupados).map(tipo => ({
                        name: tipo,
                        value: datosAgrupados[tipo]
                    }));

                resolve(datosFormateados);
            },
            error: function (xhr, status, error) {
                console.error("Error al obtener datos del servlet para el gráfico 1", error);
                reject(error);
            }
        });
    });
};


const obtenerProductosPorMes = () => {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: "/amanda-cell-sistema/obtenerProductosPorMes",
            type: "GET",
            dataType: "json",
            success: function (data) {
                console.log("Datos obtenidos del servlet para el gráfico 2:", data);
                resolve(data);
            },
            error: function (xhr, status, error) {
                console.error("Error al obtener datos del servlet para el gráfico 2", error);
                reject(error);
            }
        });
    });
};

const initCharts = async () => {
    const chart1 = echarts.init(document.getElementById("chart1"));
    const chart2 = echarts.init(document.getElementById("chart2"));

    try {
        const dataChart1 = await obtenerTiposProductos();
        console.log("Datos para el gráfico 1:", dataChart1);

        const dataChart2 = await obtenerProductosPorMes();
        console.log("Datos para el gráfico 2:", dataChart2);

        const optionChart1 = getOptionChart1(dataChart1);
        chart1.setOption(optionChart1);

        const optionChart2 = getOptionChart2(dataChart2);
        chart2.setOption(optionChart2);
    } catch (error) {
        console.error("Error en la inicialización de gráficos:", error);
    }
};

// Llamar a initCharts cuando la página se cargue completamente
window.addEventListener("load", initCharts);
