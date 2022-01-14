function checkForm(){
  var p_nametip = checkProductName();
  var p_categorytip=checkPCSelect();
  var p_attribute_categorytip=checkPACSelect();
  return p_nametip&&p_categorytip&&p_attribute_categorytip;
}

function checkProductName() {
    if(document.getElementById("p_name")==null)return true;
	var value = document.getElementById("p_name").value;
	var hint = document.getElementById("name_hint");
	if(value.length < 3) {
		hint.innerHTML = "太短";
		return false;
	} else {
		return true;
	}
}

function checkPCSelect(){
    if(document.getElementById("PCSelect")==null)return true;
    var myselect= document.getElementById("PCSelect");
    var hint = document.getElementById("PC_hint");
    var index=myselect.selectedIndex;
        if(myselect.options[index].value=="") {
            hint.innerHTML = "未选";
            return false;
        }
        else{
            return true;
        }
}

function checkPACSelect(){
    if(document.getElementById("PACSelect")==null)return true;
    var myselect= document.getElementById("PACSelect");
    var hint = document.getElementById("PAC_hint");
    var index=myselect.selectedIndex;
        if(myselect.options[index].value=="") {
            hint.innerHTML = "未选";
            return false;
        }
        else{
            return true;
        }
}