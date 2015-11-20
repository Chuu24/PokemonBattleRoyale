function myFun(e){ 
    var pokemon = e.target.innerText;
    var elem = document.getElementById("nombrePokemonSel");
    elem.value = pokemon;
    document.forms["myform"].submit();
}
