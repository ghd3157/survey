var currentTab = 0;
document.addEventListener("DOMContentLoaded", function(event) {

    showTab(currentTab);

});

function showTab(n) {
    var x = document.getElementsByClassName("tab");
    x[n].style.display = "block";
    if (n == 0) {
        document.getElementById("prevBtn").style.display = "none";
    } else {
        document.getElementById("prevBtn").style.display = "inline";
    }
    if (n == (x.length - 1)) {
        document.getElementById("nextBtn").innerHTML = '<i class="fa fa-angle-double-right"></i>';
    } else {
        document.getElementById("nextBtn").innerHTML = '<i class="fa fa-angle-double-right"></i>';
    }
    // fixStepIndicator(n)
}

function nextPrev(n) {
    var x = document.getElementsByClassName("tab");

    var objective = [];
    var education = [];
    var advice = [];
    var name = $("#name").val();
    var phone = $("#phone").val();

    $("input[name=obj]:checked").each(function () {
        objective.push($(this).val());
    });

    $("input[name=edu]:checked").each(function () {
        education.push($(this).val());
    });

    $("input[name=adv]:checked").each(function () {
        advice.push($(this).val());
    });

    var allData = {"name": name, "phone":phone , "objective":objective ,
                    "education":education, "advice":advice};

    if (n == 1 && !validateForm())
        return false;

    if(currentTab < x.length - 1) {
        x[currentTab].style.display = "none";
        currentTab = currentTab + n;
    }else {
        currentTab = currentTab + n;
    }

    if (currentTab >= x.length) {

        // document.getElementById("nextprevious").style.display = "none";
        // document.getElementById("all-steps").style.display = "none";
        // document.getElementById("register").style.display = "none";
        // document.getElementById("text-message").style.display = "none";


        $.ajax({
            url: "/user/surveyPage/dataSend",
            type: "POST",
            data: allData,
            success:function () {
                location.href='/user/surveyPage/finish';
            },
            error:function () {
                self.close();
            }
        });

    }else{
        showTab(currentTab);
    }

}

function validateForm() {
    var x, y, i, z, h, valid = true;
    x = document.getElementsByClassName("tab");
    y = x[currentTab].getElementsByTagName("input");
    z = x[currentTab].getElementsByClassName("form-check-input");

    for (h = 0; h < z.length; h++){
        if(z[h].name == "obj"){
            if(!$("input:checked[name=obj]").is(":checked")){
                document.getElementById("objval").style.display = "block";
                valid=false;
            } else{
                document.getElementById("objval").style.display = "none";
                valid=true;
            }
        }

/*        if(z[h].name == "adv"){
            if(!$("input:checked[name=adv]").is(":checked")){
                document.getElementById("adval").style.display = "block";
                valid=false;
            } else{
                document.getElementById("adval").style.display = "none";
                valid=true;
            }
        }*/

        if(z[h].name == "edu"){
            var len = $("input[name=edu]:checkbox:checked").length;
            console.log(len);
            if( len == 1){
                document.getElementById("eduval").style.display = "none";
                valid=true;
            } else{
                document.getElementById("eduval").style.display = "block";
                valid=false;
            }
        }
    }


    for (i = 0; i < y.length; i++) {
        if(y[i].id=="name"){
            var name = $("#name").val();
            if(name.trim() ==''){
                document.getElementById("nameval").style.display = "block";
                valid=false;
            }else if(!(name.trim() =='')){
                document.getElementById("nameval").style.display = "none";
                valid=true;
            }
        }

        if(y[i].id=="phone"){
            var phone = $("#phone").val();

            // 핸드폰번호 첫/두번째 자리는 01로 시작하며 세번째 자리는 01+0/1/6/7/8/9 가 될 수 있다.
            // 번호 사이사이 대쉬('-')는 사용자가 작성하든 안하든 무시한다.
            // 번호 두번째,세번째 마디는 4자리가 가능하며 숫자는 0-9까지 들어올 수 있다.
            var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/;

            /*if(phone.trim() ==''){
                document.getElementById("phoneval").style.display = "block";
                valid=false;
            }else if(!(phone.trim() == '')){
                document.getElementById("phoneval").style.display = "none";
            }
            else if(!(phone.trim() =='') && !(name.trim() == '')){
                document.getElementById("phoneval").style.display = "none";
                valid=true;
            }*/
            if(regPhone.test(phone) === false){
                document.getElementById("phoneval").style.display = "block";
                valid=false;
            }else if(regPhone.test(phone) === true){
                document.getElementById("phoneval").style.display = "none";
            }else if((regPhone.test(phone) === true) && !(name.trim() == '')){
                document.getElementById("phoneval").style.display = "none";
                valid=true;
            }
        }


    }

        if (valid) {
            // document.getElementsByClassName("step")[currentTab].className +=" finish" ;
    }
            return valid;
}

//     function fixStepIndicator(n) {
//     var i, x=document.getElementsByClassName("step");
//
//     for (i=0; i < x.length; i++) {
//         x[i].className=x[i].className.replace(" active", "" );
//     }
//         x[n].className +=" active" ;
// }