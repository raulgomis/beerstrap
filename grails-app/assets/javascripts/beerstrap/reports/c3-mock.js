$(function () {
    var chart = c3.generate({
        bindto: '#chart',
        axis: { y: { show: false } },
        data: {
            columns: [
                ['data1', 30, 200, 100, 400, 150, 250, 30, 200, 100, 400, 150, 250, 10, 140, 10, 210, 250, 90, 10, 140, 10, 210, 250, 90],
                ['data2', 130, 100, 140, 200, 150, 50, 200, 100, 400, 150, 250, 200, 30, 200, 100, 400, 150, 250, 30, 200, 100, 400, 150, 250],
                ['data3', 10, 140, 10, 210, 250, 90, 10, 140, 10, 210, 250, 90, 130, 100, 140, 200, 150, 50, 200, 100, 400, 150, 250, 20]
            ],
            colors: {
                data1: "#FFA93C",
                data2: "#f57943",
                data3: "#EA494A"
            },
            type: 'bar',
            groups: [
                ['data1', 'data2', 'data3']
            ]
        },
        bar: {
            width: {
                ratio: 0.9
            }
        }
    });

    var chart2 = c3.generate({
        bindto: '#chart2',
        data: {
            // iris data from R
            columns: [
                ['data1', 30],
                ['data2', 120]
            ],
            type : 'pie',
            onclick: function (d, i) { console.log("onclick", d, i); },
            onmouseover: function (d, i) { console.log("onmouseover", d, i); },
            onmouseout: function (d, i) { console.log("onmouseout", d, i); }
        }
    });

    var chart3 = c3.generate({
        bindto: '#chart3',
        data: {
            columns: [
                ['data1', 30, 20, 50, 40, 60, 50],
                ['data2', 200, 130, 90, 240, 130, 220],
                ['data3', 300, 200, 160, 400, 250, 250],
                ['data4', 200, 130, 90, 240, 130, 220],
                ['data5', 130, 120, 150, 140, 160, 150],
                ['data6', 90, 70, 20, 50, 60, 120]
            ],
            type: 'bar',
            types: {
                data3: 'spline',
                data4: 'line',
                data6: 'area'
            },
            groups: [
                ['data1','data2']
            ]
        },
        subchart: {
            show: true
        }
    });
});
