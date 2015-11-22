function showProfile(name){
    //alert(name);
    var elem = document.getElementById("pony");
    elem.value = name;
    document.forms["myForm"].submit();
}
