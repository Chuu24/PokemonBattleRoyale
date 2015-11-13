var lats = 47.651968;
var lons = 9.478485;

function init(){
    //Las funciones para los marcadores arrastrables la obtuve de aquí:
    //http://stackoverflow.com/questions/5290336/getting-lat-lng-from-google-marker
    
    var map = new google.maps.Map(document.getElementById('map_canvas'), {
        zoom: 1,
        center: new google.maps.LatLng(35.137879, -82.836914),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var myMarker = new google.maps.Marker({
        position: new google.maps.LatLng(47.651968, 9.478485),
        draggable: true
    });

    google.maps.event.addListener(myMarker, 'dragend', function (evt) {
        lats = evt.latLng.lat().toFixed(3);
        lons = evt.latLng.lng().toFixed(3);
        $.ajax({
            type: 'POST',
            url: './explorarPokemon',
            data: {latitud: lats,
                longitud: lons},
            success: function(data){
                if(data[0] === 'N'){
                    $("#encontrados").html('Nothing yet...');
                }else{
                    var p = JSON.parse(data);
                    var htmls = "";
                    $.each(p.pokemons, function(index, value){
                        htmls += "<form action=\"./capturaPokemon\" method=\"POST\">" 
                                + "A wild "+ value.name + " appeared!"
                                + "<input type=\"hidden\" value=\"" + value.id + "\" name=\"idPoke\" />"
                                + "<input type=\"hidden\" value=\"" + value.level + "\" name=\"nivel\" />"
                                + "<input type=\"submit\" value=\"Fight\" /><br />"
                            + "</form>";
                    });
                    $("#encontrados").html(htmls);
                }
            }
        });
    });

    google.maps.event.addListener(myMarker, 'dragstart', function (evt) {
    });

    map.setCenter(myMarker.position);
    myMarker.setMap(map);
}