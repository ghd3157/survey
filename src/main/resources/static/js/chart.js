$(function(){
    console.log("HERE!!");

    $.ajax({
        url: "/sysman/getChartData",
        type:'post',
        dataType: 'json',
        async: false,
        success: function (jsonData) {
            console.log(jsonData);
            for(var i=0; i<30; i++){
                myLineChart.data.labels[i] = jsonData[i].date;
                myLineChart.data.datasets[0].data[i] = jsonData[i].val;
            }
            myLineChart.update();
        }
    })

});


function insertMemo(param,id) {
    var memo = $('#memo'+param+'').val();

    var allData = {"memo": memo, "id":id};

    $.ajax({
        url: "/sysman/insertMemo",
        type: "POST",
        data: allData,
        success: function () {
            alert("메모 저장");
        },
        error:function () {
            alert("에러발생1");
            self.close();
        }
    });

    /*console.log("memo>>>" + memo);
    console.log("param>>>" + param);
    console.log("id>>>" + id);*/

}

function changePay(num,index,pay) {


    var data = {"id":num};//ID
    var reload = $('#pay'+index+'');

    $.ajax({
        url: "/sysman/changePay",
        type: "POST",
        data: data,
        success: function () {

            alert("변경완료");
            switch(reload.text()) {
                case "O": reload.text("X");break;
                case "X": reload.text("O");break;
            }
        },
        error:function () {
            alert("에러발생2");
        }
    });
}

function inserCounselor(id,index) {

   var name = $('#counselor' + index+'').val();
   var allData = {"name":name, "id":id };
   // name = 상담사 , id = userNum(PK)

    $.ajax({
        url: "/sysman/changeCounselor",
        type: "POST",
        data: allData,
        success: function () {

        },
        error:function () {
            alert("에러발생3");
        }
    });


}

function changeCount() {

    var count = $('#count').val();

    var data = {"count":count};

    console.log("count>>>>>>>" + count);

    $.ajax({
        url: "/sysman/changeCount",
        type: "POST",
        data: data,
        success: function () {
            alert("변경완료");
        },
        error:function () {
            alert("에러발생4");
        }
    });

}