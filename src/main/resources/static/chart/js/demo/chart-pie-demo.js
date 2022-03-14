// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");

$(document).ready(function () {
 //ajax data
    $.ajax({
        url: "/sysman/getChart",
        type: "POST",
        success: function (data) {
            console.log(Object.keys(data));
            console.log(Object.values(data));
            var key = Object.keys(data);
            var val = Object.values(data);
            var list = new Array();

            for(var i=0;i< key.length; i++){
                var v = val[i]
                console.log(v)
            }
            /*http://www.gisdeveloper.co.kr/?p=11055 */

        },
        error:function () {
            // alert("에러발생5");
        }
    });

})

var config = {
    type: 'doughnut',
    data: {
        labels: ["홍길동", "임꺽정", "장길산", "최민식"],
        datasets: [{
            data: [50, 30, 10, 10],
            backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#cc2b04'],
            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#cc2300'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
        }],
    },
    options: {
        maintainAspectRatio: false,
        tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 1,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
        },
        legend: {
            display: false
        },
        cutoutPercentage: 80,
    },
};

var myChart = new Chart(ctx, config);