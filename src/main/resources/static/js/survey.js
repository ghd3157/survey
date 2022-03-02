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
        x[currentTab].style.display = "none";
        currentTab = currentTab + n;
    if (currentTab >= x.length) {

        document.getElementById("nextprevious").style.display = "none";
        // document.getElementById("all-steps").style.display = "none";
        document.getElementById("register").style.display = "none";
        document.getElementById("text-message").style.display = "block";


        $.ajax({
            url: "/user/surveyPage/dataSend",
            type: "POST",
            data: allData,
            success:function () {
                alert("성공");
            },
            error:function () {
                alert("에러발생");
                self.close();
            }
        });

    }
    showTab(currentTab);
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

        if(z[h].name == "adv"){
            if(!$("input:checked[name=adv]").is(":checked")){
                document.getElementById("adval").style.display = "block";
                valid=false;
            } else{
                document.getElementById("adval").style.display = "none";
                valid=true;
            }
        }

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
            if(phone.trim() ==''){
                document.getElementById("phoneval").style.display = "block";
                valid=false;
            }else if(!(phone.trim() == '')){
                document.getElementById("phoneval").style.display = "none";
            }
            else if(!(phone.trim() =='') && !(name.trim() == '')){
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