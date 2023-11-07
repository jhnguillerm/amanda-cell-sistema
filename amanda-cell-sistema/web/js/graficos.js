const initChart=() => {
    const chart1 = echarts.init(document.getElementById("chart1"));
    const chart2 = echarts.init(document.getElementById("chart2"));
};

window.addEventListener("load", () => {
    initChart();
});

